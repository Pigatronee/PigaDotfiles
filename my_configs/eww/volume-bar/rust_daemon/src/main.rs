use std::io::{BufRead, BufReader};
use std::process::{Command, Stdio};

fn get_volume() -> i32 {
    // Placeholder for your actual volume-getting logic
    50
}

fn update_volume(vol: i32) {
    println!("Updating volume to {}", vol);
}

fn main() {
    let mut current_volume: i32 = 0;

    let mut proc = Command::new("pactl")
        .arg("subscribe")
        .stdout(Stdio::piped())
        .spawn()
        .expect("failed to start pactl");

    let stdout = proc.stdout.take().expect("Failed to capture stdout");
    let reader = BufReader::new(stdout);

    for line in reader.lines() {
        let line = line.expect("Failed to read line");
        if line.to_lowercase().contains("sink") {
            let vol = get_volume();
            if vol != current_volume {
                update_volume(vol);
                current_volume = vol;
            }
        }
    }
}

