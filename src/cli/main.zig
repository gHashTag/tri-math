// tri-math CLI — Sacred Mathematics Command Line Tool
// φ² + 1/φ² = 3 = TRINITY

const std = @import("std");
const tri_math = @import("tri-math");

const stdlib = tri_math.stdlib;
const sacred = tri_math.sacred;

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        printHelp();
        return;
    }

    const command = args[1];

    if (std.mem.eql(u8, command, "help") or std.mem.eql(u8, command, "-h") or std.mem.eql(u8, command, "--help")) {
        printHelp();
    } else if (std.mem.eql(u8, command, "constants") or std.mem.eql(u8, command, "const")) {
        showConstants();
    } else if (std.mem.eql(u8, command, "phi")) {
        try showPhiPower(args);
    } else if (std.mem.eql(u8, command, "fib")) {
        try showFibonacci(args);
    } else if (std.mem.eql(u8, command, "trinity")) {
        showTrinityIdentity();
    } else if (std.mem.eql(u8, command, "formula")) {
        try showFormula(args);
    } else if (std.mem.eql(u8, command, "prime")) {
        try showPrime(args);
    } else {
        std.debug.print("Unknown command: {s}\n\n", .{command});
        printHelp();
    }
}

fn printHelp() void {
    std.debug.print("tri-math — Sacred Mathematics CLI v0.1.0\n", .{});
    std.debug.print("φ² + 1/φ² = 3 = TRINITY\n\n", .{});
    std.debug.print("Usage: tri-math <command> [args]\n\n", .{});
    std.debug.print("Commands:\n", .{});
    std.debug.print("  help, -h, --help    Show this help message\n", .{});
    std.debug.print("  constants, const    Display sacred constants\n", .{});
    std.debug.print("  phi <n>            Calculate phi^n\n", .{});
    std.debug.print("  fib <n>            Calculate Fibonacci(n)\n", .{});
    std.debug.print("  trinity            Verify Trinity identity\n", .{});
    std.debug.print("  formula <n> <k> <m> <p> <q>  Sacred formula\n", .{});
    std.debug.print("  prime <n>          Check if n is prime\n", .{});
}

fn showConstants() void {
    const GREEN = "\x1b[32m";
    const GOLD = "\x1b[33m";
    const CYAN = "\x1b[36m";
    const RESET = "\x1b[0m";

    std.debug.print("{s}{s}╔══════════════════════════════════════════════════════════════════╗{s}\n", .{ GOLD, "", RESET });
    std.debug.print("{s}{s}║           SACRED MATHEMATICS CONSTANTS                        ║{s}\n", .{ CYAN, "", RESET });
    std.debug.print("{s}{s}║           φ² + 1/φ² = 3 = TRINITY                           ║{s}\n", .{ GOLD, "", RESET });
    std.debug.print("{s}{s}╚══════════════════════════════════════════════════════════════════╝{s}\n\n", .{ GOLD, "", RESET });

    std.debug.print("{s}  ─── GOLDEN RATIO ───{s}\n\n", .{ GREEN, RESET });
    std.debug.print("  Golden Ratio (φ):      {d:.18}\n", .{sacred.PHI});
    std.debug.print("  Phi Squared (φ²):     {d:.18}\n", .{sacred.PHI_SQ});
    std.debug.print("  Phi Inverse (1/φ):    {d:.18}\n", .{sacred.PHI_INV});
    std.debug.print("  1/φ²:                 {d:.18}\n", .{sacred.PHI_INV_SQ});
    std.debug.print("  Trinity Identity:     φ² + 1/φ² = {d:.6} {s}✓{s}\n\n", .{
        sacred.PHI_SQ + sacred.PHI_INV_SQ, GREEN, RESET,
    });

    std.debug.print("{s}  ─── TRANSCENDENTAL ───{s}\n\n", .{ GREEN, RESET });
    std.debug.print("  Pi (π):               {d:.18}\n", .{sacred.PI});
    std.debug.print("  Euler's Number (e):   {d:.18}\n", .{sacred.E});
    std.debug.print("  Tau (τ = 2π):        {d:.18}\n\n", .{sacred.TAU });

    std.debug.print("{s}  ─── SACRED NUMBERS ───{s}\n\n", .{ GREEN, RESET });
    std.debug.print("  Trinity:              {d}\n", .{sacred.TRINITY});
    std.debug.print("  Phoenix:              {d}\n", .{sacred.PHOENIX});
    std.debug.print("  Omega:                {d}\n\n", .{sacred.OMEGA });
}

