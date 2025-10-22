class c2;
  rand bit [3:0] arr[10];
  
  constraint c02 { foreach(arr[i]){
    if(i>0)
      arr[i-1] < arr[i];
    foreach(arr[j])
      if(i!=j)
        arr[i] != arr[j];
  }
                }
      function void display();
                 $display("arr=%p",arr);
  endfunction
endclass
module tb;
  c2 c;
  initial begin
    c=new();
    c.randomize();
    c.display();
  end
endmodule
