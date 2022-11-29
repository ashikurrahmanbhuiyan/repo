module binary_toGray(g3,g2,g1,b3,b2,b1);
output g3,g2,g1;
input b3,b2,b1;

assign g3=b3;
 xor(g2,b3,b2);
 xor(g1,b2,b1);

endmodule

module gray_to_binary(b3,b2,b1,g3,g2,g1);

output b3,b2,b1;
input g3,g2,g1;

assign b3=g3;
xor(b2,b3,g2);
xor(b1,b2,g1);

endmodule

module magnitude_comparator_2bit(a1,a0,b1,b0,a_is_graterThan_b,a_equal_b,a_less_b);

output a_is_graterThan_b,a_equal_b,a_less_b;
input a1,a0,b1,b0;

assign a_is_graterThan_b = (a0*(~b1)*(~b0))+((~b0)*a1*a0)+(a1*(~b1));

assign a_equal_b = (a0~^b0)*(a1~^b1);

assign a_less_b = ~(a_is_graterThan_b+a_equal_b);

endmodule

