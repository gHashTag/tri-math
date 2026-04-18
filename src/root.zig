// tri-math — Sacred Mathematics Library
// φ² + 1/φ² = 3 = TRINITY

const std = @import("std");

// Import stdlib modules
const math = @import("stdlib/math.zig");
const math_ext = @import("stdlib/math_ext.zig");

// stdlib namespace - re-export functions individually
pub const stdlib = struct {
    // From math.zig
    pub const PHI = math.PHI;
    pub const PHI_INVERSE = math.PHI_INVERSE;
    pub const GOLDEN_IDENTITY = math.GOLDEN_IDENTITY;
    pub const PHOENIX = math.PHOENIX;
    pub const TRINITY = math.TRINITY;
    pub const PI = math.PI;
    pub const E = math.E;
    pub const TAU = math.TAU;
    pub const fibonacci = math.fibonacci;
    pub const lucas = math.lucas;
    pub const goldenApprox = math.goldenApprox;
    pub const verifyGoldenIdentity = math.verifyGoldenIdentity;
    pub const sacredFormula = math.sacredFormula;
    pub const isPrime = math.isPrime;
    pub const gcd = math.gcd;
    pub const lcm = math.lcm;
    pub const factorial = math.factorial;
    pub const binomial = math.binomial;
    pub const pow = math.pow;
    pub const abs = math.abs;
    pub const sign = math.sign;
    pub const clamp = math.clamp;
    pub const lerp = math.lerp;

    // Extended math
    pub const ext = math_ext;
};

// Sacred constants (simplified for standalone package)
pub const sacred = struct {
    // Golden Ratio Constants
    const PHI_VALUE: f64 = 1.6180339887498948482;
    pub const PHI = PHI_VALUE;
    pub const PHI_SQ: f64 = PHI_VALUE * PHI_VALUE;
    pub const PHI_INV: f64 = 1.0 / PHI_VALUE;
    pub const PHI_INV_SQ: f64 = PHI_INV * PHI_INV;
    pub const GOLDEN_IDENTITY: f64 = 3.0;

    // Transcendental Constants
    pub const PI: f64 = std.math.pi;
    pub const E: f64 = std.math.e;
    pub const TAU: f64 = std.math.tau;

    // Sacred Numbers
    pub const TRINITY: i64 = 3;
    pub const PHOENIX: i64 = 999;
    pub const OMEGA: i64 = 800;

    // Verify Trinity identity
    pub fn verifyTrinity() bool {
        const sum = PHI_SQ + PHI_INV_SQ;
        return @abs(sum - GOLDEN_IDENTITY) < 0.0000001;
    }

    // Sacred formula: V = n * 3^k * pi^m * phi^p * e^q
    pub fn formula(n: f64, k: f64, m: f64, p: f64, q: f64) f64 {
        return n * std.math.pow(f64, 3.0, k) *
            std.math.pow(f64, PI, m) *
            std.math.pow(f64, PHI, p) *
            std.math.pow(f64, E, q);
    }

    // Phi power calculation
    pub fn phiPower(n: i64) f64 {
        if (n == 0) return 1.0;
        if (n > 0) {
            var result: f64 = 1.0;
            var i: i64 = 0;
            while (i < n) : (i += 1) {
                result *= PHI;
            }
            return result;
        }
        // n < 0
        var result: f64 = 1.0;
        var i: i64 = 0;
        while (i < -n) : (i += 1) {
            result /= PHI;
        }
        return result;
    }
};

// Direct exports for convenience (use sacred.PHI, sacred.PI, sacred.E instead)
pub const TRINITY = sacred.TRINITY;

// Re-export common functions
pub const fibonacci = stdlib.fibonacci;
pub const lucas = stdlib.lucas;
pub const isPrime = stdlib.isPrime;
pub const gcd = stdlib.gcd;
pub const lcm = stdlib.lcm;

test "trinity identity" {
    try std.testing.expect(sacred.verifyTrinity());
}

test "phi power" {
    try std.testing.expectApproxEqAbs(sacred.PHI, sacred.phiPower(1), 0.0001);
    try std.testing.expectApproxEqAbs(sacred.PHI_SQ, sacred.phiPower(2), 0.0001);
}

test "sacred formula" {
    const result = sacred.formula(1, 1, 0, 0, 0);
    try std.testing.expectApproxEqAbs(3.0, result, 0.0001);
}
