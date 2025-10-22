//Assertions: You need to ensure that once req rises, ack must arrive within 3–7 cycles, but if req deasserts before ack, the requirement is voided. Write a single property that handles this cancellation cleanly (no vacuous pass), and explain how you avoided overlapping obligations on repeated req pulses.


property p1;
	@(posedge clk)  $rose(req) |-> sync_accept_on(!req) ##[3:6] ack;

endproperty




