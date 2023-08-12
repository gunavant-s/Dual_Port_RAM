`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gunavant
// 
// Create Date: 12.08.2023 11:45:53
// Design Name: 
// Module Name: tb_dual_port_ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_dual_port_ram();
    
    reg clkA, clkB;
    reg enA, enB;
    reg wrA, wrB;
    reg [2:0]addA,addB;
    reg  [7:0]dinA,dinB;
    wire [7:0]doutA,doutB;
    
    dual_port_RAM DUT(.clkA(clkA),
                      .clkB(clkB),
                      .enA(enA),
                      .enB(enB),
                      .wrA(wrA),
                      .wrB(wrB),
                      .addA(addA),
                      .addB(addB),
                      .dinA(dinA),
                      .dinB(dinB),
                      .doutA(doutA),
                      .doutB(doutB)
                      );
                      
    initial begin
        clkA = 0; clkB = 0;
        enA = 1; enB = 1;
        wrA = 1; wrB = 1;
        dinA = 8'b01001011; addA = 3'b001;
        dinB = 8'b01001111; addB = 3'b001;
        #10
        dinA = 8'b01001011; addA = 3'b010;
        dinB = 8'b00001111; addB = 3'b010;
        #10
        dinA = 8'b01111011; addA = 3'b011;
        dinB = 8'b00001110; addB = 3'b011;
        #10
        dinA = 8'b00000000; addA = 3'b100;
        dinB = 8'b11111111; addB = 3'b100;
        #10
        wrA = 0; wrB = 0;
        dinA = 8'bz; addA = 3'b001;
        dinB = 8'bz; addB = 3'b001;
        #10
        dinA = 8'bz; addA = 3'b010;
        dinB = 8'bz; addB = 3'b010;
        #10
        dinA = 8'bz; addA = 3'b011;
        dinB = 8'bz; addB = 3'b011;
        #10
        dinA = 8'bz; addA = 3'b100;
        dinB = 8'bz; addB = 3'b100;
        #10
        wrA = 1; wrB = 0;
        dinA = 8'b10101010; addA = 3'b001;
        dinB = 8'bz; addB = 3'b001;
        #10
        wrA = 0; wrB = 1;
        dinA = 8'bz; addA = 3'b001;
        dinB = 8'b10101010; addB = 3'b001;
        #20
        $stop;
     end
     
     always #5 clkA = ~clkA;
     always #5 clkB = ~clkB;
        
endmodule
