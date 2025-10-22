//write a constraint to generate all numbers of power of 2 without using 2**n
//or any inbuilt function for power

class c3;
	rand bit [10:0] number;

	constraint c03 { $onehot(number[10:1]) == 1;
			number[0] == 0;}
endclass

module tb;
  c3 c;
  initial begin
    c=new();
    repeat(10) begin
	    c.randomize();
	    $display("num=%d",c.number);
    end
  end
endmodule
