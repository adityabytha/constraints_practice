//Constraints: Model a 2D grid rand int unsigned grid; Fill with numbers 0..31 such that each row and column is strictly increasing left-to-right and top-to-bottom; also the main diagonal entries are prime. Provide constraints and discuss solver performance and any need for pre/post_randomize helpers.
//

class c4;
	rand bit [5:0] grid[4][4];

	constraint c1 { foreach(grid[i,j])
				grid[i][j] inside {[0:31]};
		};

	constraint c2 { foreach(grid[i, j]) {
				if(i == j)
					grid[i][j] inside { 2,3,5,7,11,13,17,23,29,31 };
				if(j>0)
					grid[i][j] > grid[i][j-1];
				if(i>0)
					grid[i][j] > grid[i-1][j];
			}
		
			};
	/*
	constraint c3 { foreach(grid[i]) {
				foreach(grid[i][j]) {
					if(j>0)
						grid[i][j] > grid[i][j-1];
					if(i>0)
						grid[i][j] > grid[i-1][j];
			}
		}
	};
	*/								
				

 	function void display();
        	$display("--- Generated Grid (Rows: 4, Cols: 4) ---");
        	foreach (grid[r]) begin
            		$write("Row %0d: [", r);
            			foreach (grid[r][c]) begin
                			$write("%0d%s", grid[r][c], (c == 3) ? "" : ", ");
            			end
            		$display("]");
        	end
        	$display("---------------------------------------");
    	endfunction
    /*
	function void display();
		foreach(grid[i][j]) begin
			$write("%d, ",c.grid[i][j]);
			if(i==3)
				$display();
		end
	endfunction
*/
endclass

module top;
	c4 c;
	initial begin
		c = new();
		c.randomize();
		c.display();
	end
endmodule


