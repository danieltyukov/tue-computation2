`timescale 1ns / 1ps

module coffee_mealy_tb();

    // Inputs to the module
    reg clk;
    reg insert;
    reg reset;
    reg [1:0] coins;

    // Outputs from the module
    wire coffee;
    wire [1:0] state_display;

    // Instantiate the Unit Under Test (UUT)
    coffee_mealy uut(
        .clk(clk),
        .insert(insert),
        .reset(reset),
        .coins(coins),
        .coffee(coffee),
        .state_display(state_display)
    );

    // Generate clock signal
    always #5 clk = ~clk; // 100MHz clock, change period as needed

    // Test sequence
    initial begin
        // Initialize inputs
        clk = 0;
        insert = 0;
        reset = 0;
        coins = 2'b00;
        
        // Reset the FSM
        #100;
        reset = 1; #10; reset = 0; #10;
        
        // Test sequence start
        // Scenario 1: Insert 10c -> Coffee dispensed
        test_insert(2'b01); // Insert 10c
        test_insert(2'b00); // No insert
        
        // Scenario 2: Reset and insert 5c, then 10c -> Coffee dispensed
        reset_fsm();
        test_insert(2'b10); // Insert 5c
        test_insert(2'b01); // Insert 10c
        
        // Scenario 3: Insert 5c, Reset, insert 10c -> No coffee dispensed until after reset
        reset_fsm();
        test_insert(2'b10); // Insert 5c
        reset_fsm();
        test_insert(2'b01); // Insert 10c
        
        // Scenario 4: Insert 10c twice -> Coffee dispensed, then insert 10c for second coffee
        reset_fsm();
        test_insert(2'b01); // Insert 10c
        test_insert(2'b01); // Insert 10c again for next coffee
        test_insert(2'b01); // Insert 10c for the second cup
        
        // Complete the test
        #100;
        $finish;
    end
    
    // Function to simulate coin insert
    task test_insert;
        input [1:0] coin_value;
        begin
            coins = coin_value; insert = 1; #10; insert = 0; #20;
        end
    endtask
    
    // Function to reset FSM
    task reset_fsm;
        begin
            reset = 1; #10; reset = 0; #10;
        end
    endtask
    
endmodule