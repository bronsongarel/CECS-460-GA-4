
module bram(
   input clk,
    input [7:0] data,
    input readWrite,
    input [7:0] addr,
    output reg [7:0] out
    );
    reg [7:0] bram [0:255];

    integer i;
    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            bram[i] = i;
        end
        out <= 0;
    end
    always @(posedge clk) begin
        if (readWrite == 0) begin //read = 0
            out <= bram[addr];    //read address from switches
        end

        
        else if (readWrite) begin //write = 1
            out <= 0;             //writing mode, set out to 0
            bram[addr] = data;    //store data from switches into BRAM address
        end
        
        
    end
    
   
endmodule
