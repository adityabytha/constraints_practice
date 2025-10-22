//`include "q2.sv"

class exercise1;
	rand bit [7:0] data;
	rand bit [3:0] addr;
	

	constraint s1 { addr inside {[3:4]};};


endclass

module quest1;
	initial begin
		exercise2 ex2 = new();
		repeat(20) begin
			ex2.randomize();
			$display("data = %d, addr = %d",ex2.data, ex2.addr);
		end
	end

endmodule
