/* At posedge clk if A is asserted, then in next cycle B should go high & C should be stable.
C should not change till B goes low. Once B goes low, in same cycle C should change.*/

property ppt;
	 A |=> ( (B && $stable(C)) ##1 (B && $stable(C))[*0:$] ##1 (!B && $changed(C) ));
endproperty

ppt1: assert property(ppt);
