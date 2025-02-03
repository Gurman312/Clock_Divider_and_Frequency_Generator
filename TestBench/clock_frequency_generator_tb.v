module clock_frequency_generator_tb;
    reg clk_in;
    reg reset;
    wire clk_out_1;
    wire clk_out_2;
    wire clk_out_4;

    // Instantiate the clock frequency generator module
    clock_frequency_generator #(
        .DIV_FACTOR_1(2),
        .DIV_FACTOR_2(4),
        .DIV_FACTOR_3(8)
    ) uut (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out_1(clk_out_1),
        .clk_out_2(clk_out_2),
        .clk_out_4(clk_out_4)
    );

    // Clock generation
    always #5 clk_in = ~clk_in; // 10-time unit period clock

    initial begin
        // Initialize signals
        clk_in = 0;
        reset = 1;
        #20 reset = 0;  // Release reset after 20 time units

        // Run simulation for 200 time units
        #200 $finish;
    end
endmodule
