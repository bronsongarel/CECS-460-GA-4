
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2025 04:48:56 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input [7:0] audioSignals [0:1023],
    input [3:0] switches
      
    );
    reg [7:0] randDistortion, dummyOut, filterInputm;
    integer i; 
    initial begin
    for(i = 0; i < 1023; i = i + 1) begin   
    //1. Distort the sine function and store into randDistortion
        distort(audioSignals[i], randDistortion[i]);
    //2. Store audioSignals into BRAM
        bram( .clk(clk), .data(randDistortion[i]),
              .readWrite(1), .addr(i), .out(dummyOut));
    //3. Filter output read from BRAM
        //First check edge cases
        if( i == 1020) begin
            filter(distortedInputm4,
    input [7:0] distortedInputm3,
    input [7:0] distortedInputm2,
    .distortedInputm1(,
    .distortedInput(dummyOutput),

    .filteredOutput(dummyOutput));
        
        end
        else if( i == 1021) begin
        
        
        end
        else if( i == 1022) begin
        
        
        end
        else if( i == 1023) begin
        
        
        end
        //Checks for beginning of for loop
        else if( i == 0) begin
        
        
        end
        else if( i == 1) begin
        
        
        end
        else if( i == 2) begin
        
        
        end
        else if( i == 3) begin
        
        
        end
        else begin
        bram( .clk(clk), .data(0),
              .readWrite(0), .addr(i), .out(dummyOut));
        end
    //4. Store filtered output back into BRAM     
    end
    end
   
    
    
    
    
    
endmodule
