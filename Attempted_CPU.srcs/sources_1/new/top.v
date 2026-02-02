`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2026 07:52:10 PM
// Design Name: 
// Module Name: top
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


module top(instruction,clk);
input wire clk;
input wire[31:0] instruction;

reg [6:0] opcode;
reg [2:0] funct3;
reg [6:0] funct7;
reg flagnofunct3;
reg flagnofunct7;

assign opcodes={add,sub,exclxor,nonrmor,normand,shifts,slt,sltu,addi,xori,ori,andi,shiftsi,slti,sltui,load,store,branch,jumpandlink,jumpandlinkreg,adduppimmtopc,loadupperimmediate,environment};
assign funct3opcodes={add,sub,exclxor,nonrmor,normand,shifts,slt,sltu,addi,xori,ori,andi,shiftsi,slti,sltui,load,store,branch,jumpandlinkreg,environment};
assign funct7opcodes={add,sub,exclxor,nonrmor,normand,shifts,slt,sltu,shiftsi,environment};

assign {add,sub,exclxor,nonrmor,normand,shifts,slt,sltu}=7'b0110011;
assign {addi,xori,ori,andi,shiftsi,slti,sltui}=7'b0010011;
assign load=7'b0000011;
assign store=7'b0100011;
assign branch=7'b1100011;
assign jumpandlink=7'b1101111;
assign jumpandlinkreg=7'b1100111;
assign loadupperimmediate=7'b0110111;
assign adduppimmtopc=7'b0010111;
assign environment=7'b1110011;
assign {funct3add,funct3sub,funct3addi,funct3loadbyte,funct3storebyte,funct3branchequal,funct3jumpandlinkreg,funct3envcall,funct3envbreak}=3'b000;
assign {funct3shiftleftlogical,funct3shiftleftlogicalimm,funct3loadhalf,funct3storehalf,funct3branchnotequal}=3'b001;
assign {funct3slt,funct3slti,funct3loadword,funct3storeword}=3'b010;
assign {funct3sltu,funct3sltui}=3'b011;
assign {funct3exclxor,funct3xori,funct3loadbyte,funct3branchlessthan}=3'b100;
assign {funct3shiftrightlogical,funct3shiftrightarith,funct3shiftrightlogicalimm,funct3shiftrightarithimm,funct3loadhalf,funct3banchgreaterthanorequal}=3'b101;

always@(clk)
begin
assign opcode=instruction[6:0];
if((opcode==jumpandlink|opcode==adduppimmtopc|opcode==loadupperimmediate))
    begin
        assign flagnofunct3=1;
    end 
else 
    begin
        assign flagnofunct3=0;
        assign funct3=instruction[14:12];
        if(opcode==add|opcode==sub|opcode==exclxor|opcode==nonrmor|opcode==normand|opcode==shifts|opcode==slt|opcode==sltu|opcode==shiftsi|opcode==environment)
        begin
            assign flagnofunct7=0;
            case(opcode)
            7'b0110011:
                assign funct7=instruction[31:25];
                //check instruction to run
                //all r32m instructions are also here
            7'b0010011:
                if((funct3==1)&&(instruction[31:25]==0))
                begin
                    //store in mem address(instruction[11:7])=load from mem address instruction[19:15]<<instruction[20:24]
                    //shift left logical imm
                end
                else if((funct3==5)&&(instruction[31:25]==0)) begin
                    //store in mem address(instruction[11:7])=load from mem address instruction[19:15]>>instruction[20:24]
                    //shift right logical imm
                end
                else if((funct3==5)&&(instruction[31:25]=='h20)) begin
                    //store in mem address(instruction[11:7])=load from mem address instruction[19:15]<<instruction[20:24] while extending msb
                    //shift right arith imm
                end
            7'b1101111:
            //jump and link
            7'b0110111:
            //load upper immediate
            7'b0010111:
            //add upper immediate to process counter
            
            //float extension stuff below
            7'b1001011:
            7'b1010011:
            7'b1000011:
            7'b0000111:
            7'b0100111:
            7'b1001111:
            7'b1000111:
            endcase
            
        end
        else
        begin
            assign flagnofunct7=1;
        end
    end
end
endmodule
