use std::process::Command;

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
        .arg(format!("volume={}",volume_level));
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

fn main() {
    let volume: u8 = get_volume();
    let mut bar_open: bool = false;
    println!("Volume changed, Updating bar.");
    _update_volume(volume, &mut bar_open);
}
