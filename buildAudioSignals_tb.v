`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2025 09:43:02 AM
// Design Name: 
// Module Name: buildAudioSignals_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module buildAudioSignals_tb();
    //reg clk_tb;
    reg [7:0]  index_tb;
    wire [7:0] filledOutput_tb;
    integer i;
    localparam period = 100;
     buildAudioSignal uut(.index(index_tb), .filledOutput(filledOutput_tb));
    
    initial begin
        for(i=0; i<255; i=i+1) begin
            index_tb = i;
            #period;
        end
    end
endmodule
