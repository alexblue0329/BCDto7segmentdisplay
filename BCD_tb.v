module BCDtoSEVEN_tb();
reg clk_tb, reset_tb, load_tb;
reg [3:0] Din_tb;
BCD BCD_1(.clk(clk_tb), .rst_syn(reset_tb), .load_syn(load_tb), .Din(Din_tb));

initial
begin
    clk_tb=1'b1;
    reset_tb=1'b1;
    load_tb=1'b0;
    Din_tb=4'b0101;
end

always
begin
    #10 clk_tb = ~clk_tb;
end

initial
begin
    #80 reset_tb=1'b0;
    #10 reset_tb=1'b1;
end

initial
begin
    #80 load_tb=1'b1;
    #10 load_tb=1'b0;
end
initial
begin
    #120 load_tb=1'b1;
    #10 load_tb=1'b0;
end

initial
begin
    #400 $finish;
end

initial
begin
    $dumpfile("BCD.vcd");
    $dumpvars(0, BCD_1);
end
endmodule
