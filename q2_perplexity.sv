/*Q2: Array with Unique Elements
Write constraints for a dynamic array data[] where:

Array size should be between 5-10 elements

All elements should be unique

Each element should be between 10-50

Exactly 3 elements should be even numbers

writing code ignoring the last constraint for now.

*/


class randarr;
	rand bit [5:0] data[];

	constraint s1 { data.size() inside {[5:10]};
			data.sum() with (int'(item % 2 == 0)) == 3;
			};

	constraint s2 { foreach (data[i]) 
				foreach (data[j]) 
					if (i != j) 
						data[i] != data[j];
			};

	constraint s3 { foreach (data[i])
				data[i] inside {[10:50]};
			};
				

endclass	


module test;
	randarr rar;

	initial begin
		rar = new();
		rar.randomize();
		foreach (rar.data[i])
			$write("%d ,",rar.data[i]);
		$display;

	end
endmodule
