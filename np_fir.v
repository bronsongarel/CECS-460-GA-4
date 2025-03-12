`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers: Bronson Garel, Andrew Nguyen, Kenneth Vuong, and Kyle Wyckoff
// 
// Create Date: 03/11/2025 07:36:01 PM
// Design Name: Non-Pipelined FIR
// Module Name: np_fir
// Project Name: Pipelined vs Non-pipelined FIR Filter
// Target Devices: Zybo Z7
// Tool Versions: Vivado 2024.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module np_fir#(parameter DATA_WIDTH=8)(
    input clk,
    input [DATA_WIDTH-1:0] data_in
    );
    
    // Read Sample from BRAM
    // Multiply by corresponding filter coefficient
    // Accumulate results for all 5 taps sequentially
    // Store filtered outputs back in BRAM
    // NOTE: Each sample must be fully processed before moving to next sample
    
    
endmodule

