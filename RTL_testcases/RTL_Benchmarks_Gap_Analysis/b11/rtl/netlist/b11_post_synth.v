/* Generated by Yosys 0.16+65 (git sha1 051517d61, gcc 9.1.0 -fPIC -Os) */

module b11(stbi, clock, reset, x_in, x_out);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire [8:0] _073_;
  wire [9:0] _074_;
  wire [8:0] _075_;
  wire [8:0] _076_;
  wire [9:0] _077_;
  wire [8:0] _078_;
  wire [8:0] _079_;
  wire [6:0] _080_;
  wire [5:0] _081_;
  input clock;
  wire clock;
  wire [4:0] cont;
  wire [8:0] cont1;
  wire [5:0] r_in;
  input reset;
  wire reset;
  wire [3:0] stato;
  input stbi;
  wire stbi;
  input [5:0] x_in;
  wire [5:0] x_in;
  output [5:0] x_out;
  wire [5:0] x_out;
  dffsre _082_ (
    .C(clock),
    .D(x_in[5]),
    .E(_001_),
    .Q(r_in[5]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _083_ (
    .C(clock),
    .D(x_in[4]),
    .E(_001_),
    .Q(r_in[4]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _084_ (
    .C(clock),
    .D(x_in[3]),
    .E(_001_),
    .Q(r_in[3]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _085_ (
    .C(clock),
    .D(x_in[2]),
    .E(_001_),
    .Q(r_in[2]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _086_ (
    .C(clock),
    .D(x_in[1]),
    .E(_001_),
    .Q(r_in[1]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _087_ (
    .C(clock),
    .D(x_in[0]),
    .E(_001_),
    .Q(r_in[0]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _088_ (
    .C(clock),
    .D(_003_),
    .E(_002_),
    .Q(cont1[0]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _089_ (
    .C(clock),
    .D(_005_),
    .E(_004_),
    .Q(cont1[1]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _090_ (
    .C(clock),
    .D(_009_),
    .E(_008_),
    .Q(_016_),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _091_ (
    .C(clock),
    .D(_010_),
    .E(_008_),
    .Q(_017_),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _092_ (
    .C(clock),
    .D(_011_),
    .E(_008_),
    .Q(cont1[6]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _093_ (
    .C(clock),
    .D(_012_),
    .E(_008_),
    .Q(cont1[5]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _094_ (
    .C(clock),
    .D(_013_),
    .E(_008_),
    .Q(cont1[4]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _095_ (
    .C(clock),
    .D(_014_),
    .E(_008_),
    .Q(cont1[3]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _096_ (
    .C(clock),
    .D(_015_),
    .E(_008_),
    .Q(cont1[2]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _097_ (
    .C(clock),
    .D(_019_),
    .E(_018_),
    .Q(x_out[5]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _098_ (
    .C(clock),
    .D(_020_),
    .E(_018_),
    .Q(x_out[4]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _099_ (
    .C(clock),
    .D(_021_),
    .E(_018_),
    .Q(x_out[3]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _100_ (
    .C(clock),
    .D(_022_),
    .E(_018_),
    .Q(x_out[2]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _101_ (
    .C(clock),
    .D(_023_),
    .E(_018_),
    .Q(x_out[1]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _102_ (
    .C(clock),
    .D(_024_),
    .E(_018_),
    .Q(x_out[0]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _103_ (
    .C(clock),
    .D(_026_),
    .E(_025_),
    .Q(cont[4]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _104_ (
    .C(clock),
    .D(_027_),
    .E(_025_),
    .Q(cont[3]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _105_ (
    .C(clock),
    .D(_028_),
    .E(_025_),
    .Q(cont[2]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _106_ (
    .C(clock),
    .D(_029_),
    .E(_025_),
    .Q(cont[1]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _107_ (
    .C(clock),
    .D(_030_),
    .E(_025_),
    .Q(cont[0]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _108_ (
    .C(clock),
    .D(_031_),
    .E(1'b1),
    .Q(stato[0]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _109_ (
    .C(clock),
    .D(_032_),
    .E(1'b1),
    .Q(stato[1]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _110_ (
    .C(clock),
    .D(_033_),
    .E(1'b1),
    .Q(stato[2]),
    .R(_072_),
    .S(1'b1)
  );
  dffsre _111_ (
    .C(clock),
    .D(_034_),
    .E(1'b1),
    .Q(stato[3]),
    .R(_072_),
    .S(1'b1)
  );
  assign _024_ = 16'b1100101000000000 >> { stato[3], _016_, _081_[0], cont1[0] };
  assign _019_ = 32'd1336934400 >> { stato[3], cont1[5], _016_, _007_, cont1[4] };
  assign _075_[2] = 4'b0110 >> { r_in[2], cont1[2] };
  assign _035_ = 64'b0111111111111111111111111111111111111111111111111111111111111110 >> { r_in[5], r_in[0], r_in[4:3], r_in[1], r_in[2] };
  assign _034_ = 16'b1100000100000000 >> { stato[1], stato[2], stato[0], _035_ };
  assign _002_ = 64'b0101010100000000000000000000111111111111111100111111000000000000 >> { stato[2:0], stato[3], _035_, r_in[2] };
  assign _022_ = 16'b1100101000000000 >> { stato[3], _016_, _081_[2], cont1[2] };
  assign _075_[1] = 4'b0110 >> { cont1[1], r_in[1] };
  assign _028_ = 16'b0111100000000000 >> { stato[1], cont[2:0] };
  assign _029_ = 64'b0000000010111111111111110000000000000000000000000000000000000000 >> { stato[1], cont[0], cont[1], cont[4:2] };
  assign _020_ = 16'b1011010000000000 >> { stato[3], cont1[4], _016_, _007_ };
  assign _030_ = 4'b0100 >> { stato[1], cont[0] };
  assign _023_ = 16'b1100101000000000 >> { stato[3], _016_, _081_[1], cont1[1] };
  assign _021_ = 16'b1100101000000000 >> { stato[3], _016_, _081_[3], cont1[3] };
  assign _027_ = 64'b0011111111110111110000000000000000000000000000000000000000000000 >> { stato[1], cont[3:0], cont[4] };
  assign _075_[4] = 4'b0110 >> { r_in[4], cont1[4] };
  assign _018_ = 16'b0000000000001011 >> { stato[1], stato[2], stato[0], stato[3] };
  assign _075_[0] = 4'b0110 >> { r_in[0], cont1[0] };
  assign _036_ = 8'b10101100 >> { r_in[1], _079_[3], _076_[3] };
  assign _037_ = 32'd3225397930 >> { stato[1], cont1[3], cont1[1], cont1[2], _036_ };
  assign _038_ = 32'd3433754864 >> { stato[0], r_in[0], r_in[3], cont[2], cont[3] };
  assign _039_ = 64'b0011001111111111111111110011011111111100111110001111000011111100 >> { cont1[2], r_in[3:2], cont1[1], stato[1], cont1[0] };
  assign _014_ = 64'b0000111111110000101010101010101011001100110011001100110011001100 >> { stato[2], stato[0], cont1[3], _039_, _038_, _037_ };
  assign _040_ = 8'b11100000 >> { cont1[3], cont1[1], cont1[2] };
  assign _041_ = 8'b00000111 >> { cont1[5:4], _040_ };
  assign _042_ = 32'd16646144 >> { stato[0], _041_, cont1[5], cont1[0], cont1[2] };
  assign _043_ = 16'b0000000011111110 >> { _016_, _017_, cont1[6], _042_ };
  assign _044_ = 16'b0000110010101111 >> { stato[0], stato[1], stbi, _035_ };
  assign _031_ = 64'b0000000001010101111111111100110011110000111100001111000011110000 >> { stato[2:0], _044_, r_in[1], _043_ };
  assign _045_ = 16'b0000000000000111 >> { cont1[3], cont1[4], cont1[2:1] };
  assign _046_ = 64'b0000000000000011000011111111111111111111111011110000111000000000 >> { r_in[2], cont1[3:2], r_in[3], cont1[1:0] };
  assign _047_ = 16'b1100101000000000 >> { r_in[3], _046_, cont1[4], r_in[2] };
  assign _048_ = 64'b1111111111111111110011001100000000000001001100111111111111111111 >> { r_in[2], cont1[4], cont1[2:1], cont1[3], cont1[0] };
  assign _049_ = 16'b0000001100001010 >> { _048_, r_in[3], cont1[5], r_in[2] };
  assign _050_ = 32'd51358463 >> { stato[0], cont1[5], _049_, _047_, _045_ };
  assign _051_ = 64'b0000111111110000000011111111000011001100110011001010101010101010 >> { stato[0], r_in[1], _041_, cont1[6], _076_[6], _079_[6] };
  assign _011_ = 32'd3282698240 >> { stato[2:1], _050_, cont1[6], _051_ };
  assign _052_ = 64'b0000111111110000000011111111000010101010101010101100110011001100 >> { stato[0], r_in[1], _040_, cont1[4], _079_[4], _076_[4] };
  assign _053_ = 64'b0101010101010101111111111100000010101010101010100000000000111111 >> { cont1[4], stato[0], cont1[3], cont1[1], cont1[2], _046_ };
  assign _054_ = 32'd3433754864 >> { stato[0], r_in[0], r_in[4], cont[3], cont[4] };
  assign _013_ = 32'd2865557744 >> { stato[2:1], _054_, _052_, _053_ };
  assign _008_ = 64'b1111111111001100110011000000111111111111111100001111010100000000 >> { stato[2], stato[0], stato[1], stato[3], _043_, _035_ };
  assign _004_ = 64'b0111111111111111111111111111111100000000000000000000000000000000 >> { _008_, r_in[3], stato[1], stato[2], stato[0], r_in[2] };
  assign _055_ = 64'b1111000001010101000000000000000011110000001100111111111111111111 >> { r_in[1], stato[2:1], cont1[1], _079_[1], _076_[1] };
  assign _056_ = 32'd805294080 >> { cont1[1], stato[1], cont1[0], r_in[3:2] };
  assign _057_ = 32'd252693674 >> { stato[2], r_in[0], _056_, cont[0], cont[1] };
  assign _005_ = 8'b11000101 >> { stato[0], _057_, _055_ };
  assign _075_[5] = 4'b0110 >> { r_in[5], cont1[5] };
  assign _075_[3] = 4'b0110 >> { r_in[3], cont1[3] };
  assign _058_ = 8'b00110101 >> { r_in[1], _076_[5], _079_[5] };
  assign _059_ = 64'b1111111111111111000000001111000001110111011101110111011101110111 >> { stato[1], _047_, r_in[3], _048_, _040_, cont1[4] };
  assign _060_ = 64'b1100110011001100001100110011001100001111101010101111000010101010 >> { stato[0], cont1[5], stato[1], _045_, _059_, _058_ };
  assign _012_ = 64'b0000000011111111000000001111111110001000100010001111000011110000 >> { stato[2], stato[0], _060_, r_in[5], r_in[0], cont[4] };
  assign _061_ = 64'b0111011100000000111111110000000011111111000000000000111100000000 >> { _017_, cont1[6], stato[0], _049_, _047_, cont1[5] };
  assign _062_ = 16'b0100000000000000 >> { cont1[5], _017_, cont1[6], _045_ };
  assign _063_ = 64'b1111111100001111111111110000111101010101010101011100110011001100 >> { stato[0], r_in[1], cont1[6], _041_, _000_, _006_ };
  assign _064_ = 64'b1111111111111111000000000000111110100000101000100011000011110011 >> { stato[0], stato[1], _063_, _017_, r_in[1], _062_ };
  assign _009_ = 32'd2406481920 >> { stato[2], _016_, _064_, stato[1], _061_ };
  assign _026_ = 64'b1111101111111111100000000000000000000000000000000000000000000000 >> { stato[1], cont[4:2], cont[0], cont[1] };
  assign _065_ = 64'b0101010111111111110011001111111100001111000011111111111111111111 >> { cont1[6], stato[0], cont1[5], _049_, _045_, _047_ };
  assign _010_ = 32'd3282370560 >> { stato[2:1], _017_, _065_, _063_ };
  assign _025_ = 32'd52675 >> { stato[2:0], stato[3], _035_ };
  assign _001_ = 16'b0000000000001101 >> { stato[1], stato[2], stato[0], stato[3] };
  assign _066_ = 32'd4042282291 >> { stato[1], r_in[1], cont1[0], _079_[0], _076_[0] };
  assign _003_ = 32'd858983152 >> { stato[2], stato[0], r_in[0], _066_, cont[0] };
  assign _033_ = 8'b01111000 >> stato[2:0];
  assign _067_ = 64'b0000111111110000000011111111000010101010101010101100110011001100 >> { stato[1], r_in[1], cont1[2:1], _079_[2], _076_[2] };
  assign _068_ = 8'b10101100 >> { r_in[0], cont[2:1] };
  assign _069_ = 64'b0011111111110011000010000000010011000000000011001111011111111011 >> { cont1[2:1], r_in[3:2], stato[1], cont1[0] };
  assign _015_ = 64'b1111000011110000110011001100110011111111000000001010101010101010 >> { stato[2], stato[0], _068_, _069_, _067_, r_in[2] };
  assign _070_ = 64'b0000000100010001010101010101010101010101010101010101010101010100 >> { r_in[3], r_in[4], r_in[1:0], r_in[2], r_in[5] };
  assign _071_ = 16'b1111101000111111 >> { stato[0], stato[1], _070_, stbi };
  assign _032_ = 64'b0000000001010101111111110011001100001111000011110000111100001111 >> { stato[2], stato[0], stato[1], _071_, r_in[1], _043_ };
  assign _072_ = 2'b01 >> reset;
  assign _078_[2] = 2'b01 >> _075_[2];
  assign _073_[6] = 2'b01 >> cont1[6];
  assign _073_[1] = 2'b01 >> cont1[1];
  assign _078_[1] = 2'b01 >> _075_[1];
  assign _078_[4] = 2'b01 >> _075_[4];
  assign _078_[0] = 2'b01 >> _075_[0];
  assign _073_[3] = 2'b01 >> cont1[3];
  assign _073_[2] = 2'b01 >> cont1[2];
  assign _078_[5] = 2'b01 >> _075_[5];
  assign _078_[3] = 2'b01 >> _075_[3];
  assign _073_[0] = 2'b01 >> cont1[0];
  adder_carry _197_ (
    .cin(_074_[7]),
    .g(1'b0),
    .p(1'b0),
    .sumout(_006_)
  );
  adder_carry _198_ (
    .cin(_074_[0]),
    .cout(_074_[1]),
    .g(r_in[0]),
    .p(_075_[0]),
    .sumout(_076_[0])
  );
  adder_carry _199_ (
    .cin(_074_[1]),
    .cout(_074_[2]),
    .g(r_in[1]),
    .p(_075_[1]),
    .sumout(_076_[1])
  );
  adder_carry _200_ (
    .cin(_074_[2]),
    .cout(_074_[3]),
    .g(r_in[2]),
    .p(_075_[2]),
    .sumout(_076_[2])
  );
  adder_carry _201_ (
    .cin(_074_[3]),
    .cout(_074_[4]),
    .g(r_in[3]),
    .p(_075_[3]),
    .sumout(_076_[3])
  );
  adder_carry _202_ (
    .cin(_074_[4]),
    .cout(_074_[5]),
    .g(r_in[4]),
    .p(_075_[4]),
    .sumout(_076_[4])
  );
  adder_carry _203_ (
    .cin(_074_[5]),
    .cout(_074_[6]),
    .g(r_in[5]),
    .p(_075_[5]),
    .sumout(_076_[5])
  );
  adder_carry _204_ (
    .cin(_074_[6]),
    .cout(_074_[7]),
    .g(1'b0),
    .p(cont1[6]),
    .sumout(_076_[6])
  );
  adder_carry _205_ (
    .cout(_074_[0]),
    .g(1'b0),
    .p(1'b0)
  );
  adder_carry _206_ (
    .cin(_077_[7]),
    .g(1'b0),
    .p(1'b0),
    .sumout(_000_)
  );
  adder_carry _207_ (
    .cin(_077_[0]),
    .cout(_077_[1]),
    .g(r_in[0]),
    .p(_078_[0]),
    .sumout(_079_[0])
  );
  adder_carry _208_ (
    .cin(_077_[1]),
    .cout(_077_[2]),
    .g(r_in[1]),
    .p(_078_[1]),
    .sumout(_079_[1])
  );
  adder_carry _209_ (
    .cin(_077_[2]),
    .cout(_077_[3]),
    .g(r_in[2]),
    .p(_078_[2]),
    .sumout(_079_[2])
  );
  adder_carry _210_ (
    .cin(_077_[3]),
    .cout(_077_[4]),
    .g(r_in[3]),
    .p(_078_[3]),
    .sumout(_079_[3])
  );
  adder_carry _211_ (
    .cin(_077_[4]),
    .cout(_077_[5]),
    .g(r_in[4]),
    .p(_078_[4]),
    .sumout(_079_[4])
  );
  adder_carry _212_ (
    .cin(_077_[5]),
    .cout(_077_[6]),
    .g(r_in[5]),
    .p(_078_[5]),
    .sumout(_079_[5])
  );
  adder_carry _213_ (
    .cin(_077_[6]),
    .cout(_077_[7]),
    .g(1'b0),
    .p(_073_[6]),
    .sumout(_079_[6])
  );
  adder_carry _214_ (
    .cout(_077_[0]),
    .g(1'b1),
    .p(1'b0)
  );
  adder_carry _215_ (
    .cin(_080_[4]),
    .g(1'b0),
    .p(1'b0),
    .sumout(_007_)
  );
  adder_carry _216_ (
    .cin(_080_[0]),
    .cout(_080_[1]),
    .g(1'b0),
    .p(_073_[0]),
    .sumout(_081_[0])
  );
  adder_carry _217_ (
    .cin(_080_[1]),
    .cout(_080_[2]),
    .g(1'b0),
    .p(_073_[1]),
    .sumout(_081_[1])
  );
  adder_carry _218_ (
    .cin(_080_[2]),
    .cout(_080_[3]),
    .g(1'b0),
    .p(_073_[2]),
    .sumout(_081_[2])
  );
  adder_carry _219_ (
    .cin(_080_[3]),
    .cout(_080_[4]),
    .g(1'b0),
    .p(_073_[3]),
    .sumout(_081_[3])
  );
  adder_carry _220_ (
    .cout(_080_[0]),
    .g(1'b1),
    .p(1'b0)
  );
  assign _075_[8:6] = cont1[8:6];
  assign _078_[7:6] = _073_[7:6];
endmodule
