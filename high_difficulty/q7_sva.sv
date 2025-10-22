//Assertions: Build a property that checks a variable-latency pipeline: when op_valid and op_id fire, the same op_id must reappear at out_valid after an unknown latency 2..10 cycles, provided cancel(op_id) never occurs in that window; if cancel happens, the expectation is withdrawn for that op_id only. Use local variables or dynamic arrays as needed.
	//
	//

property ppt1;
	bit [2:0] current_op_id;
	@(posedge clk) (op_valid, current_op_id = op_id) |-> sync_accept_on(cancel(current_op_id)) ##[2:10] (out_valid) && out_id == current_op_id));
endproperty


