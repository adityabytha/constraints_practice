module tb;
	reg clk, rst, d;
	wire q;
	wire q2;
	dff dut (clk,rst,d,q);
	dff dut2(clk,rst,~q,q2);
	initial begin
		clk = 0;
		rst = 1;
		d=0;
		#8;
		rst = 0;
		d=0;#6;
		d=1;#4;
		d=0;#4;
		d=1;#4;
		d=0;#4;
		d=1;#4;
		d=0;#4;
		d=1;#4;
		#4;
		$finish();
	end
	always #2 clk = ~clk;
endmodule

