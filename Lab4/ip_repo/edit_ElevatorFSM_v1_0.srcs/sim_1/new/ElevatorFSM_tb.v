`timescale 1ns / 1ps

module ElevatorFSM_tb();
    reg clk;
    reg update;
    reg reset;
    reg [1:0] motor_control;
    
    wire [1:0] floor;
    wire [1:0] movement;
    
    ElevatorFSM uut(
        .clk(clk),
        .update(update),
        .reset(reset),
        .motor_control(motor_control),
        .floor(floor),
        .movement(movement)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        update = 0;
        reset = 0;
        motor_control = 2'b00;
        
        #100
        reset = 1; #10; reset = 0; #10;
        
        test_update(2'b10);
        test_update(2'b00);
        
        reset_fsm();
        test_update(2'b10);
        test_update(2'b10);
        test_update(2'b10);
        
        reset_fsm();
        test_update(2'b10);
        test_update(2'b10);
        test_update(2'b01);
        test_update(2'b01);
        test_update(2'b01);
        
        #100;
        $finish;
    end
    
    task reset_fsm;
        begin
            reset = 1; #10; reset = 0; #10;
        end
    endtask
    
    task test_update;
        input [1:0] motor_value;
        begin
            motor_control = motor_value; update = 1; #10; update = 0; #20;
        end
    endtask
            
endmodule
