module lab7 (input logic [3:0] num, 
             input [2:0] sel,
             input logic write, reset, clk,
             output logic anode_0, anode_1, anode_2, anode_3, anode_4, anode_5, anode_6, anode_7,
             output logic cathode_A, cathode_B, cathode_C, cathode_D, cathode_E, cathode_F, cathode_G
            );
    logic E0, E1, E2, E3, E4, E5, E6, E7, count_E;
    logic [3:0] wire0, wire1, wire2, wire3, wire4, wire5, wire6, wire7;
    logic x, y, z,myclock;
    logic [2:0] count_In, count_out;
    //delayed clock
        myclockdelay tff (
            .clk(clk),
            .reset(reset),
            .myclock(myclock)
        );
        always_comb
        begin
            x = sel[2];
            y = sel[1];
            z = sel[0];
        end
    //selecting the d_ff
        assign E0 = write & (!x) & (!y) & (!z);
        assign E1 = write & (!x) & (!y) & z;
        assign E2 = write & (!x) & y & (!z);
        assign E3 = write & (!x) & y & z;
        assign E4 = write & x & (!y) & (!z);
        assign E5 = write & x & (!y) & z;
        assign E6 = write & x & y & (!z);
        assign E7 = write & x & y & z;
        assign count_E = !write;
    //for 3_bit d_ff's
        d_ff flipflop0 (
            .q(wire0),
            .clk(myclock),
            .reset(reset),
            .enable(E0),
            .d(num)
        );
        d_ff flipflop1 (
            .q(wire1),
            .clk(myclock),
            .reset(reset),
            .enable(E1),
            .d(num)
        );
        d_ff flipflop2 (
            .q(wire2),
            .clk(myclock),
            .reset(reset),
            .enable(E2),
            .d(num)
        );
        d_ff flipflop3 (
            .q(wire3),
            .clk(myclock),
            .reset(reset),
            .enable(E3),
            .d(num)
        );
        d_ff flipflop4 (
            .q(wire4),
            .clk(myclock),
            .reset(reset),
            .enable(E4),
            .d(num)
        );
        d_ff flipflop5 (
            .q(wire5),
            .clk(myclock),
            .reset(reset),
            .enable(E5),
            .d(num)
        );
        d_ff flipflop6 (
            .q(wire6),
            .clk(myclock),
            .reset(reset),
            .enable(E6),
            .d(num)
        );
        d_ff flipflop7 (
            .q(wire7),
            .clk(myclock),
            .reset(reset),
            .enable(E7),
            .d(num)
        );
    //counter for selector
        //combinational way to write adder
        always_comb count_In = count_out + 1;
        //basic code of adder circuit with some changes
        always_ff @(posedge myclock or posedge reset)
        begin
            if (reset) begin
                count_out <= #1 0;
            end
            else if (count_E) begin
                count_out <= #1 count_In;
            end
        end
    //selecting the input for MUX(8X1)
        logic [2:0] m;
        always_comb begin
            case (write)
                1'b1: m = sel;
                1'b0: m = count_out;
            endcase
        end
    //saving the output for the d_ff's for certain selectors
        logic [3:0] n;
        always_comb begin
            case (m)
                3'b000: n = wire0;
                3'b001: n = wire1;
                3'b010: n = wire2;
                3'b011: n = wire3;
                3'b100: n = wire4;
                3'b101: n = wire5;
                3'b110: n = wire6;
                3'b111: n = wire7;
            endcase
        end
    //decoder for cathode
        logic [6:0] cath;
        always_comb
        begin
            cathode_A = cath[6];
            cathode_B = cath[5];
            cathode_C = cath[4];
            cathode_D = cath[3];
            cathode_E = cath[2];
            cathode_F = cath[1];
            cathode_G = cath[0];
        end
        always_comb begin
            case (n)
                4'b0000: cath = 7'b0000001;
                4'b0001: cath = 7'b1001111;
                4'b0010: cath = 7'b0010010;
                4'b0011: cath = 7'b0000110;
                4'b0100: cath = 7'b1001100;
                4'b0101: cath = 7'b0100100;
                4'b0110: cath = 7'b0100000;
                4'b0111: cath = 7'b0001111;
                4'b1000: cath = 7'b0000000;
                4'b1001: cath = 7'b0000100;
                4'b1010: cath = 7'b0001000;
                4'b1011: cath = 7'b1100000;
                4'b1100: cath = 7'b0110001;
                4'b1101: cath = 7'b1000010;
                4'b1110: cath = 7'b0110000;
                4'b1111: cath = 7'b0111000;
            endcase
        end
    //decoder for anode
        logic [7:0] anod;
        always_comb
        begin
            anode_0 = anod[7];
            anode_1 = anod[6];
            anode_2 = anod[5];
            anode_3 = anod[4];
            anode_4 = anod[3];
            anode_5 = anod[2];
            anode_6 = anod[1];
            anode_7 = anod[0];
        end
        always_comb begin
            case (m)
                3'b000: anod = 8'b01111111;
                3'b001: anod = 8'b10111111;
                3'b010: anod = 8'b11011111;
                3'b011: anod = 8'b11101111;
                3'b100: anod = 8'b11110111;
                3'b101: anod = 8'b11111011;
                3'b110: anod = 8'b11111101;
                3'b111: anod = 8'b11111110;
            endcase
        end

endmodule