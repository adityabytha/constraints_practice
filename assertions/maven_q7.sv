/* assertions for functionality of a mod-12 loadable up-down counter */

module mod12_loadable_updown_counter (
    input  logic        clk,
    input  logic        rst_n,    // Active-low synchronous reset
    input  logic        load,     // Load enable
    input  logic        up_down,  // 1 = count up, 0 = count down
    input  logic [3:0]  load_val, // Load value (only lower 4 bits used)
    input  logic        enable,   // Count enable
    output logic [3:0]  count     // 4-bit counter output
);

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            count <= 4'd0;
        end else if (load) begin
            count <= load_val % 12; // Ensure loading a mod-12 value
        end else if (enable) begin
            if (up_down) begin
                if (count == 4'd11)
                    count <= 4'd0;
                else
                    count <= count + 4'd1;
            end else begin
                if (count == 4'd0)
                    count <= 4'd11;
                else
                    count <= count - 4'd1;
            end
        end
    end

	property ppt1;
		@(posedge clk) 


endmodule



