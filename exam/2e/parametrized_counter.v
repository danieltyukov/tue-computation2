//In this assignment, you have to create a Verilog implementation of a parametrized counter (parametrized_counter). When the counter is triggered, it will run for a number of cycles, and then stop counting until it is triggered again.

//Compared to a normal counter, this parametrized counter has a special feature: it can count 1n, 2n, 4n and 8n cycles.
//- The value of 'n' can be customized using a Verilog parameter.
//- The multiplier (1, 2, 4 or 8) can be selected using an input.
//It has the following ports:
//- clk (1 bit input, positive edge): Clock for the module
//- reset (1 bit input, active 1'b1, synchronous): Reset for the module.
//- tr (1 bit input, active 1'b1): Trigger (i.e. start) the counter. If the counter was already running, nothing should happen.
//- cf (1 bit output, active low): Indicates the counter is running. In other words, it is 1'b1 only when the counter is not running.
//- tvalue (parameter): Value of 'n'. For example, when the multiplier is 1, cf should be low for tvalue - 1 cycles. Your module must support tvalues of at least 32 cycles.
//- multiplier (2 bit input, little-endian): Multiplier. 00 = 1×, 01 = 2×, 10 = 4×, 11 = 8×. For example, when the multiplier is 10, cf should be low for 4 × tvalue - 1 cycles. If this value is changed while the counter is already running, nothing should happen.

//The diagram below shows an example waveform of the counter being triggered (tvalue = 7, multiplier = 2×):

module parametrized_counter (
        input wire [0:0] clk,
        input wire [0:0] reset,
        input wire [0:0] tr,
        input wire [1:0] multiplier, // Multiplier. 00 = 1×, 01 = 2×, 10 = 4×, 11 = 8×
        output reg cf
    );
    // 32 bit number
    parameter [31:0] tvalue = 4; // Replace the ... with a reasonable default value
    
    // Add your implementation here
    // state definitions
    // localparam
    // st_idle = 0,
    // st_counting = 1;
    // instead of state_idle and state_counting, we will use:
    // tr == 1'b1 && current_counter == 0 and current_counter > 0

    // memory definitions - when 
    reg [31:0] counter;
    reg [31:0] next_counter;

    // For example, when the multiplier is 1, cf should be low for tvalue - 1 cycles.
    // For example, when the multiplier is 10, cf should be low for 4 × tvalue - 1 cycles.

    always @(posedge clk) begin
        if (reset == 1'b1) begin
            counter <= 0;
        end
        else begin
            counter <= next_counter;
        end
    end

    always @(*) begin
        next_counter = counter;
        if (tr == 1'b1 && counter == 0) begin
            // cf = 1;
            case (multiplier)
                2'b00: begin
                    next_counter = tvalue - 1;
                end
                2'b01: begin
                    next_counter = 2*tvalue - 1;
                end
                2'b10: begin
                    next_counter = 4*tvalue - 1;
                end
                2'b11: begin
                    next_counter = 8*tvalue - 1;
                end
            endcase
        end
        if (counter > 0) begin
            // cf = 0;
            next_counter = counter - 1;
        end
    end
    assign cf = (counter > 0) ? 0 : 1;

endmodule
