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
    reg [7:0] randDistortion, dummyOutput, cleanOutput, dirtyInputm4, dirtyInputm3, dirtyInputm2, dirtyInputm1, dirtyInput;
    integer i; 
    initial begin
    for(i = 0; i < 1023; i = i + 1) begin   
    //1. Distort the sine function and store into randDistortion
        distort(audioSignals[i], randDistortion[i]);
    //2. Store audioSignals into BRAM
        bram( .clk(clk), .data(randDistortion[i]),
              .readWrite(1), .addr(i), .out(dummyOutput));
    //3. Filter output read from BRAM
        //First check edge cases at the beginning of the for loop (0-4)
        if( i == 0) begin
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(1020), .out(dirtyInputm4));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(1021), .out(dirtyInputm3));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(1022), .out(dirtyInputm2));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(1023), .out(dirtyInputm1));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i), .out(dirtyInput));   
                
          filter(.clk(clk), .distortedInputm4(dirtyInputm4),
                .distortedInputm3(dirtyInputm3),
                .distortedInputm2(dirtyInputm2),
                .distortedInputm1(dirtyInputm1),
                .distortedInput(dirtyInput),
                .filteredOutput(cleanOutput));
               
          bram(.clk(clk), .data(cleanOutput),
                .readWrite(1), .addr(i), .out(dummyOutput));        
        end
        else if( i == 1) begin
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(1021), .out(dirtyInputm4));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(1022), .out(dirtyInputm3));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(1023), .out(dirtyInputm2));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i-1), .out(dirtyInputm1));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i), .out(dirtyInput));
                    
          filter(.clk(clk), .distortedInputm4(dirtyInputm4),
                .distortedInputm3(dirtyInputm3),
                .distortedInputm2(dirtyInputm2),
                .distortedInputm1(dirtyInputm1),
                .distortedInput(dirtyInput),
                .filteredOutput(cleanOutput)
);
                
          bram(.clk(clk), .data(cleanOutput),
                .readWrite(1), .addr(i), .out(dummyOutput));
        end
        else if( i == 2) begin
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(1022), .out(dirtyInputm4));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(1023), .out(dirtyInputm3));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i-2), .out(dirtyInputm2));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i-1), .out(dirtyInputm1));
            bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i), .out(dirtyInput));
      
          filter(.clk(clk), .distortedInputm4(dirtyInputm4),
                .distortedInputm3(dirtyInputm3),
                .distortedInputm2(dirtyInputm2),
                .distortedInputm1(dirtyInputm1),
                .distortedInput(dirtyInput),
                .filteredOutput(cleanOutput)
);
                
          bram(.clk(clk), .data(cleanOutput),
                .readWrite(1), .addr(i), .out(dummyOutput));
        
        end
        else if( i == 3) begin
            bram( .clk(clk), .data(0),
                  .readWrite(0), .addr(1023), .out(dirtyInputm4));
            bram( .clk(clk), .data(0),
                  .readWrite(0), .addr(i-3), .out(dirtyInputm3));
            bram( .clk(clk), .data(0),
                  .readWrite(0), .addr(i-2), .out(dirtyInputm2));
            bram( .clk(clk), .data(0),
                  .readWrite(0), .addr(i-1), .out(dirtyInputm1));
            bram( .clk(clk), .data(0),
                  .readWrite(0), .addr(i), .out(dirtyInput));
    
            filter(.clk(clk), .distortedInputm4(dirtyInputm4),
                .distortedInputm3(dirtyInputm3),
                .distortedInputm2(dirtyInputm2),
                .distortedInputm1(dirtyInputm1),
                .distortedInput(dirtyInput),
                .filteredOutput(cleanOutput));

            bram(.clk(clk), .data(cleanOutput),
                .readWrite(1), .addr(i), .out(dummyOutput));
        
        end
        else begin
          bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i-4), .out(dirtyInputm4));
          bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i-3), .out(dirtyInputm3));
          bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i-2), .out(dirtyInputm2));
          bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i-1), .out(dirtyInputm1));
          bram( .clk(clk), .data(0),
                .readWrite(0), .addr(i), .out(dirtyInput));
 
          filter(.clk(clk), .distortedInputm4(dirtyInputm4),
                .distortedInputm3(dirtyInputm3),
                .distortedInputm2(dirtyInputm2),
                .distortedInputm1(dirtyInputm1),
                .distortedInput(dirtyInput),
 
                .filteredOutput(cleanOutput)
);
                
          bram(.clk(clk), .data(cleanOutput),
                .readWrite(1), .addr(i), .out(dummyOutput));
        end
    end
    end
   
    
    
    
    
    
endmodule