fn showPhiPower(args: []const []const u8) !void {
    if (args.len < 3) {
        std.debug.print("Usage: tri-math phi <n>\n", .{});
        return;
    }

    const n = try std.fmt.parseInt(i64, args[2], 10);
    const result = sacred.phiPower(n);

    std.debug.print("φ^{d} = {d:.18}\n", .{ n, result });
}

fn showFibonacci(args: []const []const u8) !void {
    if (args.len < 3) {
        std.debug.print("Usage: tri-math fib <n>\n", .{});
        return;
    }

    const n = try std.fmt.parseInt(u64, args[2], 10);
    const result = stdlib.fibonacci(n);

    std.debug.print("Fibonacci({d}) = {d}\n", .{ n, result });
}

fn showTrinityIdentity() void {
    const GREEN = "\x1b[32m";
    const RED = "\x1b[31m";
    const RESET = "\x1b[0m";

    const phi_sq = sacred.PHI_SQ;
    const inv_phi_sq = sacred.PHI_INV_SQ;
    const sum = phi_sq + inv_phi_sq;

    std.debug.print("Trinity Identity: φ² + 1/φ² = 3\n\n", .{});
    std.debug.print("  φ² =     {d:.18}\n", .{phi_sq});
    std.debug.print("  1/φ² =   {d:.18}\n", .{inv_phi_sq});
    std.debug.print("  ─────────────────────────\n", .{});
    std.debug.print("  Sum =   {d:.18}\n", .{sum});
    std.debug.print("  Target = 3.0\n\n", .{});

    if (@abs(sum - 3.0) < 0.0000001) {
        std.debug.print("  {s}✓ VERIFIED: φ² + 1/φ² = 3 = TRINITY{s}\n", .{ GREEN, RESET });
    } else {
        std.debug.print("  {s}✗ FAILED: Not equal to 3{s}\n", .{ RED, RESET });
    }
}

fn showFormula(args: []const []const u8) !void {
    if (args.len < 7) {
        std.debug.print("Usage: tri-math formula <n> <k> <m> <p> <q>\n", .{});
        return;
    }

    const n = try std.fmt.parseFloat(f64, args[2]);
    const k = try std.fmt.parseFloat(f64, args[3]);
    const m = try std.fmt.parseFloat(f64, args[4]);
    const p = try std.fmt.parseFloat(f64, args[5]);
    const q = try std.fmt.parseFloat(f64, args[6]);

    const result = sacred.formula(n, k, m, p, q);

    std.debug.print("Sacred Formula: V = n × 3^k × π^m × φ^p × e^q\n", .{});
    std.debug.print("  n = {d}\n", .{n});
    std.debug.print("  k = {d}\n", .{k});
    std.debug.print("  m = {d}\n", .{m});
    std.debug.print("  p = {d}\n", .{p});
    std.debug.print("  q = {d}\n", .{q});
    std.debug.print("  ──────────────────────────────────────\n", .{});
    std.debug.print("  V = {d:.18}\n", .{result});
}

fn showPrime(args: []const []const u8) !void {
    if (args.len < 3) {
        std.debug.print("Usage: tri-math prime <n>\n", .{});
        return;
    }

    const n = try std.fmt.parseInt(u64, args[2], 10);
    const is_prime = stdlib.isPrime(n);

    const GREEN = "\x1b[32m";
    const RED = "\x1b[31m";
    const RESET = "\x1b[0m";

    std.debug.print("{d} is {s}{s}{s}\n", .{ n, if (is_prime) GREEN else RED, if (is_prime) "PRIME" else "NOT PRIME", RESET });
}
