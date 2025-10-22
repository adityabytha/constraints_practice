/*Write a constraint for a variable packet_size (8-bit) that generates:

70% probability for values between 64-127

20% probability for values between 1-63

10% probability for values between 128-255
*/

class packet;
	rand bit [7:0] packet_size;
	
	constraint s1 { packet_size dist {[1:63]:/20, [64:127]:/70, [128:255]:/10}; }
	
endclass

module test;
	packet pkt1;
	
	initial begin
		pkt1 = new();
		repeat(100) begin
			pkt1.randomize();
			$write("%0.0d,",pkt1.packet_size);
		end
		$display;
		
	end
endmodule
