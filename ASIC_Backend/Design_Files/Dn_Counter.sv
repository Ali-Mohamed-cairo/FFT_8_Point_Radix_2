module Dn_Counter(
		input wire [5:0] IN,	   	  	//The input bus whose value will be loaded when Load signal is high.
		input wire Load,     	  	  	//The input signal which is high when it's required to load an input value @ IN bus to the counter.
		input wire Down,      	  		//The input signal which is high to indicate the order to count down.
		input wire Clk,            		//Clock signal.
		input wire RSTn,                //Active low asynchronous reset signal.
		output reg [5:0] Counter,  		//The output which carry the current counter value.
		output wire Low      	 		//This flag signal is high to indicate the counter reached 0.
	);
	
	//Assigning Counter_Comb in FFlop (Sequential always block)
	always @(posedge Clk or negedge RSTn) begin 
		if(!RSTn) begin
			Counter <= 5'd0;
		end
		else begin
			if(Load) begin
				//Load an input value
				Counter <= IN;
			end
			else if(Down && !Low) begin
				//Count down
				Counter <= Counter - 1'b1;
			end
		end
	end
	
	//Handling the module flags
	assign Low  = ~|(Counter);
	
endmodule 