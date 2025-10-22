class MemTrans;
	rand bit rw;
	rand bit [7:0] data;
	rand bit [3:0] addr;
	
	constraint s1 { rw==0 -> addr inside {[0:7]}; };

endclass

module quest3;
	initial begin
		MemTrans ex3 = new();
		ex3.s1.constraint_mode(0);
		repeat(10) begin
			ex3.randomize() with { if(rw==0) { addr inside {[0:8]}; }
									};
			$display("rw = %d, data = %d, addr = %d",ex3.rw, ex3.data, ex3.addr);
		end
	end
endmodule
