# Verilog-Based Polynomial Multiplier Accelerator (SCOPE-I)

## Overview

This project presents the RTL design and FPGA implementation of a **SCOPE-I polynomial multiplier accelerator** using Verilog HDL, based on the SCOPE research paper.

The design implements negacyclic polynomial multiplication for the FALCON lattice-based cryptographic scheme, operating over:

- Polynomial degree: `n = 512`
- Modulus: `q = 12,289`
- Arithmetic: `Z_q[x]/(x^n + 1)`
- HDL: Verilog
- FPGA platform: Xilinx Kintex-7

The original architecture was initially developed and tested for `n = 4`, then extended to `n = 512`. The complete design was functionally verified through RTL simulation and implemented using Xilinx Vivado.

## Architecture

The SCOPE-I accelerator consists of the following major hardware blocks:

| Module | Function |
|---|---|
| BIPC | Serial input of polynomial coefficients using a register chain |
| BSRC | Precomputation of coefficient multiples and shifted versions |
| BPMC | Parallel multiplication of polynomial coefficients using multiplexers and modular adders |
| BACC | Accumulation of partial products with modular addition and subtraction |
| CTU | Control unit implementing the RESET, LOAD, MULTI, OUTPUT and DONE states |
| K-RED | Modular reduction using the `3C0 - C1` reduction technique |
| Prescale | Prescaling using the modular inverse of 3 |

### Block-Level Data Flow

```text
       Polynomial g
             |
             v
           BIPC
             |
             v
       +-----------+
       |           |
       |   BPMC    | <----- BSRC <----- Polynomial d
       |           |
       +-----------+
             |
             v
           BACC
             |
             v
        Polynomial
           Output

       CTU controls the
       overall operation
```

### Key Design Features

- Implemented the schoolbook polynomial multiplication architecture.
- Used precomputed multiples and shifted coefficient representations to perform multiplication.
- Implemented modular reduction for arithmetic modulo 12,289.
- Used a parallel multiply-accumulate architecture with 512 coefficient lanes.
- Implemented serial polynomial input and output to reduce FPGA I/O requirements.

## Verification

The design was verified using Verilog testbenches in Xilinx Vivado.

A self-checking testbench was developed using a golden negacyclic polynomial multiplication model.

The following test cases were performed:

1. Random polynomial coefficients.
2. All-zero polynomial inputs.
3. All coefficients equal to `q - 1`.
4. First polynomial equal to 1.
5. Second polynomial equal to 1.
6. Boundary condition: `x * x^(n-1) = -1`.

**Result:** All six test cases passed for the `n = 512` implementation.

Additionally, individual testbenches were developed to verify the functionality of the major hardware modules.

## FPGA Implementation

The design was synthesized and implemented using **Xilinx Vivado 2026.1** on the following FPGA:

- Device: Kintex-7
- Part: `xc7k480tffv1156-3`

### Implementation Results

| Parameter | Result |
|---|---:|
| Polynomial size (n) | 512 |
| Modulus (q) | 12,289 |
| LUTs | 176,740 |
| Flip-flops | 14,423 |
| Slices | 49,442 |
| DSP blocks | 0 |
| BRAM | 0 |
| Clock constraint | 8 ns |
| Maximum frequency (Fmax) | 124.2 MHz |
| Latency | 512 cycles |
| Multiplication delay | 4.12 µs |
| Estimated on-chip power | 13.397 W |

The reported implementation is a non-pipelined design. The power value is a Vivado vectorless estimate using default switching activity.

## Comparison with the SCOPE Research Paper

The implementation results were compared against the SCOPE paper's reported FPGA results.

The comparison included:

- LUT and flip-flop utilization.
- FPGA slice utilization.
- Maximum operating frequency.
- Multiplication latency.
- Multiplication delay.
- Energy-Area-Delay Product (EADP).

The design was also evaluated for `n = 256` on the same Kintex-7 device to obtain an additional same-device comparison with the paper.

The implementation provides a baseline for further optimization of the polynomial multiplier architecture.

## Tools and Technologies

- **HDL:** Verilog
- **Simulation:** Xilinx Vivado
- **Synthesis and implementation:** Xilinx Vivado
- **FPGA:** Xilinx Kintex-7
- **Verification:** Self-checking Verilog testbenches
- **Algorithm validation:** Python reference model

## Repository Structure

```text
SCOPE-I-Polynomial-Multiplier/
│
├── RTL/
│   ├── bipc.v
│   ├── bacc.v
│   ├── ctu.v
│   ├── bpmc.v
│   ├── bsrc.v
│   ├── bsrc_cmplt.v
│   ├── mod_reduction.v
│   ├── prescale.v
│   ├── mux2.v
│   ├── mux8.v
│   ├── mux16.v
│   ├── sign_invert.v
│   └── scope1_top.v
│
├── Testbench/
│   ├── scope1_tb.v
│   └── Individual module testbenches
│
├── Python_Model/
│   ├── model.py
│   └── pipe_model.py
│
└── README.md
```

*Note: The directory structure above is a suggested organization for the GitHub repository. Arrange the actual source files accordingly.*

## Future Improvements

- Implement SCOPE-II using the Toom-Mixed-Variable Polynomial (TMVP) multiplication approach.
- Compare SCOPE-I and SCOPE-II in terms of area, latency, frequency and power.
- Optimize the high-fan-out coefficient broadcast network.
- Explore pipelining and floorplanning techniques to improve timing.
- Investigate clock gating and other power optimization techniques.
- Implement the Longa K-RED block in Cadence for further hardware-level analysis.

## Key Learning Outcomes

- RTL design and modular Verilog development.
- Digital hardware architecture and datapath design.
- Modular arithmetic and polynomial multiplication.
- Functional verification using self-checking testbenches.
- FPGA synthesis, implementation and timing analysis.
- Hardware resource and power estimation using Vivado.

---

**Project:** SCOPE-I Polynomial Multiplier Accelerator  
**Application:** FALCON lattice-based cryptography  
**Implementation:** Verilog HDL on Xilinx Kintex-7 FPGA
