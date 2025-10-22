/*
Q3: Dependent Variable Constraints
You have three variables: start_addr, end_addr, and current_addr. Write constraints such that:

start_addr is between 0x1000-0x2000

end_addr is always greater than start_addr by at least 0x100

current_addr should be within the range [start_addr : end_addr]
*/

class addr_cons;
	rand bit [15:0] start_addr, end_addr, current_addr;

	constraint s1 { start_addr[15:12] inside {[1:1]}; }
	constraint s2 { end_addr >= start_addr + 16'h0100; }
	constraint s3 { current_addr inside {[start_addr:end_addr]}; }
endclass

module test;
	addr_cons adr1 = new();

	initial begin
		repeat(10) begin
			adr1.randomize();
			$display("start_addr= %04x, current_addr= %04x, end_addr= %04x", adr1.start_addr, adr1.current_addr, adr1.end_addr);
		end
	end
endmodule
