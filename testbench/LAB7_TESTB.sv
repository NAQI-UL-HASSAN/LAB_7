module lab7_tb();

logic clk, reset, write;
logic [3:0]num1;
logic [2:0]sel1;
logic cathode_A1;
logic cathode_B1;
logic cathode_C1;
logic cathode_D1;
logic cathode_E1;
logic cathode_F1;
logic cathode_G1;
logic anode_00;
logic anode_11;
logic anode_22;
logic anode_33;
logic anode_44;
logic anode_55;
logic anode_66;
logic anode_77;
logic myclock;

LAB_7SOURCE MHH(
    .num(num1),
    .sel(sel1),
    .clk(clk),
    .myclock(myclock),
    .reset(reset),
    .write(write),
    .cathode_A(cathode_A1),
    .cathode_B(cathode_B1),
    .cathode_C(cathode_C1),
    .cathode_D(cathode_D1),
    .cathode_E(cathode_E1),
    .cathode_F(cathode_F1),
    .cathode_G(cathode_G1),
    .anode_0(anode_00),
    .anode_1(anode_11),
    .anode_2(anode_22),
    .anode_3(anode_33),
    .anode_4(anode_44),
    .anode_5(anode_55),
    .anode_6(anode_66),
    .anode_7(anode_77)
);

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin
    reset <= 1;
    write <= 1;
    num1 <= 4'b0000;
    sel1 <= 3'b000;

    @(posedge clk); reset <= 0;
    @(posedge myclock); sel1 <= #1 3'b001; num1 <= #1 4'b1001;
    @(posedge myclock); sel1 <= #1 3'b010; num1 <= #1 4'b1010;
    @(posedge myclock); sel1 <= #1 3'b011; num1 <= #1 4'b1011;
    @(posedge myclock); sel1 <= #1 3'b100; num1 <= #1 4'b1100;
    @(posedge myclock); sel1 <= #1 3'b101; num1 <= #1 4'b1101;
    @(posedge myclock); sel1 <= #1 3'b110; num1 <= #1 4'b1110;
    @(posedge myclock); sel1 <= #1 3'b111; num1 <= #1 4'b1111;
    @(posedge myclock); write <= #1 0;
    @(posedge myclock);
    $stop;
end
endmodule