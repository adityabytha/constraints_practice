//Constraints: Constrain three rand bit [7:0] variables a,b,c so that they form a Pythagorean triple scaled by an unknown integer k>0 (i.e., there exist x,y,k with a=kx, b=ky, c=k*sqrt(x^2+y^2)), with x,y chosen from the primitive set {(3,4,5),(5,12,13),(8,15,17)}. Express this using dist or implications and discuss integer sqrt feasibility.


class pytha;
	rand bit [7:0] a,b,c;
	rand bit [31:0] k;
	rand bit [7:0] x,y,z;
	bit[7:0] triple[3][3] = '{ '{3,4,5},'{5,12,13},'{8,15,17}};
	rand bit [1:0] sel;


	constraint c1 { k >= 1;
			a == k*x;
			b == k*y;
			c == k*z;
			sel inside {[0:2]};
			x == triple[sel][0];
			y == triple[sel][1];
			z == triple[sel][2];
		}
	function void display();
		$display("a=%d, b=%d, c=%d and k=%d",a,b,c,k);
	endfunction
endclass

module top;
	pytha py;
	initial begin
		py = new();
		py.randomize();
		py.display();
	end
endmodule
