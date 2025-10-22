
assert property (@(posedge clk) req |-> rst_n);

assert property (@(posedge clk) req |-> ##[0:2] ack);

assert property (@(posedge clk) first_match(valid) |-> $stable(valid)[*0:$] ##0 ready);

assert property (@(posedge clk) not (read && write));

assert property (@(posedge clk) $stable(data_bus) within (req |-> ##[0:$] ack));


