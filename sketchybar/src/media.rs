use serde::Deserialize;
use std::{env::var, process::Command};
use unicode_segmentation::UnicodeSegmentation;

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
        "{}: {}  {}",
        if info.app == "Music" {
            // If we're playing music show the album instead of the app
            concat(&info.album, 20)
        } else {
            info.app
        },
        concat(&info.title, 20),
        concat(&info.artist, 20)
    );

    Command::new("sketchybar")
        .arg("--set")
        .arg(name)
        .arg("label=".to_owned() + &formatted_info)
        .output()
        .expect("Could not config sketchybar");
}

fn concat(input: &str, length: usize) -> String {
    let mut string: Vec<&str> = input.graphemes(true).collect::<Vec<&str>>(); // Unicode support
    if string.len() > length {
        string = string[..length].to_vec();
        string.push("…");
    }

    string.join("")
}
