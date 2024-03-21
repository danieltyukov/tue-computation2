`timescale 1ns / 1ps

module coffee_mealy_tb;

    // Inputs
    reg clk;
    reg insert;
    reg reset;
    reg [1:0] coins;

    // Outputs
    wire coffee;
    wire [1:0] state_display;

    // Instantiate the Unit Under Test (UUT)
    coffee_mealy uut (
        .clk(clk), 
        .insert(insert), 
        .reset(reset), 
        .coins(coins), 
        .coffee(coffee), 
        .state_display(state_display)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50MHz clock
    end

    // Testbench logic
    initial begin
        // Initialize Inputs
        insert = 0;
        reset = 0;
        coins = 2'b00;

        // Wait 100 ns for global reset to finish
        #100;
        reset = 1; #20; reset = 0; #20; // Apply reset

        // Try all possible transitions from each state
        // State A transitions
        coins = 2'b01; insert = 1; #20; insert = 0; #40; // A -> C, no coffee
        reset_fsm();
        coins = 2'b10; insert = 1; #20; insert = 0; #40; // A -> B, no coffee
        reset_fsm();

        // State B transitions
        force uut.state_display = 2'b01; // Force state to B
        coins = 2'b01; insert = 1; #20; insert = 0; #40; // B -> A, coffee
        reset_fsm();
        force uut.state_display = 2'b01; // Force state to B
        coins = 2'b10; insert = 1; #20; insert = 0; #40; // B -> C, no coffee
        reset_fsm();

        // State C transitions
        force uut.state_display = 2'b10; // Force state to C
        coins = 2'b01; insert = 1; #20; insert = 0; #40; // C -> B, coffee
        reset_fsm();
        force uut.state_display = 2'b10; // Force state to C
        coins = 2'b10; insert = 1; #20; insert = 0; #40; // C -> A, coffee
        reset_fsm();

        // Complete the test
        $finish;
    end

    // Task to apply reset
    task reset_fsm;
        begin
            reset = 1; #20; reset = 0; #40; // Apply reset
        end
    endtask

endmodule
