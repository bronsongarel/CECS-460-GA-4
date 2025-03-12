`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2025 06:06:24 PM
// Design Name: 
// Module Name: distort
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


module distort(
    input [7:0] audioSample,
    output reg [7:0] distortedSample
    );
    reg [7:0] i, j;
    initial begin
        i = $urandom % 10;
        j = $urandom % 5;
        if(i <= 5) begin
            distortedSample <= audioSample + j;
        end
        else begin
           distortedSample <= audioSample - j;
        end
        
        
    end
    
    
endmodule
