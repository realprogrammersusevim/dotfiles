pub struct Icons {
    pub battery_100: String,
    pub battery_75: String,
    pub battery_50: String,
    pub battery_25: String,
    pub battery_0: String,
    pub charging: String,
}

impl Default for Icons {
    fn default() -> Self {
        Icons {
            battery_100: "􀛨".to_string(),
            battery_75: "􀺸".to_string(),
            battery_50: "􀺶".to_string(),
            battery_25: "􀛩".to_string(),
            battery_0: "􀛪".to_string(),
            charging: "􀋦".to_string(),
        }
    }
}
