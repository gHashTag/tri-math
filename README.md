# tri-math

Sacred Mathematics Library for Zig — φ² + 1/φ² = 3 = TRINITY

A standalone Zig library providing sacred mathematical constants, number theory operations, and the Trinity formula engine.

## Installation

Add to your `build.zig.zon`:

```zig
.{
    .name = "your-project",
    .version = "0.1.0",
    .dependencies = .{
        .tri_math = .{
            .url = "https://github.com/your-username/tri-math/archive/refs/tags/v0.1.0.tar.gz",
            .hash = "..."  // Run `zig build` to get the hash
        },
    },
}
```

In your `build.zig`:

```zig
const tri_math = b.dependency("tri_math", .{
    .target = target,
    .optimize = optimize,
}).module("tri-math");

// Add to your executable
exe.root_module.addImport("tri-math", tri_math);
```

## Usage

### In Zig Code

```zig
const tri_math = @import("tri-math");

// Access sacred constants
const phi = tri_math.PHI;  // 1.618...
const pi = tri_math.PI;    // 3.141...
const trinity = tri_math.TRINITY;  // 3

// Use sacred functions
const fib = tri_math.fibonacci(10);  // 55
const is_prime = tri_math.isPrime(17);  // true

// Verify Trinity identity
const verified = tri_math.sacred.verifyTrinity();  // true

// Sacred formula: V = n * 3^k * pi^m * phi^p * e^q
const result = tri_math.sacred.formula(1, 1, 0, 0, 0);  // 3.0
```

### CLI Tool

```bash
# Show all sacred constants
tri-math constants

# Verify Trinity identity
tri-math trinity

# Calculate phi^n
tri-math phi 10

# Calculate Fibonacci numbers
tri-math fib 20

# Check primality
tri-math prime 997

# Sacred formula
tri-math formula 1 1 0 1 0

# Get help
tri-math help
```

## API

### Sacred Constants

| Constant | Value | Description |
|----------|-------|-------------|
| `PHI` | 1.618... | Golden Ratio (φ) |
| `PHI_SQ` | 2.618... | φ² |
| `PHI_INV` | 0.618... | 1/φ |
| `PHI_INV_SQ` | 0.382... | 1/φ² |
| `PI` | 3.141... | π |
| `E` | 2.718... | Euler's number |
| `TRINITY` | 3 | Sacred number |

### Functions

#### Standard Library (`stdlib`)

- `fibonacci(n: u64) u64` — nth Fibonacci number
- `lucas(n: u64) u64` — nth Lucas number
- `isPrime(n: u64) bool` — Primality test
- `gcd(a: u64, b: u64) u64` — Greatest common divisor
- `lcm(a: u64, b: u64) u64` — Least common multiple
- `factorial(n: u64) u64` — n!
- `binomial(n: u64, k: u64) u64` — C(n,k)

#### Sacred (`sacred`)

- `verifyTrinity() bool` — Verify φ² + 1/φ² = 3
- `formula(n, k, m, p, q) f64` — Sacred formula
- `phiPower(n: i64) f64` — Calculate φ^n

#### Extended Math (`stdlib.ext`)

- Trigonometric: `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `atan2`
- Hyperbolic: `sinh`, `cosh`, `tanh`, `asinh`, `acosh`, `atanh`
- Power/Root: `sqrt`, `cbrt`, `pow`, `hypot`
- Logarithmic: `exp`, `ln`, `log2`, `log10`, `log`
- Rounding: `floor`, `ceil`, `round`, `trunc`, `fract`
- Utilities: `abs`, `sign`, `min`, `max`, `clamp`, `lerp`

## Building

```bash
# Build library and CLI
zig build

# Run tests
zig build test

# Run benchmarks
zig build bench

# Run CLI
zig build run -- constants
```

## The Trinity Identity

The foundation of sacred mathematics is the Trinity identity:

```
φ² + 1/φ² = 3
```

Where φ (phi) is the Golden Ratio: φ = (1 + √5) / 2 ≈ 1.618...

This identity is exact to machine precision and forms the basis for the Sacred Formula:

```
V = n × 3^k × π^m × φ^p × e^q
```

## License

MIT License — Copyright (c) 2024 Dmitrii Vasilev

## Contributing

This library is part of the Trinity project. For contributions, please see the main repository.
