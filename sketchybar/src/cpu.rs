use core::time::Duration;
use std::process::Command;
use std::{env::var, thread::sleep};
use sysinfo::{CpuExt, CpuRefreshKind, RefreshKind, System, SystemExt};

fn main() {
    let name = var("NAME").expect("Couldn't get $NAME var");
    let mut s =
        System::new_with_specifics(RefreshKind::new().with_cpu(CpuRefreshKind::everything()));
    s.refresh_cpu();
    sleep(Duration::from_millis(100));
    s.refresh_cpu();

    // Divide by the number of CPUs to make the max 100%
    let usage: f32 = s.cpus().iter().map(|x| x.cpu_usage()).sum::<f32>() / s.cpus().len() as f32;
    println!("{usage}");

    Command::new("sketchybar")
        .arg("--set")
        .arg(name)
        .arg(format!("label={}%", usage.round()))
        .output()
        .expect("Couldn't config sketchybar");
}
