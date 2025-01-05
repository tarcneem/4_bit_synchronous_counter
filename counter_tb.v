
//test_bench

`timescale 1ns / 1ps

module synch_counter_tb;

    // Testbench signals
    reg clk;
    reg up_down;
    reg reset;
    reg load;
    reg [3:0] Data;
    wire [3:0] Qout;

    // Instantiate the 4-bit synchronous counter module
    synch_counter uut (
        .clk(clk),
        .up_down(up_down),
        .reset(reset),
        .load(load),
        .Data(Data),
        .Qout(Qout)
    );

    // Clock generation: 50 MHz clock (20 ns period)
    always #10 clk = ~clk;

    // Testbench procedure
    initial begin
        // Initialize inputs
        clk = 0;
        up_down = 0;
        reset = 0;
        load = 0;
        Data = 4'b0000;

        // Apply reset
        reset = 1;
        #20;                // Wait for two clock cycles
        reset = 0;

        // Test load operation
        Data = 4'b1010;     // Load the value 10
        load = 1;
        #20;
        load = 0;

        // Test up-counting
        up_down = 1;
        #100;               // Let the counter run for 5 cycles

        // Test down-counting
        up_down = 0;
        #100;               // Let the counter run for 5 cycles

        // Apply reset again
        reset = 1;
        #20;
        reset = 0;

        // Test load operation again
        Data = 4'b1100;     // Load the value 12
        load = 1;
        #20;
        load = 0;

        // Let the simulation run a bit longer
        #200;

        // Finish simulation
        $finish;
    end

    // Monitor the counter output
    initial begin
        $monitor("Time = %0t | Reset = %b | Load = %b | Up_Down = %b | Data = %b | Qout = %b",
                 $time, reset, load, up_down, Data, Qout);
    end

endmodule
