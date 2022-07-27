package Day3 api;

let inp: i32 = 289326;

fn Part1() {
    var x: i32 = 0;
    var y: i32 = 0;

    var dx: i32 = 1;
    var dy: i32 = 1;
    var n: i32 = 1;

    var i: i32 = 1;
    var done: Bool = false;
    while (not done) {
        var nx: i32 = n;
        while (not (nx == 0) and not done) {
            x = x + dx;
            i = i + 1;
            if (i == inp) {
                done = true;
            }
            nx = nx - 1;
        }
        dx = -dx;

        var ny: i32 = n;
        while (not (ny == 0) and not done) {
            y = y + dy;
            i = i + 1;
            if (i == inp) {
                done = true;
            }
            ny = ny - 1;
        }
        dy = -dy;

        n = n + 1;
    }

    let ans: i32 = Abs(x) + Abs(y);
    Print("Part 1: {0}", ans);
}

fn Part2() {
    let w: i32 = 12;

    var grid: [i32; 144] = (
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    );
    var line: [i32; 144] = grid;

    let center: i32 = 6;

    var x: i32 = center;
    var y: i32 = center;
    var dx: i32 = 1;
    var dy: i32 = 1;
    var n: i32 = 1;
    var i: i32 = 0;

    grid[x + y * w] = 1;

    var done: Bool = false;
    while (not done) {
        var nx: i32 = n;
        while (not (nx == 0) and not done) {
            x = x + dx;
            if (x == 0 or x == (w - 1)) {
                done = true;
            } else {
                nx = nx - 1;

                let sum: i32 = grid[(x - 1) + (y - 1) * w] +
                               grid[x + (y - 1) * w] +
                               grid[(x + 1) + (y - 1) * w] +
                               grid[(x + 1) + y * w] +
                               grid[(x + 1) + (y + 1) * w] +
                               grid[x + (y + 1) * w] +
                               grid[(x - 1) + (y + 1) * w] +
                               grid[(x - 1) + y * w];

                grid[x + y * w] = sum;
                line[i] = sum;
                i = i + 1;
            }
        }
        dx = -dx;

        var ny: i32 = n;
        while (not (ny == 0) and not done) {
            y = y + dx;
            if (y == 0 or y == (w - 1)) {
                done = true;
            } else {
                ny = ny - 1;

                let sum: i32 = grid[(x - 1) + (y - 1) * w] +
                               grid[x + (y - 1) * w] +
                               grid[(x + 1) + (y - 1) * w] +
                               grid[(x + 1) + y * w] +
                               grid[(x + 1) + (y + 1) * w] +
                               grid[x + (y + 1) * w] +
                               grid[(x - 1) + (y + 1) * w] +
                               grid[(x - 1) + y * w];

                grid[x + y * w] = sum;
                line[i] = sum;
                i = i + 1;
            }
        }
        dy = -dy;

        n = n + 1;
    }

    var lo: i32 = 0;
    var hi: i32 = i - 1;

    while (not ((hi - lo) == 1)) {
        let mid: i32 = lo + Div(hi - lo, 2);

        if (IsLessPos(line[mid], inp)) {
            lo = mid;
        } else {
            hi = mid;
        }
    }

    Print("Part 2: {0}", line[hi]);
}

fn Main() -> i32 {
    Part1();
    Part2();

    return 0;
}
