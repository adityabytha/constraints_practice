/* A goes high, from the next cycle B should repeat n no. of times, where n = value of bit[3:0]C when A is asserted */


property ppt;
	reg n;
	
	@(posedge clk) A |=> B[*C] 
	
