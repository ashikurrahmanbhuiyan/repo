module sr_latch (q,q_bar,set,reset);

output q,q_bar;
input set,reset;

nand n1(q,set,q_bar);
nand n2(q_bar,reset,q);
    
endmodule

module simulate_sr_latch;

wire q,q_bar;
reg set,reset;

sr_latch s1(q,q_bar,set,reset);

initial begin
    set = 1;
    reset = 0;
end
always begin
    
    # 20 reset=~reset;
    # 20 set=~set;
    # 20 set=~set;
    # 20 reset = ~reset;
    
end
initial
$monitor($time,"Output=%b",q);

endmodule
