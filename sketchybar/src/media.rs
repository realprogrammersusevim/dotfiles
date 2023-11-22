use serde::Deserialize;
use std::{env::var, process::Command};

#[derive(Deserialize, Debug)]
struct MediaInfo {
    state: String,
    title: String,
    album: String,
    artist: String,
    app: String,
}

fn main() {
    let info: MediaInfo = serde_json::from_str(&var("INFO").unwrap()).unwrap();

    if info.state != "playing" {
        return; // If nothing is playing, end as quickly as possible
    }

    let name = var("NAME").unwrap();
    let formatted_info = format!(
        "{}: {} - {}",
        if info.app == "Music" {
            // If we're playing music show the album instead of the app
            info.album
        } else {
            info.app
        },
        info.title,
        info.artist,
    );

    Command::new("sketchybar")
        .arg("--set")
        .arg(name)
        .arg("label=".to_owned() + &formatted_info)
        .output()
        .expect("Could not config sketchybar");
}
