# Synchronous FIFO Buffer (Parameterized) – Verilog HDL

# Description

This project implements a synchronous FIFO (First-In First-Out) buffer in Verilog HDL.
It uses a parameterized design, allowing customization of data width, depth, and pointer width.
The FIFO supports sequential write and read operations, uses an internal counter to track occupancy, and provides full and empty status signals.

The implementation is clean, minimal, and suitable for beginners learning memory structures, as well as intermediate RTL learners building toward UART/I2C/SPI subsystems.

# How It Works

The FIFO stores incoming data words into an internal register array (mem[]).
Two pointers handle the flow:

Write Pointer (wr_ptr): increments on every valid write (wr_en && ~full)

Read Pointer (rd_ptr): increments on valid read (rd_en && ~empty)

A counter tracks how many entries currently exist in the FIFO.
This counter is used to generate the flags:

full → asserted when count == depth

empty → asserted when count == 0

All operations are fully synchronous to the clock.

# Simulation Steps

Reset the FIFO

Write 16 values into FIFO using wr_en = 1

After FIFO is full, stop writing

Enable read and observe sequential output

Verify correct full/empty flag transition

Check pointer wrap-around behavior

# Expected Behavior

FIFO should accept 16 writes (because depth = 16)

After 16 writes, full = 1

During read phase, data_out updates every clock cycle

After all reads are complete, empty = 1

Write and read pointers wrap cleanly from last index back to index 0

No data corruption or overlap occurs

# Waveform Explanation

The simulation displays:

wr_en phase: memory fills, count increases, full becomes 1

rd_en phase: data is output in exact order of arrival, count decreases, empty becomes 1

data_out updates on each read clock edge

FIFO does not write when full, and does not read when empty

This confirms correct synchronous FIFO behavior.

# Concepts Demonstrated

Register-array based memory modeling

Write/read pointer management

Circular buffer technique

Counter-based full/empty detection

Synchronous sequential logic

Parameterized hardware design

# Notes

This FIFO is synchronous — both read & write share the same clock

Pointer wrap-around is automatic due to vector overflow behavior

Can easily scale by adjusting parameters width, depth, c

Suitable building block for UART, SPI, CPU datapaths, and buffering logic
