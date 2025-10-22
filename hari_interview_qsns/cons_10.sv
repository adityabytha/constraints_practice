//https://forkjoin.in/interview_questions_systemverilog/interview_questions_systemverilog_home.html
//
//constraint to partition the 1MB region of memory in to 8 non overlapping
//regions, 8 base and 8 offset addresses as outputs, assume addresses are byte
//addressable and byte allighned
//

class mem_part;
	rand bit [4:0] base[8];
	rand bit [4:0] offset[8];

	//1MB = 2^20 bytes anta
	//so 20 address bits
	
	constraint all1 { foreach(base[i])
	if(i>0)
		base[i] > (base[i-1] + offset[i-1]);
				
			}
	constraint two { foreach(offset[i]) 
				offset[i] > base[i]; }
	function void display();
		for( int i = 0; i<8; i++) begin
			$display("%0d. base = 0x%d and offset = 0x%d",i,base[i],offset[i]);
		end
	endfunction
endclass

module tb;
	mem_part m1;
	initial begin
		m1 = new();
		m1.randomize();
		m1.display();
	end
endmodule


