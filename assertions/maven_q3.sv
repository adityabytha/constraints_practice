/* To verify the clock with 50% duty cycle of any given time period */

module clocker;
	logic clk;
	
	always #5 clk = ~clk;

	time t_pos,t_neg,tp;
	always @(posedge clk) t_pos = $time;
	always @(negedge clk) t_neg = $time;
	
	always @(posedge clk) begin
		assert(($time - t_neg) == t_pos - t_neg);
	end
	
endmodule 
