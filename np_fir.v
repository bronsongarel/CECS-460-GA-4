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


module np_fir#(
    parameter DATA_WIDTH = 8,
    parameter COEFF_WIDTH = 12
)(
    input clk,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out
);

// Declare coefficients individually (Verilog-compatible)
localparam [COEFF_WIDTH-1:0] h0 = 1;
localparam [COEFF_WIDTH-1:0] h1 = 2;
localparam [COEFF_WIDTH-1:0] h2 = 3;
localparam [COEFF_WIDTH-1:0] h3 = 2;
localparam [COEFF_WIDTH-1:0] h4 = 1;

// Sample buffer (5-tap delay line)
reg [DATA_WIDTH-1:0] delay_line [0:4];

// Control signals
reg [2:0] state;
reg [2:0] tap_counter; // Reduced to 3 bits (0-4)
reg [COEFF_WIDTH-1:0] accumulator;

localparam IDLE      = 3'b000;
localparam LOAD      = 3'b001;
localparam MAC       = 3'b010;
localparam STORE     = 3'b011;

// State machine
always @(posedge clk) begin
    case(state)
        IDLE: begin
            accumulator <= 0;
            tap_counter <= 0;
            state <= LOAD;
        end
        
        LOAD: begin
            // Shift new sample into buffer
            delay_line[0] <= data_in;
            delay_line[1] <= delay_line[0];
            delay_line[2] <= delay_line[1];
            delay_line[3] <= delay_line[2];
            delay_line[4] <= delay_line[3];
            state <= MAC;
        end
        
        MAC: begin
            if (tap_counter < 5) begin
                // Select coefficient based on tap_counter
                case(tap_counter)
                    0: accumulator <= accumulator + (delay_line[0] * h0);
                    1: accumulator <= accumulator + (delay_line[1] * h1);
                    2: accumulator <= accumulator + (delay_line[2] * h2);
                    3: accumulator <= accumulator + (delay_line[3] * h3);
                    4: accumulator <= accumulator + (delay_line[4] * h4);
                endcase
                tap_counter <= tap_counter + 1;
            end
            else begin
                state <= STORE;
            end
        end
        
        STORE: begin
            data_out <= accumulator[COEFF_WIDTH-1:COEFF_WIDTH-DATA_WIDTH]; // Truncate
            state <= IDLE;
        end
    endcase
end

endmodule

