# 4-bit Synchronous Counter Design and Testbench
4-bit synchronous counter design with a simple Verilog testbench

 Description
This project includes a 4-bit Synchronous Counter design and its corresponding testbench in Verilog. The counter can count up or down based on the control signals, and it also supports loading a specific value and resetting the counter.

 Design
The 4-bit Synchronous Counter (`synch_counter`) has the following inputs and outputs:
- **Inputs**:
  - `up_down` (control signal for counting direction: up or down)
  - `clk` (clock signal)
  - `Data` (4-bit input data to be loaded)
  - `reset` (reset signal to clear the counter)
  - `load` (load signal to load the input data)
- **Outputs**:
  - `Qout` (4-bit output register)


