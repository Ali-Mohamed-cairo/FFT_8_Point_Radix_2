module FFT_8_Point_Radix_2_Wrapper #(
			parameter SIGNAL_SAMPLE_REAL_WIDTH = 'd9,
					  SIGNAL_SAMPLE_IMG_WIDTH  = 'd9,
					  FIRST_MULTI_OUT          = 'd9,
					  FIRST_OUT_x0             = 'd10,
					  FIRST_OUT_x1             = 'd9,
					  SECOND_MULTI_0or2        = 'd10,
					  SECOND_MULTI_1or3        = 'd9,
					  SECOND_OUT_00or20        = 'd11,
					  SECOND_OUT_01or21        = 'd10,
					  SECOND_OUT_1xor3x        = 'd9,
					  THIRD_MULTI_OUT0         = 'd11,
					  THIRD_MULTI_OUT_1or2or3  = 'd11,
					  THIRD_OUTx_x             = 'd12
		)(
		input wire signed IN0_Real,
		input wire signed IN0_Img ,
		input wire signed IN1_Real,
		input wire signed IN1_Img ,
		input wire signed IN2_Real,
		input wire signed IN2_Img ,
		input wire signed IN3_Real,
		input wire signed IN3_Img ,
		input wire signed IN4_Real,
		input wire signed IN4_Img ,
		input wire signed IN5_Real,
		input wire signed IN5_Img ,
		input wire signed IN6_Real,
		input wire signed IN6_Img ,
		input wire signed IN7_Real,
		input wire signed IN7_Img ,
		input wire CLK            ,
		input wire RST            ,
		input wire Load           ,
		
		output reg signed OUT0_Real,
		output reg signed OUT0_Img ,
		output reg signed OUT1_Real,
		output reg signed OUT1_Img ,
		output reg signed OUT2_Real,
		output reg signed OUT2_Img ,
		output reg signed OUT3_Real,
		output reg signed OUT3_Img ,
		output reg signed OUT4_Real,
		output reg signed OUT4_Img ,
		output reg signed OUT5_Real,
		output reg signed OUT5_Img ,
		output reg signed OUT6_Real,
		output reg signed OUT6_Img ,
		output reg signed OUT7_Real,
		output reg signed OUT7_Img                                              
	);
	
	localparam IDLE           = 'd0000,
			   SERIAL_IN      = 'd0001,
			   PARALLEL_LOAD  = 'd0011,
			   VALID_OUT      = 'd0010;
			   
	//Shift in registers
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] Shift_IN0_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  Shift_IN0_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] Shift_IN1_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  Shift_IN1_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] Shift_IN2_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  Shift_IN2_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] Shift_IN3_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  Shift_IN3_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] Shift_IN4_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  Shift_IN4_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] Shift_IN5_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  Shift_IN5_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] Shift_IN6_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  Shift_IN6_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] Shift_IN7_Real; 
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  Shift_IN7_Img ;
	
	//Parallel load registers
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] SignalSample_0_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  SignalSample_0_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] SignalSample_1_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  SignalSample_1_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] SignalSample_2_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  SignalSample_2_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] SignalSample_3_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  SignalSample_3_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] SignalSample_4_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  SignalSample_4_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] SignalSample_5_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  SignalSample_5_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] SignalSample_6_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  SignalSample_6_Img ;
	reg signed [SIGNAL_SAMPLE_REAL_WIDTH-1:0] SignalSample_7_Real;
	reg signed [SIGNAL_SAMPLE_IMG_WIDTH-1:0]  SignalSample_7_Img ;
	
	//Parallel out wires
	wire signed [THIRD_OUTx_x-1:0] Third_OUT00_Real;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT00_Img ;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT01_Real;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT01_Img ;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT10_Real;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT10_Img ;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT11_Real;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT11_Img ;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT20_Real;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT20_Img ;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT21_Real;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT21_Img ;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT30_Real;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT30_Img ;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT31_Real;
	wire signed [THIRD_OUTx_x-1:0] Third_OUT31_Img ;
	
	//Serial out registers
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT0_Real;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT0_Img ;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT1_Real;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT1_Img ;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT2_Real;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT2_Img ;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT3_Real;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT3_Img ;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT4_Real;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT4_Img ;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT5_Real;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT5_Img ;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT6_Real;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT6_Img ;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT7_Real;
	reg signed [THIRD_OUTx_x-1:0] Shift_OUT7_Img ;
	
	
	reg [3:0] Cu_State, Next_State;
	
	//Counter signals
	reg [5:0]  Counter_Init    ;	   
	reg        Counter_Load    ;
	reg        Counter_Down    ;         
	wire [5:0] Counter         ;
	wire       Counter_ZeroFlg ; 

	reg [3:0] bit_index;  // counter for bit shifting
	
	Dn_Counter Count_module(
		.IN     ( Counter_Init   ),	   	  	//The input bus whose value will be loaded when Load signal is high.
		.Load   ( Counter_Load   ),     	  	  	//The input signal which is high when it's required to load an input value @ IN bus to the counter.
		.Down   ( Counter_Down   ),      	  		//The input signal which is high to indicate the order to count down.
		.Clk    ( CLK            ),            		//Clock signal.
		.RSTn   ( !RST           ),                //Active low asynchronous reset signal.
		.Counter( Counter        ),  		//The output which carry the current counter value.
		.Low    ( Counter_ZeroFlg)  	 		//This flag signal is high to indicate the counter reached 0.
	);
	
	
	//TOP instantiation
	FFT_8_Point_Radix_2_TOP #(
		//Inputs parameters (Naming convention: (STAGE_ORDER)_IN(MAC_ORDER)(INPUT_ORDER)_(REALorIMG)_WIDTH)
		.SIGNALSAMPLE_0_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_0_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_1_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_1_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_2_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_2_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_3_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_3_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_4_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_4_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_5_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_5_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_6_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_6_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		.SIGNALSAMPLE_7_REAL_WIDTH ( SIGNAL_SAMPLE_REAL_WIDTH ), 
		.SIGNALSAMPLE_7_IMG_WIDTH  ( SIGNAL_SAMPLE_IMG_WIDTH  ), 
		//Multipliers parameters (Naming convention: (STAGE_ORDER)_MUTLI(MAC_ORDER)_(REALorIMG)_WIDTH)
		.FIRST_MULTI0_REAL_WIDTH ( FIRST_MULTI_OUT ), .SECOND_MULTI0_REAL_WIDTH ( SECOND_MULTI_0or2 ), .THIRD_MULTI0_REAL_WIDTH ( THIRD_MULTI_OUT0 ),
		.FIRST_MULTI0_IMG_WIDTH  ( FIRST_MULTI_OUT ), .SECOND_MULTI0_IMG_WIDTH  ( SECOND_MULTI_0or2 ), .THIRD_MULTI0_IMG_WIDTH  ( THIRD_MULTI_OUT0 ),
		.FIRST_MULTI1_REAL_WIDTH ( FIRST_MULTI_OUT ), .SECOND_MULTI1_REAL_WIDTH ( SECOND_MULTI_1or3 ), .THIRD_MULTI1_REAL_WIDTH ( THIRD_MULTI_OUT_1or2or3 ),
		.FIRST_MULTI1_IMG_WIDTH  ( FIRST_MULTI_OUT ), .SECOND_MULTI1_IMG_WIDTH  ( SECOND_MULTI_1or3 ), .THIRD_MULTI1_IMG_WIDTH  ( THIRD_MULTI_OUT_1or2or3 ),
		.FIRST_MULTI2_REAL_WIDTH ( FIRST_MULTI_OUT ), .SECOND_MULTI2_REAL_WIDTH ( SECOND_MULTI_0or2 ), .THIRD_MULTI2_REAL_WIDTH ( THIRD_MULTI_OUT_1or2or3 ),
		.FIRST_MULTI2_IMG_WIDTH  ( FIRST_MULTI_OUT ), .SECOND_MULTI2_IMG_WIDTH  ( SECOND_MULTI_0or2 ), .THIRD_MULTI2_IMG_WIDTH  ( THIRD_MULTI_OUT_1or2or3 ),
		.FIRST_MULTI3_REAL_WIDTH ( FIRST_MULTI_OUT ), .SECOND_MULTI3_REAL_WIDTH ( SECOND_MULTI_1or3 ), .THIRD_MULTI3_REAL_WIDTH ( THIRD_MULTI_OUT_1or2or3 ),
		.FIRST_MULTI3_IMG_WIDTH  ( FIRST_MULTI_OUT ), .SECOND_MULTI3_IMG_WIDTH  ( SECOND_MULTI_1or3 ), .THIRD_MULTI3_IMG_WIDTH  ( THIRD_MULTI_OUT_1or2or3 ),
		//Outputs parameters (Naming convention: (STAGE_ORDER)_OUT(MAC_ORDER)(INPUT_ORDER)_(REALorIMG)_WIDTH)
		.FIRST_OUT00_REAL_WIDTH ( FIRST_OUT_x0 ), .SECOND_OUT00_REAL_WIDTH ( SECOND_OUT_00or20 ), .THIRD_OUT00_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT00_IMG_WIDTH  ( FIRST_OUT_x0 ), .SECOND_OUT00_IMG_WIDTH  ( SECOND_OUT_00or20 ), .THIRD_OUT00_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT01_REAL_WIDTH ( FIRST_OUT_x1 ), .SECOND_OUT01_REAL_WIDTH ( SECOND_OUT_01or21 ), .THIRD_OUT01_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT01_IMG_WIDTH  ( FIRST_OUT_x1 ), .SECOND_OUT01_IMG_WIDTH  ( SECOND_OUT_01or21 ), .THIRD_OUT01_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT10_REAL_WIDTH ( FIRST_OUT_x0 ), .SECOND_OUT10_REAL_WIDTH ( SECOND_OUT_1xor3x ), .THIRD_OUT10_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT10_IMG_WIDTH  ( FIRST_OUT_x0 ), .SECOND_OUT10_IMG_WIDTH  ( SECOND_OUT_1xor3x ), .THIRD_OUT10_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT11_REAL_WIDTH ( FIRST_OUT_x1 ), .SECOND_OUT11_REAL_WIDTH ( SECOND_OUT_1xor3x ), .THIRD_OUT11_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT11_IMG_WIDTH  ( FIRST_OUT_x1 ), .SECOND_OUT11_IMG_WIDTH  ( SECOND_OUT_1xor3x ), .THIRD_OUT11_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT20_REAL_WIDTH ( FIRST_OUT_x0 ), .SECOND_OUT20_REAL_WIDTH ( SECOND_OUT_00or20 ), .THIRD_OUT20_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT20_IMG_WIDTH  ( FIRST_OUT_x0 ), .SECOND_OUT20_IMG_WIDTH  ( SECOND_OUT_00or20 ), .THIRD_OUT20_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT21_REAL_WIDTH ( FIRST_OUT_x1 ), .SECOND_OUT21_REAL_WIDTH ( SECOND_OUT_01or21 ), .THIRD_OUT21_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT21_IMG_WIDTH  ( FIRST_OUT_x1 ), .SECOND_OUT21_IMG_WIDTH  ( SECOND_OUT_01or21 ), .THIRD_OUT21_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT30_REAL_WIDTH ( FIRST_OUT_x0 ), .SECOND_OUT30_REAL_WIDTH ( SECOND_OUT_1xor3x ), .THIRD_OUT30_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT30_IMG_WIDTH  ( FIRST_OUT_x0 ), .SECOND_OUT30_IMG_WIDTH  ( SECOND_OUT_1xor3x ), .THIRD_OUT30_IMG_WIDTH  ( THIRD_OUTx_x ),
		.FIRST_OUT31_REAL_WIDTH ( FIRST_OUT_x1 ), .SECOND_OUT31_REAL_WIDTH ( SECOND_OUT_1xor3x ), .THIRD_OUT31_REAL_WIDTH ( THIRD_OUTx_x ),
		.FIRST_OUT31_IMG_WIDTH  ( FIRST_OUT_x1 ), .SECOND_OUT31_IMG_WIDTH  ( SECOND_OUT_1xor3x ), .THIRD_OUT31_IMG_WIDTH  ( THIRD_OUTx_x ) 
	) FFT_8_Point_Radix_2_Unit(
		.SignalSample_0_Real( SignalSample_0_Real ),
		.SignalSample_0_Img ( SignalSample_0_Img  ),
		.SignalSample_1_Real( SignalSample_1_Real ),
		.SignalSample_1_Img ( SignalSample_1_Img  ),
		.SignalSample_2_Real( SignalSample_2_Real ),
		.SignalSample_2_Img ( SignalSample_2_Img  ),
		.SignalSample_3_Real( SignalSample_3_Real ),
		.SignalSample_3_Img ( SignalSample_3_Img  ),
		.SignalSample_4_Real( SignalSample_4_Real ),
		.SignalSample_4_Img ( SignalSample_4_Img  ),
		.SignalSample_5_Real( SignalSample_5_Real ),
		.SignalSample_5_Img ( SignalSample_5_Img  ),
		.SignalSample_6_Real( SignalSample_6_Real ),
		.SignalSample_6_Img ( SignalSample_6_Img  ),
		.SignalSample_7_Real( SignalSample_7_Real ),
		.SignalSample_7_Img ( SignalSample_7_Img  ),
		
		.CLK( CLK ) , //Clocking signal                      
		.RST( RST ) , //Active high asynchronous reset signal
		       
		.Third_OUT00_Real( Third_OUT00_Real ),
		.Third_OUT00_Img ( Third_OUT00_Img  ),
		.Third_OUT01_Real( Third_OUT01_Real ),
		.Third_OUT01_Img ( Third_OUT01_Img  ),
		.Third_OUT10_Real( Third_OUT10_Real ),
		.Third_OUT10_Img ( Third_OUT10_Img  ),
		.Third_OUT11_Real( Third_OUT11_Real ),
		.Third_OUT11_Img ( Third_OUT11_Img  ),
		.Third_OUT20_Real( Third_OUT20_Real ),
		.Third_OUT20_Img ( Third_OUT20_Img  ),
		.Third_OUT21_Real( Third_OUT21_Real ),
		.Third_OUT21_Img ( Third_OUT21_Img  ),
		.Third_OUT30_Real( Third_OUT30_Real ),
		.Third_OUT30_Img ( Third_OUT30_Img  ),
		.Third_OUT31_Real( Third_OUT31_Real ),
		.Third_OUT31_Img ( Third_OUT31_Img  ) 
	);
	
	//Counter control logic
	always @(*) begin
		Counter_Init = 'd0 ;
		Counter_Load = 1'b0;
		Counter_Down = 1'b0;
		case(Cu_State)
			IDLE          : begin
				Counter_Init = 'd18;
				Counter_Load = 1'b1;
				Counter_Down = 1'b0;
			end
			SERIAL_IN     : begin
				Counter_Init = 'd18;
				Counter_Load = 1'b0;
				Counter_Down = 1'b1;
			end
			PARALLEL_LOAD : begin
				Counter_Init = 'd18;
				Counter_Load = 1'b0;
				Counter_Down = 1'b1;
			end
			VALID_OUT     : begin
				if(Load) begin
					Counter_Init = 'd10;
					Counter_Load = 1'b1;
					Counter_Down = 1'b0;
				end
				else begin
					Counter_Init = 'd18;
					Counter_Load = 1'b1;
					Counter_Down = 1'b0;
				end
			end
			default       : begin
				Counter_Init = 'd0;
				Counter_Load = 1'b0;
				Counter_Down = 1'b0;
			end
		endcase
	end
	
	//Next state logic
	always @(*) begin
		Next_State = IDLE;
		case(Cu_State)
			IDLE          : begin
				if(Load) begin
					Next_State = SERIAL_IN;
				end
				else begin
					Next_State = IDLE;
				end
			end
			SERIAL_IN     : begin
				if(Counter == 'd10) begin
					Next_State = PARALLEL_LOAD;
				end
				else begin
					Next_State = SERIAL_IN;
				end
			end
			PARALLEL_LOAD : begin
				if(Counter == 'd2) begin
					Next_State = VALID_OUT;
				end
				else begin
					Next_State = PARALLEL_LOAD;
				end
			end
			VALID_OUT     : begin
				if(!Load) begin
					Next_State = IDLE;
				end
				else begin
					Next_State = PARALLEL_LOAD;
				end
			end
			default       : begin
				Next_State = IDLE;
			end
		endcase
	end
	
	//Current state logic
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			Cu_State <= IDLE;
		end
		else begin
			Cu_State <= Next_State;
		end
	end
	
	//Output logic
		//Shift in registers
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			Shift_IN0_Real <= 'd0;
			Shift_IN0_Img  <= 'd0;
			Shift_IN1_Real <= 'd0;
			Shift_IN1_Img  <= 'd0;
			Shift_IN2_Real <= 'd0;
			Shift_IN2_Img  <= 'd0;
			Shift_IN3_Real <= 'd0;
			Shift_IN3_Img  <= 'd0;
			Shift_IN4_Real <= 'd0;
			Shift_IN4_Img  <= 'd0;
			Shift_IN5_Real <= 'd0;
			Shift_IN5_Img  <= 'd0;
			Shift_IN6_Real <= 'd0;
			Shift_IN6_Img  <= 'd0;
			Shift_IN7_Real <= 'd0;
			Shift_IN7_Img  <= 'd0;
		end
		else begin
			if(Cu_State == SERIAL_IN) begin
				Shift_IN0_Real <= {IN0_Real, Shift_IN0_Real[7:1]};
				Shift_IN0_Img  <= {IN0_Img , Shift_IN0_Img [7:1]};
				Shift_IN1_Real <= {IN1_Real, Shift_IN1_Real[7:1]};
				Shift_IN1_Img  <= {IN1_Img , Shift_IN1_Img [7:1]};
				Shift_IN2_Real <= {IN2_Real, Shift_IN2_Real[7:1]};
				Shift_IN2_Img  <= {IN2_Img , Shift_IN2_Img [7:1]};
				Shift_IN3_Real <= {IN3_Real, Shift_IN3_Real[7:1]};
				Shift_IN3_Img  <= {IN3_Img , Shift_IN3_Img [7:1]};
				Shift_IN4_Real <= {IN4_Real, Shift_IN4_Real[7:1]};
				Shift_IN4_Img  <= {IN4_Img , Shift_IN4_Img [7:1]};
				Shift_IN5_Real <= {IN5_Real, Shift_IN5_Real[7:1]};
				Shift_IN5_Img  <= {IN5_Img , Shift_IN5_Img [7:1]};
				Shift_IN6_Real <= {IN6_Real, Shift_IN6_Real[7:1]};
				Shift_IN6_Img  <= {IN6_Img , Shift_IN6_Img [7:1]};
				Shift_IN7_Real <= {IN7_Real, Shift_IN7_Real[7:1]};
				Shift_IN7_Img  <= {IN7_Img , Shift_IN7_Img [7:1]};
			end
		end
	end
		//Parallel in registers
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			SignalSample_0_Real <= 'd0;
			SignalSample_0_Img  <= 'd0;
			SignalSample_1_Real <= 'd0;
			SignalSample_1_Img  <= 'd0;
			SignalSample_2_Real <= 'd0;
			SignalSample_2_Img  <= 'd0;
			SignalSample_3_Real <= 'd0;
			SignalSample_3_Img  <= 'd0;
			SignalSample_4_Real <= 'd0;
			SignalSample_4_Img  <= 'd0;
			SignalSample_5_Real <= 'd0;
			SignalSample_5_Img  <= 'd0;
			SignalSample_6_Real <= 'd0;
			SignalSample_6_Img  <= 'd0;
			SignalSample_7_Real <= 'd0;
			SignalSample_7_Img  <= 'd0;
		end
		else begin
			if(Cu_State == PARALLEL_LOAD) begin
				SignalSample_0_Real <= Shift_IN0_Real;
				SignalSample_0_Img  <= Shift_IN0_Img ;
				SignalSample_1_Real <= Shift_IN1_Real;
				SignalSample_1_Img  <= Shift_IN1_Img ;
				SignalSample_2_Real <= Shift_IN2_Real;
				SignalSample_2_Img  <= Shift_IN2_Img ;
				SignalSample_3_Real <= Shift_IN3_Real;
				SignalSample_3_Img  <= Shift_IN3_Img ;
				SignalSample_4_Real <= Shift_IN4_Real;
				SignalSample_4_Img  <= Shift_IN4_Img ;
				SignalSample_5_Real <= Shift_IN5_Real;
				SignalSample_5_Img  <= Shift_IN5_Img ;
				SignalSample_6_Real <= Shift_IN6_Real;
				SignalSample_6_Img  <= Shift_IN6_Img ;
				SignalSample_7_Real <= Shift_IN7_Real;
				SignalSample_7_Img  <= Shift_IN7_Img ;
			end
		end
	end
	
		//Serial out registers
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			Shift_OUT0_Real <= 'd0;
			Shift_OUT0_Img  <= 'd0;
			Shift_OUT1_Real <= 'd0;
			Shift_OUT1_Img  <= 'd0;
			Shift_OUT2_Real <= 'd0;
			Shift_OUT2_Img  <= 'd0;
			Shift_OUT3_Real <= 'd0;
			Shift_OUT3_Img  <= 'd0;
			Shift_OUT4_Real <= 'd0;
			Shift_OUT4_Img  <= 'd0;
			Shift_OUT5_Real <= 'd0;
			Shift_OUT5_Img  <= 'd0;
			Shift_OUT6_Real <= 'd0;
			Shift_OUT6_Img  <= 'd0;
			Shift_OUT7_Real <= 'd0;
			Shift_OUT7_Img  <= 'd0;
		end
		else begin
			if(Cu_State == VALID_OUT) begin
				Shift_OUT0_Real <= Third_OUT00_Real;
				Shift_OUT0_Img  <= Third_OUT00_Img ;
				Shift_OUT1_Real <= Third_OUT01_Real;
				Shift_OUT1_Img  <= Third_OUT01_Img ;
				Shift_OUT2_Real <= Third_OUT10_Real;
				Shift_OUT2_Img  <= Third_OUT10_Img ;
				Shift_OUT3_Real <= Third_OUT11_Real;
				Shift_OUT3_Img  <= Third_OUT11_Img ;
				Shift_OUT4_Real <= Third_OUT20_Real;
				Shift_OUT4_Img  <= Third_OUT20_Img ;
				Shift_OUT5_Real <= Third_OUT21_Real;
				Shift_OUT5_Img  <= Third_OUT21_Img ;
				Shift_OUT6_Real <= Third_OUT30_Real;
				Shift_OUT6_Img  <= Third_OUT30_Img ;
				Shift_OUT7_Real <= Third_OUT31_Real;
				Shift_OUT7_Img  <= Third_OUT31_Img ;
			end
		end
	end	
	
	always @(posedge CLK or posedge RST) begin
		if (RST) begin
			bit_index <= 0;
		end else if (Cu_State == VALID_OUT) begin
			bit_index <= 0;   // restart shifting when new data loaded
		end else begin
			bit_index <= bit_index + 1;
		end
	end
	
		//Chip result outputs
	always @(*) begin
		OUT0_Real = Shift_OUT0_Real[bit_index];
		OUT0_Img  = Shift_OUT0_Img [bit_index];
		OUT1_Real = Shift_OUT1_Real[bit_index];
		OUT1_Img  = Shift_OUT1_Img [bit_index];
		OUT2_Real = Shift_OUT2_Real[bit_index];
		OUT2_Img  = Shift_OUT2_Img [bit_index];
		OUT3_Real = Shift_OUT3_Real[bit_index];
		OUT3_Img  = Shift_OUT3_Img [bit_index];
		OUT4_Real = Shift_OUT4_Real[bit_index];
		OUT4_Img  = Shift_OUT4_Img [bit_index];
		OUT5_Real = Shift_OUT5_Real[bit_index];
		OUT5_Img  = Shift_OUT5_Img [bit_index];
		OUT6_Real = Shift_OUT6_Real[bit_index];
		OUT6_Img  = Shift_OUT6_Img [bit_index];
		OUT7_Real = Shift_OUT7_Real[bit_index];
	    OUT7_Img  = Shift_OUT7_Img [bit_index];
	end
	
endmodule
