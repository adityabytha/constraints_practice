/* When posedge of a signal 'a' is detected, check signal b has to be high continuously until signal c goes low */

property ppt1;
	@(posedge clk) $rose(a) |-> ( b[*1:$] ##0 !c );
	
endproperty 
