`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gunavant
// 
// Create Date: 12.08.2023 06:55:18
// Design Name: 
// Module Name: dual_port_RAM
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


module dual_port_RAM  (input clkA,
                       input enA,
                       input wrA,
                       input [2:0]addA,
                       input [7:0]dinA,
                       output reg [7:0]doutA,
                       input clkB,
                       input enB,
                       input wrB,
                       input [2:0]addB,
                       input [7:0]dinB,
                       output reg [7:0]doutB
                       );
      
      reg [7:0] data_mem_A [0:7];
      always @(posedge clkA) begin
        if (enA) begin
            if(wrA) begin
                data_mem_A[addA] = dinA;
            end
            else
                doutA = data_mem_A[addA];
        end
      end
      
      reg [7:0] data_mem_B [0:7];
      always @(posedge clkB) begin
        if (enB) begin
            if(wrB) begin
                data_mem_B[addB] = dinB;
            end
            else
                doutB = data_mem_B[addB];
        end
      end
      
      initial begin doutA = 8'b0; end
      initial begin doutB = 8'b0; end     
                
endmodule
