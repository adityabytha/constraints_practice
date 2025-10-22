// Write an assertion to check divide by 2 circuit

module divide_by_2_unsigned(
    input  logic [7:0] in_num,
    output logic [7:0] out_num
);
    // Division by 2 using logical right shift
    always_comb
    	assert(out_num == in_num >> 1);

	//assert property ( out_num == (in_num >> 1) );
endmodule
