module Twiddle_LUT(
		input  wire        [1:0]  Index   , // The upper twiddle factor index [0, 1, 2, 3]
		output reg  signed [11:0] W8_Real , // Real      part of the output
		output reg  signed [11:0] W8_Img    // Imaginary part of the output
	);
	
	//12 bits width: 2 integer bits + 10 fraction bits (contains either 0 = 0000... or 707 = 1011010011)
	wire signed [11:0] W8_Real_Mem [3:0];
	wire signed [11:0] W8_Img_Mem  [3:0];
	
	/*
	* W8_0 = 1 
	* W8_1 = 0.707 - 0.707j
	* W8_2 = -j
	* W8_3 = - 0.707 - 0.707j
	*/
	
	assign W8_Real_Mem[0] = 12'b01_0000_0000_00; // 0x400 = 1024
    assign W8_Real_Mem[1] = 12'b00_1011_0101_00; // 0x2D4 = 724  <-- corrected
    assign W8_Real_Mem[2] = 12'd0;               // 0x000 = 0
    assign W8_Real_Mem[3] = 12'b11_0100_1011_00; // 0xD2C = -724
           
    assign W8_Img_Mem[0]  = 12'd0;               // 0x000 = 0
    assign W8_Img_Mem[1]  = 12'b11_0100_1011_00; // 0xD2C = -724
    assign W8_Img_Mem[2]  = 12'b11_0000_0000_00; // 0xC00 = -1024
    assign W8_Img_Mem[3]  = 12'b11_0100_1011_00; // 0xD2C = -724
 
	
	always @(*) begin
		W8_Real = W8_Real_Mem[Index];
		W8_Img  = W8_Img_Mem[Index] ;
	end

endmodule