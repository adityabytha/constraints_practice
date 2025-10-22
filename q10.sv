package my_package;

  typedef enum {READ, WRITE} rw_e;
  
  class Transaction;
    rw_e old_rw;
    rand rw_e rw;
    bit [3:0] old_addr;
    rand bit [3:0] addr, data;
    constraint rw_c{if (old_rw == WRITE) rw != WRITE;};
    
    constraint rw_addr { if(old_rw == rw) old_addr != addr; };
    
    function void post_randomize;
      old_rw = rw;
      old_addr = addr;
    endfunction
    
    function void print_all;
      $display("addr = %d, data = %d, rw = %s", addr, data, rw);
    endfunction
    
  endclass

endpackage


module top;
	import my_package::*;
	
	
	initial begin
		Transaction tr = new();
		repeat(20) begin
			tr.randomize();
			tr.print_all();
			
		end
	end
endmodule

