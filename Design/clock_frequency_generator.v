module clock_frequency_generator #(
    parameter DIV_FACTOR_1 = 2,  // Clock divide factor for first output
    parameter DIV_FACTOR_2 = 4,  // Clock divide factor for second output
    parameter DIV_FACTOR_3 = 8   // Clock divide factor for third output
)(
    input wire clk_in,      // Input clock
    input wire reset,       // Reset signal
    output reg clk_out_1,   // Output clock (divided by DIV_FACTOR_1)
    output reg clk_out_2,   // Output clock (divided by DIV_FACTOR_2)
    output reg clk_out_4    // Output clock (divided by DIV_FACTOR_3)
);

    // Counters for clock division
    reg [31:0] counter_1 = 0;
    reg [31:0] counter_2 = 0;
    reg [31:0] counter_3 = 0;

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter_1 <= 0;
            counter_2 <= 0;
            counter_3 <= 0;
            clk_out_1 <= 0;
            clk_out_2 <= 0;
            clk_out_4 <= 0;
        end else begin
            // Clock Divider 1
            if (counter_1 == (DIV_FACTOR_1 / 2) - 1) begin
                counter_1 <= 0;
                clk_out_1 <= ~clk_out_1;
            end else begin
                counter_1 <= counter_1 + 1;
            end

            // Clock Divider 2
            if (counter_2 == (DIV_FACTOR_2 / 2) - 1) begin
                counter_2 <= 0;
                clk_out_2 <= ~clk_out_2;
            end else begin
                counter_2 <= counter_2 + 1;
            end

            // Clock Divider 3
            if (counter_3 == (DIV_FACTOR_3 / 2) - 1) begin
                counter_3 <= 0;
                clk_out_4 <= ~clk_out_4;
            end else begin
                counter_3 <= counter_3 + 1;
            end
        end
    end
endmodule
