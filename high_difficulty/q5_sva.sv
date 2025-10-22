
//Assertions: Design a property for a handshake where grant implies request has been high for at least 2 consecutive cycles immediately prior, and once grant is asserted, request must drop within 1–2 cycles. Ensure the property is robust across back-to-back grants without false failures.
//

property pp1;
	@(posedge clk) disable iff (rst) $rose(grant) |-> ($past(request,1) && $past(request,2)) ##[1:2] $fell(request);
endproperty

