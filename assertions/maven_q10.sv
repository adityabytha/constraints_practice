/* whenever valid goes high, enable signal should be asserted in the next cycle and it should be stable till ready signal is asserted. The ready signal should be asserted after enable within 4 to 6 cycles */

property ppt1;
	@(posedge clk) valid |=> enable ##0 ($stable(enable))[
