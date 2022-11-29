module not_gate(b,a);

output b;
input a;
not n1(b,a);
endmodule

module stimulus1;
wire b;
reg a;

not_gate n2(b,a);

initial
a= 1'b0;

always
#5 a=~a;

initial
$mointor($time,"Output b = %b", b);
endmodule