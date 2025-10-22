//Write a constraint to find an even number of ones in a variable. (Don't use system functions such as $countbits(a,1) )

class c8;
	rand bit [7:0] number;
	
	constraint c8 { ^number == 0; 
			}

	function void display();
      		$display("num=%0b",number);
	endfunction
endclass

module tb;
  c8 c;
  initial begin
    c=new();
    c.randomize();
    c.display();
  end
endmodule

