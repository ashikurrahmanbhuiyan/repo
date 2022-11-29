module  ripple_rarry_counter (q,clk,reset);
    
    output [3:0] q;
    input clk,reset;

    T_FF tff0(q[0],clk,reset);
    T_FF tff1(q[1],q[0],reset);
    T_FF tff2(q[2],q[1],reset);
    T_FF tff3(q[3],q[2],reset);

endmodule



module T_FF(q,clk,reset);

output q;
input clk , reset;
wire d;
D_FF dff0(q,d,clk,reset);
not n1(d,q);

endmodule
module jk_test;
reg j,k,clk,reset;
wire q,q_bar;
jk_ff jkff0(q,q_bar,j,k,clk,reset);


initial begin
    clk = 1'b0;
    reset = 1'b1;
end
initial
#5 reset = ~reset;
initial begin
j=1'b1;
k=1'b1;
#5 j=1'b0; k=1'b1;
#10 j=1'b1; k=1'b0;
#10 j=1'b0; k=1'b0;
#10 j=1'b1; k=1'b1;

end
always #5 clk =~clk;

endmodule

module jk_ff(q,q_bar,j,k,clk,reset);
output q,q_bar;
input j,k,clk,reset;
wire d;
assign d = j*(~q)+(~k)*q;
D_FF d_ff(q,d,clk,reset);
not(q_bar,q);


endmodule
module D_FF(q,d,clk,reset);

output reg q;
input d,clk,reset;


always @(posedge reset or posedge clk) 
    if(reset)
    q=1'b0;
    else
    q=d;



endmodule