`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers: Bronson Garel, Andrew Nguyen, Kenneth Vuong, and Kyle Wyckoff
// 
// Create Date: 03/11/2025 07:36:01 PM
// Design Name: Pipelined FIR
// Module Name: p_fir
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


module p_fir(
    input clk,
    input [7:0] data_in,         // Input sample from BRAM
    output reg [11:0] data_out   // 12-bit filtered output
);
    //----------------------------------------------
    // Stage 1: Shift Register (Sample Buffering)
    //----------------------------------------------
    reg [7:0] buffer [0:4];  // Holds x[n], x[n-1], ..., x[n-4]
    
    always @(posedge clk) begin
        // Shift new sample into buffer
        buffer[0] <= data_in;
        buffer[1] <= buffer[0];
        buffer[2] <= buffer[1];
        buffer[3] <= buffer[2];
        buffer[4] <= buffer[3];
    end

    //----------------------------------------------
    // Stage 2: Parallel Multiply-Accumulate (MAC)
    //----------------------------------------------
    reg [11:0] prod [0:4];  // Registered products
    
    // Parallel multiplications with coefficients
    always @(posedge clk) begin
        prod[0] <= buffer[0] * 1;  // h0 = 1
        prod[1] <= buffer[1] * 2;  // h1 = 2
        prod[2] <= buffer[2] * 3;  // h2 = 3
        prod[3] <= buffer[3] * 2;  // h3 = 2
        prod[4] <= buffer[4] * 1;  // h4 = 1
    end

    // Sum all products
    wire [11:0] sum = prod[0] + prod[1] + prod[2] + prod[3] + prod[4];

    //----------------------------------------------
    // Stage 3: Output Register (Store Result)
    //----------------------------------------------
    always @(posedge clk) begin
        data_out <= sum;  // Registered output to BRAM
    end

endmodule

