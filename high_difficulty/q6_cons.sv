//Constraints: You have a packet with fields: len (rand int unsigned, 0..1024), payload (rand byte unsigned payload[] with dynamic size), and crc (rand bit [15:0]). Constrain payload.size() to equal len, len to be even unless mode==BYPASS, and crc to be the XOR of all payload bytes rotated left by 1. Provide constraints and explain where to compute CRC (constraint vs. post_randomize) and why.
//

`define BYPASS 1

class packet;
	rand bit [9:0] len;
	rand bit [7:0] payload[];
	rand bit [15:0] crc;
	bit mode;

	constraint c1 { payload.size() == len; }

	constraint c2 { if(mode != `BYPASS) { len[0] == 0;} };

	function new(bit mode);
		this.mode = mode;
	endfunction

	function void display();
		$display("len = %0d",len);
		$display("payload[] = %p",payload);
		$display("crc = %b",crc);
		$display("mode = %b", mode);
	endfunction

	function bit [15:0] compute_crc(bit[9:0] len, bit[7:0] payload[]);
		bit [15:0] crc_val = 16'b0;
		bit [7:0] rotated_val;

		foreach(payload[i]) begin
			rotated_val = (payload[i] << 1) | (payload[i] >> 7);
			crc_val = crc_val ^ rotated_val;
		end					
		return crc_val;
	endfunction

	function void post_randomize();
		crc = compute_crc(len,payload);
	endfunction

endclass

module top;

	packet pkt;
	initial begin
		pkt = new(1);
		pkt.randomize();
		pkt.display();
		pkt=null;
		pkt = new(0);
		pkt.randomize();
		pkt.display();
	end
endmodule
				
