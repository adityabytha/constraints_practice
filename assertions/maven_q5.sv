/* When d changes to 1, on next cycle, if b==true then c should be [->2] ##1 a, else a should be [->2] ##1 c */

property ppt;
	@(posedge clk) d |=> if(b) 
							c[->2] ##1 a;
						else
							a[->2] ##1 c;
							
endproperty
