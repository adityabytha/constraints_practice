//Write a constraint such that all the elements of a dynamic array are arranged in an ascending order

class c7;
	rand bit [4:0] arr[];

	constraint c07 { arr.size() == 7; foreach(arr[i]) if(i>0) arr[i-1]
		< arr[i]; }

	function void display();
                 $display("arr=%p",arr);
  endfunction
endclass
module tb;
  c7 c;
  initial begin
    c=new();
    c.randomize();
    c.display();
  end
endmodule
