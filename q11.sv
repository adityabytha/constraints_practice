
typedef enum {READ, WRITE} rw_e;

class Transaction;
  rand rw_e rw;
  rand bit [2:0] addr, data;
endclass

class RandTransaction;
	int TESTS=20;
  rand Transaction trans_array[];

  constraint rw_c {foreach (trans_array[i])
    if ((i>0) && (trans_array[i-1].rw == WRITE))
      trans_array[i].rw != WRITE;}
      
	constraint rw_addr { foreach(trans_array[i]) {
							if((i>0) && (trans_array[i-1].rw == trans_array[i].rw))
								trans_array[i-1].addr != trans_array[i].addr;
								}
								};
		
		
  function new();
    trans_array = new[TESTS];
    foreach (trans_array[i])
      trans_array[i] = new();
  endfunction

	function void print_all;
    	foreach(trans_array[i])
    		$display("addr = %d, data = %d, rw = %s", trans_array[i].addr, trans_array[i].data, trans_array[i].rw);
    		
    endfunction

endclass

module q11;
	
	
	initial begin
		RandTransaction tr = new();
		tr.randomize();
		tr.print_all();
		
	end

endmodule
