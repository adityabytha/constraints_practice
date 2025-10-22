class c1;
  rand bit [4:0] q[$];
  
  constraint c01 { q.size() inside { [7:15] };
                 foreach(q[i])
                   if(i>0)
                     if(q[i-1]==5'd7)
                       q[i] != 5'd7;
                  q.sum() with (int'( item == 7 )) == 4;
                }
  
  function void display();
    foreach(q[i])
      $display("q[%0d]=%d",i,q[i]);
  endfunction
endclass

module tb;
  c1 c;
  initial begin
    c=new();
    c.randomize();
    c.display();
  end
endmodule
