use std::process::{Command, Output, Stdio};
use std::io::{BufRead, BufReader};

fn get_volume() -> u8 {
    let result = Command::new("pamixer")
        .arg("--get-volume")
        .output()
        .expect("Failed to get volume");
   let stdout = String::from_utf8(result.stdout)
        .expect("output isn't a u8");
    stdout
        .trim()
        .parse::<u8>()
        .expect("Couldn't parse the stdout")
}

fn _update_volume(volume_level: u8, bar_open: &mut bool) {
    Command::new("eww")
        .arg("update")
        .arg(format!("volume={}",volume_level))
        .output()
        .expect("Couldn't update volume");
    _open_eww(bar_open);
}

fn _open_eww(bar_open: &mut bool) {
    if *bar_open == true{return}
    Command::new("eww")
        .arg("open")
        .arg("volume-bar")
        .output()
        .expect("Failed to open volume bar");
    *bar_open = true;
}
fn _close_eww(bar_open: &mut bool) {
    Command::new("eww")
        .arg("close")
        .arg("volume-bar")
        .output()
        .expect("Failed to close volume bar");
    *bar_open = false;
}

fn main() -> std::io::Result<()> {
    let mut bar_open: bool = false;
    
    let mut current_volume: u8 = 50;

    let mut proc = Command::new("pactl")
        .arg("subscribe")
        .stdout(Stdio::piped())
        .spawn()
        .expect("Failed to read pactl");

    let stdout = proc.stdout.take().expect("Failed to take ownership of stdout");
    
    let reader = BufReader::new(stdout);

    for line in reader.lines(){
        let line = line?;
        if line.to_lowercase().contains("sink"){    
            let volume: u8 = get_volume();
            if volume != current_volume {
                _update_volume(volume, &mut bar_open);
                println!("Updating bar");
            }

        }
    }

    Ok(())

}
