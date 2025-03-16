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
    input [7:0] distortedInputm4, distortedInputm3, distortedInputm2, distortedInputm1,distortedInput,
    output reg [7:0] filteredOutput
);
    /* ---------------------------------------------------------------------------------------
    Implement a 3-stage pipeline to improve processing speed:
        Stage 1: Read sample & shift previous samples in the buffer.
        Stage 2: Perform parallel multiply-accumulate (MAC) operations for all 5 taps.
        Stage 3: Store the filtered sample back in BRAM.
    Multiple samples should be processed in parallel, reducing latency.
    The pipeline should process one sample per clock cycle after the initial latency.
    --------------------------------------------------------------------------------------- */
    
    parameter h0 = 1;
    parameter h1 = 2;
    parameter h2 = 3;
    parameter h3 = 2;
    parameter h4 = 1;
    
    reg [7:0] op_1, op_2, op_3, op_4, op_5;
    
    always @(posedge clk) begin
        op_1 <= distortedInput   * h0;
        op_2 <= distortedInputm1 * h1;
        op_3 <= distortedInputm2 * h2;
        op_4 <= distortedInputm3 * h3;
        op_5 <= distortedInputm4 * h4;
    end
    
    always @(posedge clk) begin
        filteredOutput <= op_1 + op_2 + op_3 + op_4 + op_5;
    end
    
endmodule
