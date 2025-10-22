//Assertions: For a streaming interface with valid/ready, ensure that data remains stable while valid is 1 and ready is 0, but allow data to change in the same cycle ready becomes 1. Write the property using throughout/overlapped operators to avoid off-by-one errors.
//

property ppt1;
	@(posedge clk) disable iff (rst) $stable(data) throughout (valid && !ready);
endproperty

property ppt1;
	@(posedge clk) ((valid && !ready),data_latched = data) |-> data == data_latched throughout (valid && !ready);
endproperty

