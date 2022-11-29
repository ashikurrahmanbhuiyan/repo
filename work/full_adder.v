module full_adder(cout,sum,a,b,cin);
output cout,sum;
input a,b,cin;
wire x,y,z;

xor(x,a,b);
and(y,a,b);
and(z,x,cin);
or(cout,y,z);
xor(sum,x,cin);

endmodule

module full_adder_4bit(cout,sum,a,b,cin);
output cout;
output [3:0] sum;
input [3:0] a,b;
input cin;

wire c1,c2,c3;

full_adder ff_0(c1,sum[0],a[0],b[0],cin);
full_adder ff_1(c2,sum[1],a[1],b[1],c1);
full_adder ff_2(c3,sum[2],a[2],b[2],c2);
full_adder ff_3(cout,sum[3],a[3],b[3],c3);

endmodule

module stimulate_full_adder;

reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

full_adder_4bit f1(cout,sum,a,b,cin);

initial
begin
    a=4'd0;
    b=4'd0;
    cin=1'b0;
    # 20 a=4'd3; b=4'd4;
    # 20 a=4'd5; b=4'd6;
    # 50 a=4'd7; b=4'd8;

end

initial
begin
$mointor($time,"output sum = %d and cout = %d",sum,cout);
end

endmodule


