#[derive(Debug)]
enum Direction {North, South, East, West}

fn is_north(dir: Direction) -> bool {
    match dir {
        Direction::North => true,
        _ => false,
    }
}

extern {
    fn emscripten_exit_with_live_runtime();
}

fn main() {
    unsafe {
        emscripten_exit_with_live_runtime();
    }
}
