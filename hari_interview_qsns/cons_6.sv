//Write a constraint to generate a number that is always a multiple of 4.

class c6;
	rand bit [4:0] number;

	constraint c06 { number[1:0] == 2'b00;
}
endclass

module tb;
  c6 c;
  initial begin
    c=new();
    repeat(10) begin
	    c.randomize();
	    $display("num=%d",c.number);
    end
  end
endmodule
