use std::thread;
use std::time::{Duration, Instant};
use std::process::{Command, Stdio};
use std::io::{BufRead, BufReader};
use std::sync::{Arc, Mutex};
use std::sync::mpsc::{self, Sender};

fn get_volume() -> u8 {
    let result = Command::new("pamixer")
        .arg("--get-volume")
        .output()
        .expect("Failed to get volume");
    let stdout = String::from_utf8(result.stdout).expect("output isn't a u8");
    stdout.trim().parse::<u8>().expect("Couldn't parse volume")
}

fn update_volume(volume: u8, bar_open: &Arc<Mutex<bool>>) {
    Command::new("/usr/bin/eww")
        .arg("update")
        .arg(format!("volume={}", volume))
        .output()
        .ok();

    let mut open = bar_open.lock().unwrap();
    if !*open {
        Command::new("/usr/bin/eww")
            .arg("open")
            .arg("volume-bar")
            .output()
            .ok();
        *open = true;
    }
}


fn close_bar(bar_open: &mut bool) {
    if *bar_open {
        Command::new("eww")
            .arg("close")
            .arg("volume-bar")
            .output()
            .expect("Failed to close bar");
        *bar_open = false;
    }
}

fn main() -> std::io::Result<()> {
    let timeout = Duration::from_secs(1);
    let mut bar_open = false;
    let mut current_volume = get_volume();

    // Channel to signal timer resets
    let (tx, rx) = mpsc::channel::<()>();
    let bar_open_clone = Arc::new(Mutex::new(bar_open));

    // Timer thread
    let bar_open_for_thread = Arc::clone(&bar_open_clone);
    thread::spawn(move || {
        let mut last_update = Instant::now();
        loop {
            if let Ok(_) = rx.try_recv() {
                last_update = Instant::now(); // reset timer
            }
            if last_update.elapsed() >= timeout {
                let mut bar_open = bar_open_for_thread.lock().unwrap();
                if *bar_open {
                    Command::new("eww")
                        .arg("close")
                        .arg("volume-bar")
                        .output()
                        .ok();
                    *bar_open = false;
                    println!("Timer ended: bar closed");
                }
                last_update = Instant::now(); // prevent repeated closing
            }
            thread::sleep(Duration::from_millis(50));
        }
    });

    // Main loop: listen to pactl
    let mut proc = Command::new("pactl")
        .arg("subscribe")
        .stdout(Stdio::piped())
        .spawn()
        .expect("Failed to start pactl");

    let stdout = proc.stdout.take().expect("Failed to take stdout");
    let reader = BufReader::new(stdout);

    for line in reader.lines() {
        let line = line?;
        if line.to_lowercase().contains("sink") {
            let volume = get_volume();
            if volume != current_volume {
                current_volume = volume;

                // update bar
                update_volume(volume, &bar_open_clone);

                println!("Updating bar, timer reset");
                tx.send(()).ok(); // reset timer
            }
        }
    }

    Ok(())
}

