const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // ============================================================
    // tri-math Module (for use as library)
    // ============================================================

    const mod = b.addModule("tri-math", .{
        .root_source_file = b.path("src/root.zig"),
    });

    // ============================================================
    // CLI Binary
    // ============================================================

    const cli_mod = b.createModule(.{
        .root_source_file = b.path("src/cli/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    cli_mod.addImport("tri-math", mod);

    const exe = b.addExecutable(.{
        .name = "tri-math",
        .root_module = cli_mod,
    });
    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run tri-math CLI");
    run_step.dependOn(&run_cmd.step);

    // ============================================================
    // Tests
    // ============================================================

    const test_mod = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const tests = b.addTest(.{
        .root_module = test_mod,
    });

    const run_tests = b.addRunArtifact(tests);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_tests.step);

    // ============================================================
    // Benchmarks
    // ============================================================

    const bench_mod = b.createModule(.{
        .root_source_file = b.path("tests/bench_math.zig"),
        .target = target,
        .optimize = .ReleaseFast,
    });
    bench_mod.addImport("tri-math", mod);

    const bench_exe = b.addExecutable(.{
        .name = "bench-math",
        .root_module = bench_mod,
    });
    b.installArtifact(bench_exe);

    const run_bench = b.addRunArtifact(bench_exe);
    const bench_step = b.step("bench", "Run math benchmarks");
    bench_step.dependOn(&run_bench.step);
}
