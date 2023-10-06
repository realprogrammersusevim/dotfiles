use chrono::prelude::Local;
use std::env::var;
use std::process::Command;

fn main() {
    let name = var("NAME")
        .expect("Something went horribly wrong and Sketchybar didn't create the $NAME env var"); // Just panic and end the program
    let dt = Local::now();
    let formatted = dt.format("%a, %h %e - %l:%M").to_string();

    Command::new("sketchybar")
        .arg("--set")
        .arg(name)
        .arg(format!("label={formatted}"))
        .output()
        .expect("Could not config sketchybar");
}
