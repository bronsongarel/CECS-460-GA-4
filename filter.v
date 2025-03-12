module filter(
    input clk,
    input [7:0] distortedInputm4,
    input [7:0] distortedInputm3,
    input [7:0] distortedInputm2,
    input [7:0] distortedInputm1,
    input [7:0] distortedInput,

    output reg [7:0] filteredOutput
);
    parameter h0 = 1;
    parameter h1 = 2;
    parameter h2 = 3;
    parameter h3 = 2;
    parameter h4 = 1;
    always @(posedge clk) begin
    filteredOutput <= distortedInput   * h0 +
                     distortedInputm1 * h1 + 
                     distortedInputm2 * h2 + 
                     distortedInputm3 * h3 + 
                     distortedInputm4 * h4;
    end
endmodule
