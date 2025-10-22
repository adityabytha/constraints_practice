/*Q4: Conditional Constraint with Implication
Write a constraint for variables op_type (2-bit) and data_width (8-bit) where:

If op_type == 2'b00 (READ), then data_width should be 8, 16, or 32 only

If op_type == 2'b01 (WRITE), then data_width should be multiples of 8 between 8-64

If op_type == 2'b10 (BURST), then data_width should be exactly 128

If op_type == 2'b11 (IDLE), then data_width can be any value
*/

class tranx;
	rand bit [1:0] op_type;
	rand bit [7:0] data_width;
	
	constraint s1 { if(op_type == 2'b00) { data_width inside {8,16,32}; }
					if(op_type == 2'b01) { data_width inside {[8:64]}; data_width % 8 == 0; }
					if(op_type == 2'b10) { data_width == 8'd128; }
					solve op_type before data_width;
				};
				
endclass

module q4;
	tranx tr1 = new();
	
	initial begin
		repeat(10) begin
			tr1.randomize();
			$display("op_type = %d, data_width= %03d",tr1.op_type, tr1.data_width);
		end
	end
endmodule	
