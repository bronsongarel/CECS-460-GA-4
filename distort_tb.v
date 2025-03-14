`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 09:37:30 PM
// Design Name: 
// Module Name: distort_tb
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


module distort_tb();
    reg [7:0] sineAudioSample [0:1023];
    reg [7:0] audioSample_tb;
    wire [7:0] distortedSample_tb;
    reg clk_tb;
    integer i;
    localparam period = 100;
    distort uut(.clk(clk_tb), .audioSample(audioSample_tb),
                .distortedSample(distortedSample_tb) );
initial begin
        clk_tb = 0;
        forever begin
            clk_tb = ~clk_tb;
            #50;
        end
end
initial begin
    sineAudioSample[0] = 8'h80; sineAudioSample[1] = 8'h80; sineAudioSample[2] = 8'h81;
    sineAudioSample[3] = 8'h82; sineAudioSample[4] = 8'h83; sineAudioSample[5] = 8'h83;
    sineAudioSample[6] = 8'h84; sineAudioSample[7] = 8'h85; sineAudioSample[8] = 8'h86;
    sineAudioSample[9] = 8'h87; sineAudioSample[10] = 8'h87; sineAudioSample[11] = 8'h88;
    sineAudioSample[12] = 8'h89; sineAudioSample[13] = 8'h8a; sineAudioSample[14] = 8'h8a;
    sineAudioSample[15] = 8'h8b; sineAudioSample[16] = 8'h8c; sineAudioSample[17] = 8'h8d;
    sineAudioSample[18] = 8'h8e; sineAudioSample[19] = 8'h8e; sineAudioSample[20] = 8'h8f;
    sineAudioSample[21] = 8'h90; sineAudioSample[22] = 8'h91; sineAudioSample[23] = 8'h91;
    sineAudioSample[24] = 8'h92; sineAudioSample[25] = 8'h93; sineAudioSample[26] = 8'h94;
    sineAudioSample[27] = 8'h95; sineAudioSample[28] = 8'h95; sineAudioSample[29] = 8'h96;
    sineAudioSample[30] = 8'h97; sineAudioSample[31] = 8'h98; sineAudioSample[32] = 8'h98;
    sineAudioSample[33] = 8'h99; sineAudioSample[34] = 8'h9a; sineAudioSample[35] = 8'h9b;
    sineAudioSample[36] = 8'h9b; sineAudioSample[37] = 8'h9c; sineAudioSample[38] = 8'h9d;
    sineAudioSample[39] = 8'h9e; sineAudioSample[40] = 8'h9f; sineAudioSample[41] = 8'h9f;
    sineAudioSample[42] = 8'ha0; sineAudioSample[43] = 8'ha1; sineAudioSample[44] = 8'ha2;
    sineAudioSample[45] = 8'ha2; sineAudioSample[46] = 8'ha3; sineAudioSample[47] = 8'ha4;
    sineAudioSample[48] = 8'ha5; sineAudioSample[49] = 8'ha5; sineAudioSample[50] = 8'ha6;
    sineAudioSample[51] = 8'ha7; sineAudioSample[52] = 8'ha8; sineAudioSample[53] = 8'ha8;
    sineAudioSample[54] = 8'ha9; sineAudioSample[55] = 8'haa; sineAudioSample[56] = 8'haa;
    sineAudioSample[57] = 8'hab; sineAudioSample[58] = 8'hac; sineAudioSample[59] = 8'had;
    sineAudioSample[60] = 8'had; sineAudioSample[61] = 8'hae; sineAudioSample[62] = 8'haf;
    sineAudioSample[63] = 8'hb0; sineAudioSample[64] = 8'hb0; sineAudioSample[65] = 8'hb1;
    sineAudioSample[66] = 8'hb2; sineAudioSample[67] = 8'hb2; sineAudioSample[68] = 8'hb3;
    sineAudioSample[69] = 8'hb4; sineAudioSample[70] = 8'hb5; sineAudioSample[71] = 8'hb5;
    sineAudioSample[72] = 8'hb6; sineAudioSample[73] = 8'hb7; sineAudioSample[74] = 8'hb7;
    sineAudioSample[75] = 8'hb8; sineAudioSample[76] = 8'hb9; sineAudioSample[77] = 8'hba;
    sineAudioSample[78] = 8'hba; sineAudioSample[79] = 8'hbb; sineAudioSample[80] = 8'hbc;
    sineAudioSample[81] = 8'hbc; sineAudioSample[82] = 8'hbd; sineAudioSample[83] = 8'hbe;
    sineAudioSample[84] = 8'hbe; sineAudioSample[85] = 8'hbf; sineAudioSample[86] = 8'hc0;
    sineAudioSample[87] = 8'hc0; sineAudioSample[88] = 8'hc1; sineAudioSample[89] = 8'hc2;
    sineAudioSample[90] = 8'hc2; sineAudioSample[91] = 8'hc3; sineAudioSample[92] = 8'hc4;
    sineAudioSample[93] = 8'hc4; sineAudioSample[94] = 8'hc5; sineAudioSample[95] = 8'hc6;
    sineAudioSample[96] = 8'hc6; sineAudioSample[97] = 8'hc7; sineAudioSample[98] = 8'hc8;
    sineAudioSample[99] = 8'hc8; sineAudioSample[100] = 8'hc9; sineAudioSample[101] = 8'hca;
    sineAudioSample[102] = 8'hca; sineAudioSample[103] = 8'hcb; sineAudioSample[104] = 8'hcc;
    sineAudioSample[105] = 8'hcc; sineAudioSample[106] = 8'hcd; sineAudioSample[107] = 8'hcd;
    sineAudioSample[108] = 8'hce; sineAudioSample[109] = 8'hcf; sineAudioSample[110] = 8'hcf;
    sineAudioSample[111] = 8'hd0; sineAudioSample[112] = 8'hd0; sineAudioSample[113] = 8'hd1;
    sineAudioSample[114] = 8'hd2; sineAudioSample[115] = 8'hd2; sineAudioSample[116] = 8'hd3;
    sineAudioSample[117] = 8'hd3; sineAudioSample[118] = 8'hd4; sineAudioSample[119] = 8'hd5;
    sineAudioSample[120] = 8'hd5; sineAudioSample[121] = 8'hd6; sineAudioSample[122] = 8'hd6;
    sineAudioSample[123] = 8'hd7; sineAudioSample[124] = 8'hd7; sineAudioSample[125] = 8'hd8;
    sineAudioSample[126] = 8'hd9; sineAudioSample[127] = 8'hda;
    
    // Second half of the array
    sineAudioSample[128] = 8'hda; sineAudioSample[129] = 8'hdb; sineAudioSample[130] = 8'hdb;
    sineAudioSample[131] = 8'hdc; sineAudioSample[132] = 8'hdc; sineAudioSample[133] = 8'hdd;
    sineAudioSample[134] = 8'hde; sineAudioSample[135] = 8'hde; sineAudioSample[136] = 8'hdf;
    sineAudioSample[137] = 8'hdf; sineAudioSample[138] = 8'he0; sineAudioSample[139] = 8'he0;
    sineAudioSample[140] = 8'he1; sineAudioSample[141] = 8'he1; sineAudioSample[142] = 8'he2;
    sineAudioSample[143] = 8'he2; sineAudioSample[144] = 8'he3; sineAudioSample[145] = 8'he3;
    sineAudioSample[146] = 8'he4; sineAudioSample[147] = 8'he4; sineAudioSample[148] = 8'he5;
    sineAudioSample[149] = 8'he5; sineAudioSample[150] = 8'he6; sineAudioSample[151] = 8'he6;
    sineAudioSample[152] = 8'he6; sineAudioSample[153] = 8'he7; sineAudioSample[154] = 8'he7;
    sineAudioSample[155] = 8'he8; sineAudioSample[156] = 8'he8; sineAudioSample[157] = 8'he9;
    sineAudioSample[158] = 8'he9; sineAudioSample[159] = 8'hea; sineAudioSample[160] = 8'hea;
    sineAudioSample[161] = 8'hea; sineAudioSample[162] = 8'heb; sineAudioSample[163] = 8'heb;
    sineAudioSample[164] = 8'hec; sineAudioSample[165] = 8'hec; sineAudioSample[166] = 8'hed;
    sineAudioSample[167] = 8'hed; sineAudioSample[168] = 8'hed; sineAudioSample[169] = 8'hee;
    sineAudioSample[170] = 8'hee; sineAudioSample[171] = 8'hef; sineAudioSample[172] = 8'hef;
    sineAudioSample[173] = 8'hef; sineAudioSample[174] = 8'hf0; sineAudioSample[175] = 8'hf0;
    sineAudioSample[176] = 8'hf0; sineAudioSample[177] = 8'hf1; sineAudioSample[178] = 8'hf1;
    sineAudioSample[179] = 8'hf1; sineAudioSample[180] = 8'hf2; sineAudioSample[181] = 8'hf2;
    sineAudioSample[182] = 8'hf2; sineAudioSample[183] = 8'hf3; sineAudioSample[184] = 8'hf3;
    sineAudioSample[185] = 8'hf3; sineAudioSample[186] = 8'hf4; sineAudioSample[187] = 8'hf4;
    sineAudioSample[188] = 8'hf4; sineAudioSample[189] = 8'hf5; sineAudioSample[190] = 8'hf5;
    sineAudioSample[191] = 8'hf5; sineAudioSample[192] = 8'hf6; sineAudioSample[193] = 8'hf6;
    sineAudioSample[194] = 8'hf6; sineAudioSample[195] = 8'hf7; sineAudioSample[196] = 8'hf7;
    sineAudioSample[197] = 8'hf7; sineAudioSample[198] = 8'hf7; sineAudioSample[199] = 8'hf8;
    sineAudioSample[200] = 8'hf8; sineAudioSample[201] = 8'hf8; sineAudioSample[202] = 8'hf8;
    sineAudioSample[203] = 8'hf9; sineAudioSample[204] = 8'hf9; sineAudioSample[205] = 8'hf9;
    sineAudioSample[206] = 8'hf9; sineAudioSample[207] = 8'hfa; sineAudioSample[208] = 8'hfa;
    sineAudioSample[209] = 8'hfa; sineAudioSample[210] = 8'hfa; sineAudioSample[211] = 8'hfa;
    sineAudioSample[212] = 8'hfb; sineAudioSample[213] = 8'hfb; sineAudioSample[214] = 8'hfb;
    sineAudioSample[215] = 8'hfb; sineAudioSample[216] = 8'hfb; sineAudioSample[217] = 8'hfb;
    sineAudioSample[218] = 8'hfc; sineAudioSample[219] = 8'hfc; sineAudioSample[220] = 8'hfc;
    sineAudioSample[221] = 8'hfc; sineAudioSample[222] = 8'hfc; sineAudioSample[223] = 8'hfc;
    sineAudioSample[224] = 8'hfc; sineAudioSample[225] = 8'hfd; sineAudioSample[226] = 8'hfd;
    sineAudioSample[227] = 8'hfd; sineAudioSample[228] = 8'hfd; sineAudioSample[229] = 8'hfd;
    sineAudioSample[230] = 8'hfd; sineAudioSample[231] = 8'hfd; sineAudioSample[232] = 8'hfe;
    sineAudioSample[233] = 8'hfe; sineAudioSample[234] = 8'hfe; sineAudioSample[235] = 8'hfe;
    sineAudioSample[236] = 8'hfe; sineAudioSample[237] = 8'hfe; sineAudioSample[238] = 8'hfe;
    sineAudioSample[239] = 8'hfe; sineAudioSample[240] = 8'hfe; sineAudioSample[241] = 8'hfe;
    sineAudioSample[242] = 8'hfe; sineAudioSample[243] = 8'hfe; sineAudioSample[244] = 8'hff;
    sineAudioSample[245] = 8'hff; sineAudioSample[246] = 8'hff; sineAudioSample[247] = 8'hff;
    sineAudioSample[248] = 8'hff; sineAudioSample[249] = 8'hff; sineAudioSample[250] = 8'hff;
    sineAudioSample[251] = 8'hff; sineAudioSample[252] = 8'hff; sineAudioSample[253] = 8'hff;
    sineAudioSample[254] = 8'hff; sineAudioSample[255] = 8'hff;

//initial begin
//Test random values and their altered output (PASSED)
//    for(i = 0; i < 1024; i = i +1) begin
//       audioSample_tb = $urandom % 15;
//       #period;
//    end

//Test first bit of sineAudioSample
    for(i = 0; i < 255; i = i +1) begin
        audioSample_tb = sineAudioSample[i];
        #period;
     end 
end

endmodule
