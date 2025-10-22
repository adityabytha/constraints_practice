class exercise2;
	rand bit [7:0] data;
	rand bit [3:0] addr;
	
	constraint s1 { data == 8'd5; };
	constraint s2 { addr dist { 0:=10, [1:14] :/ 80 , 15 :=10 }; };

endclass

module quest2;
	int count[16], maxx[$];
	initial begin
		exercise2 ex2 = new();
		repeat(10000) begin
			ex2.randomize();
			count[ex2.addr]++;
			//$display("data = %d, addr = %d",ex2.data, ex2.addr);
		end
		maxx = count.max();
		
		foreach (count[i]) begin
			if (count[i]) begin
				$write("count[%.1d] = %3d ", i, count[i]);
				repeat (count[i]*50/maxx[0]) $write("*");
				$display;
			end
		end
	end
endmodule
