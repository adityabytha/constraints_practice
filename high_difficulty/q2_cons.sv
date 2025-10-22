//Constraints: You have rand bit [9:0] A; Constrain elements to be pairwise distinct, each divisible by 5 or 7 (at least one), and the array’s sorted copy must be strictly increasing by at least 3 between adjacent elements. Show constraints that scale and discuss any pitfalls with O(n^2) distinctness.
//

class c1;
	rand bit [9:0] A[10];

	constraint s1 {	foreach(A[i]) 
				( A[i]%5 == 0 || A[i]%7 == 0 );
			foreach(A[i])
				if(i>0)
					A[i] >= A[i-1] + 10'd3;
		}
endclass

module top;
	c1 c;
	initial begin
		c = new();
		c.randomize();
		foreach(c.A[i]) begin
			$display("%d",c.A[i]);
		end
	end
endmodule



