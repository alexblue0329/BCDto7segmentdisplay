module BCD(clk, rst_syn, load_syn, Din);
input clk;
input rst_syn;
input load_syn;
input [3:0] Din;
output [3:0] Q_out;
reg [3:0] Q_out;
output [7:0] Ans;
reg [7:0] Ans;
initial
begin
    Q_out[3:0]=4'b0000;
end

always@ (posedge clk)
begin
    if (!rst_syn)
        Q_out=4'b0000;
    else if(load_syn)
        Q_out=Din;
    else if (Q_out == 9)
        Q_out=0;
    else
        Q_out=Q_out+1;
end
always @(Q_out)
case (Q_out)
    4'b0000:
        Ans=8'b11000000;
    4'b0001:
        Ans=8'b11111001;
    4'b0010:
        Ans=8'b10100100;
    4'b0011:
        Ans=8'b10110000;
    4'b0100:
        Ans=8'b10011001;
    4'b0101:
        Ans=8'b10010010;
    4'b0110:
        Ans=8'b10000010;
    4'b0111:
        Ans=8'b11111000;
    4'b1000:
        Ans=8'b10000000;
    4'b1001:
        Ans=8'b10010000;
    default:
        Ans=8'b10000100;
endcase
endmodule
