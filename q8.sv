class gimage;
	rand bit color;
	
	constraint avgwhite { color dist {0:=80, 1:=20}; }
endclass

module top;
	
	bit image[10][10];
	int count[2];
	
	initial begin
		gimage im1 = new();
		for(int i =0; i < 10; i++) begin
			for (int j = 0; j <10; j++) begin
				im1.randomize();
				image[i][j] = im1.color;
				count[im1.color]++;
			end
		end
		
		for(int i =0; i < 10; i++) begin
			for (int j = 0; j <10; j++) begin
				$write("%d ", image[i][j]);
			end
			$display();
		end
		$display("Black pixels: %0.0d",count[0]);
		$display("White pixels: %d",count[1]);
		
	end
endmodule
