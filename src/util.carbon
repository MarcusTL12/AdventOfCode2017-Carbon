package AoC api;

fn IsPos(var a: i32) -> Bool {
    var ma: i32 = -a;

    while (not (a == 0) and not (ma == 0)) {
        a = a - 1;
        ma = ma - 1;
    }

    return a == 0 and not (ma == 0);
}

fn IsLess(a: i32, b: i32) -> Bool {
    return IsPos(b - a);
}

fn MinMax(a: i32, b: i32) -> (i32, i32) {
    if (IsLess(a, b)) {
        return (a, b);
    } else {
        return (b, a);
    }
}

// Only works for positive values!
fn DivMod(var a: i32, b: i32) -> (i32, i32) {
    var i: i32 = 0;

    while (IsLess(b, a) or a == b) {
        a = a - b;
        i = i + 1;
    }

    return (i, a);
}

fn Div(a: i32, b: i32) -> i32 {
    let (q: i32, _: i32) = DivMod(a, b);
    return q;
}

fn Mod(a: i32, b: i32) -> i32 {
    let (_: i32, r: i32) = DivMod(a, b);
    return r;
}

fn Abs(a: i32) -> i32 {
    if (IsPos(a)) {
        return a;
    } else {
        return -a;
    }
}
