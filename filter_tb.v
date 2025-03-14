`timescale 1ns / 1ps
module filter_tb();
    reg clk_tb;
    reg [7:0] distortedInputm4_tb, distortedInputm3_tb, distortedInputm2_tb, distortedInputm1_tb,distortedInput_tb;
    wire [7:0] filteredOutput_tb;
    integer i;
    localparam period = 100;
 filter uut(.clk(clk_tb), .distortedInputm4(distortedInputm4_tb), .distortedInputm3(distortedInputm4_tb), .distortedInputm2(distortedInputm4_tb), 
            .distortedInputm1(distortedInputm4_tb),.distortedInput(distortedInputm4_tb), .filteredOutput(filteredOutput_tb));
initial begin
        clk_tb = 0;
        forever begin
            clk_tb = ~clk_tb;
            #50;
        end
end
initial begin
    for(i = 5; i < 20; i = i + 1) begin
        distortedInputm4_tb = i-2;
        distortedInputm3_tb =  i;
        distortedInputm2_tb =  i-1;
        distortedInputm1_tb =  i+2;
        distortedInput_tb =    i+1;
        #period;
    end
end
endmodule
