module jk_flipflop(j,k,clk,reset,clr,q,q_bar);

input j,k,clk,reset,clr;

output q,q_bar;
not n5(r1,reset);
not n6(c1,clr);

wire j1,k1;

nand n1(j1,j,clk,q_bar);
nand n2(k1,k,clk,q);

nand n3(q,q_bar,j1);
nand n4(q_bar,q,k1);

always @(posedge reset or negedge clk);
if(reset)
q=1'0b;
else
q=j;



endmodule