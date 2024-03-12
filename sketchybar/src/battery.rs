mod icons;

use battery::units::ratio::percent;
use battery::units::time::minute;
use battery::Manager;
use battery::State::*;
use redis::Commands;
use std::env::var;
use std::process::Command;

fn main() {
    let name = var("NAME").unwrap();

    let manager = Manager::new().expect("Couldn't create a battery manager");
    let battery = manager
        .batteries()
        .unwrap()
        .next()
        .unwrap()
        .expect("Couldn't get a battery");

    let (minutes_left, curr_state) = match battery.state() {
        Charging => (
            battery.time_to_full().unwrap().get::<minute>(),
            "charging".to_string(),
        ),
        Discharging => (
            battery.time_to_empty().unwrap().get::<minute>(),
            "discharging".to_string(),
        ),
        _ => (0.0, "discharging".to_string()),
    };
    let rounded_minutes_left: usize = minutes_left.round() as usize;

    // Open the Redis database
    let client =
        redis::Client::open("redis://127.0.0.1:6379").expect("Couldn't open the Redis database");
    let mut con = client
        .get_connection()
        .expect("Couldn't connect to the opened Redis database");

    // Were we charging or discharging before?
    let prev_state: String = redis::cmd("GET")
        .arg("prev_state")
        .query::<String>(&mut con)
        .unwrap_or(curr_state.to_string());
    // What were our prev time to empty or full?
    let mut prev_times: Vec<usize> = redis::cmd("LRANGE")
        .arg("time_remaining")
        .arg(0)
        .arg(-1) // The end
        .query::<Vec<usize>>(&mut con)
        .unwrap_or(vec![rounded_minutes_left]);

    // Average out the previous times.
    // Assigning variables to the output of if statements is so cool
    let avg_minutes: usize = if curr_state == prev_state {
        // Whatever we were doing before can continue
        prev_times.reverse();
        prev_times.push(rounded_minutes_left);
        let alpha = 2.0 / (prev_times.len() as f64 + 1.0);

        let mut ema = prev_times[0] as f64;
        for time in prev_times {
            ema = alpha * (time as f64 - ema) + ema;
        }
        ema.round() as usize
    } else {
        // We either starting charging or discharging and we need a clean slate for our times
        con.set::<&str, String, bool>("prev_state", curr_state.to_string())
            .expect("Couldn't write the state to redis");
        con.del::<&str, bool>("prev_times")
            .expect("Couldn't delete the previous times.");
        600 // The time returned is always wildly off so just return 10 hrs
    };

    con.lpush::<&str, usize, bool>("time_remaining", rounded_minutes_left)
        .expect("Couldn't write the times to Redis");
    con.ltrim::<&str, bool>("time_remaining", 0, 10)
        .expect("Couldn't trim list");
    let hours = avg_minutes / 60;
    let minutes = avg_minutes % 60; // Remainder after you divide by 60

    let percentage = battery.state_of_charge().get::<percent>().round() as u32;

    let icons = icons::Icons::default();

    let batt_icon: String = if curr_state == "discharging" {
        match percentage {
            90..=100 => icons.battery_100,
            60..=89 => icons.battery_75,
            30..=59 => icons.battery_50,
            10..=29 => icons.battery_25,
            0..=9 => icons.battery_0,
            _ => {
                panic!("Something is really wrong with this battery, just stop the program.")
            }
        }
    } else {
        icons.charging
    };

    Command::new("sketchybar")
        .arg("--set")
        .arg(name)
        .arg(format!("icon={batt_icon}"))
        .arg(format!("label={percentage}% {hours}:{minutes:0>2}"))
        .output()
        .expect("Something went wrong configuring sketchybar");
}
