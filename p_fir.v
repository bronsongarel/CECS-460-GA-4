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
    input clk
    );
    
    /* ---------------------------------------------------------------------------------------
    Implement a 3-stage pipeline to improve processing speed:
        Stage 1: Read sample & shift previous samples in the buffer.
        Stage 2: Perform parallel multiply-accumulate (MAC) operations for all 5 taps.
        Stage 3: Store the filtered sample back in BRAM.
    Multiple samples should be processed in parallel, reducing latency.
    The pipeline should process one sample per clock cycle after the initial latency.
    --------------------------------------------------------------------------------------- */
    
    
    
endmodule

