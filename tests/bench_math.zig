// tri-math Benchmarks
const std = @import("std");
const tri_math = @import("tri-math");

pub fn main() !void {
    std.debug.print("tri-math Benchmarks\n", .{});
    std.debug.print("==================\n\n", .{});

    // Benchmark Fibonacci
    try benchFibonacci();

    // Benchmark IsPrime
    try benchIsPrime();

    // Benchmark GCD
    try benchGCD();

    // Benchmark Phi Power
    try benchPhiPower();
}

fn benchFibonacci() !void {
    std.debug.print("Fibonacci(50):\n", .{});

    var timer = try std.time.Timer.start();
    const iterations = 10000;

    timer.reset();
    var i: usize = 0;
    while (i < iterations) : (i += 1) {
        _ = tri_math.fibonacci(50);
    }
    const elapsed_ns = timer.read();

    const avg_ns = @as(f64, @floatFromInt(elapsed_ns)) / @as(f64, @floatFromInt(iterations));
    std.debug.print("  10000 iterations: {d:.2} ns avg\n", .{avg_ns});
    std.debug.print("  Result: {d}\n\n", .{tri_math.fibonacci(50)});
}

fn benchIsPrime() !void {
    std.debug.print("IsPrime(999983):\n", .{});

    var timer = try std.time.Timer.start();
    const iterations = 10000;

    timer.reset();
    var i: usize = 0;
    while (i < iterations) : (i += 1) {
        _ = tri_math.isPrime(999983);
    }
    const elapsed_ns = timer.read();

    const avg_ns = @as(f64, @floatFromInt(elapsed_ns)) / @as(f64, @floatFromInt(iterations));
    std.debug.print("  10000 iterations: {d:.2} ns avg\n", .{avg_ns});
    std.debug.print("  Result: {}\n\n", .{tri_math.isPrime(999983)});
}

fn benchGCD() !void {
    std.debug.print("GCD(1071, 462):\n", .{});

    var timer = try std.time.Timer.start();
    const iterations = 100000;

    timer.reset();
    var i: usize = 0;
    while (i < iterations) : (i += 1) {
        _ = tri_math.gcd(1071, 462);
    }
    const elapsed_ns = timer.read();

    const avg_ns = @as(f64, @floatFromInt(elapsed_ns)) / @as(f64, @floatFromInt(iterations));
    std.debug.print("  100000 iterations: {d:.2} ns avg\n", .{avg_ns});
    std.debug.print("  Result: {d}\n\n", .{tri_math.gcd(1071, 462)});
}

fn benchPhiPower() !void {
    std.debug.print("Phi Power(100):\n", .{});

    var timer = try std.time.Timer.start();
    const iterations = 100000;

    timer.reset();
    var i: usize = 0;
    while (i < iterations) : (i += 1) {
        _ = tri_math.sacred.phiPower(100);
    }
    const elapsed_ns = timer.read();

    const avg_ns = @as(f64, @floatFromInt(elapsed_ns)) / @as(f64, @floatFromInt(iterations));
    std.debug.print("  100000 iterations: {d:.2} ns avg\n", .{avg_ns});
    std.debug.print("  Result: {d:.10}\n\n", .{tri_math.sacred.phiPower(100)});
}
