/*Q5: Complex Pattern Constraint
Write a constraint for a 16-bit variable pattern such that:

It should have exactly 6 bits set to '1'

No consecutive 3 bits should be all '1' (i.e., avoid "111" patterns)

The MSB and LSB should always be different
*/

class pattern;
	rand bit [15:0] ptrn;
	
	constraint s1 { $countones(ptrn) == 6;
					ptrn[15] != ptrn[0];
					(ptrn & (ptrn >> 1) & (ptrn >> 2)) == 0;
					}
					
endclass

module q5;
	pattern pt1 = new();
	
	initial begin
		repeat(10) begin
			pt1.randomize();
			$display("pattern = %b",pt1.ptrn);
		end
	end
	
endmodule
