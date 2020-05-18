
module DIV_tb();


reg [31:0]in1,in2;
wire [31:0] out;

DIV DIV_0 (.in1(in1),.in2(in2),.out(out));

initial begin
	#10
	#10;
	in1 = 32'b00000000001000000000000000000000;

	in2 = 32'b00000000010000000000000000000000;
	#10;
end
endmodule 