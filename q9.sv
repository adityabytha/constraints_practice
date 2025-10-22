class StimData;
	rand int arr[];
	
	constraint s1 { arr.size() inside {[1:1000]}; }
		
endclass

module test;
	StimData st = new();
	
	initial begin
		repeat(20) begin
			st.randomize();
			$display("size of array: %0.0d", st.arr.size());
		end
	end
endmodule
		
