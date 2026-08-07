class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)
uvm_tlm_analysis_fifo#(trans) inp_mon_fifo;
uvm_tlm_analysis_fifo#(trans) out_mon_fifo;
trans inp_mon;
trans out_mon;

bit [7:0] oprd1, oprd2;
bit op1_valid, op2_valid;
bit [3:0] cmd_reg;
bit mode_reg;
bit ce_reg, cin_reg;
bit [3:0] prev_cmd;
bit prev_mode;
bit [4:0]wait_count;
bit mul_pend;
bit [1:0]mul_count;
bit [9:0]mul_res;
bit [9:0]exp_res;
logic exp_err, exp_cout, exp_oflow, exp_g, exp_e, exp_l;
int total_tests;
int passed_tests;
int failed_tests;

function new(string name="scoreboard",uvm_component parent);
super.new(name,parent);
inp_mon_fifo=new("inp_mon_fifo",this);
out_mon_fifo=new("out_mon_fifo",this);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
inp_mon=trans::type_id::create("inp_mon_xn");
out_mon=trans::type_id::create("inp_mon_xn");
total_tests=0;
passed_tests=0;
failed_tests=0;
endfunction

task reset_ref_model();

oprd1=0;
oprd2=0;
op1_valid=0;
op2_valid=0;
cmd_reg=0;
mode_reg=0;
prev_cmd=0;
prev_mode=0;
wait_count=0;
mul_pend=0;
mul_count=0;
mul_res=0;
exp_res=0;
exp_err=0;
exp_cout=0;
exp_oflow=0;
exp_g=0;
exp_e=0;
exp_l=0;
endtask

task run_phase(uvm_phase phase);
reset_ref_model();
forever begin
inp_mon_fifo.get(inp_mon);
out_mon_fifo.get(out_mon);
ref_model(inp_mon);
compare_output();
end
endtask

function bit two_op_operation();
if(mode_reg) begin
case(cmd_reg)
4'd4, 4'd5: return 0;
4'd6, 4'd7: return 0;
default: return 1;
endcase
end
else begin
case(cmd_reg) 
4'd6,4'd7, 4'd8, 4'd9, 4'd10, 4'd11: return 0;
default: return 1;
endcase
end
endfunction

virtual task ref_model(trans t);
if(t.RST) begin
reset_ref_model();
return;
end

ce_reg=t.CE;
cin_reg=t.CIN;
cmd_reg=t.CMD;
mode_reg=t.MODE;

if(!t.CE) return;
if((t.CMD!=prev_cmd) || (t.MODE !=prev_mode)) begin
wait_count=0;
op1_valid=0;
op2_valid=0;
mul_pend=0;
mul_count=0;
prev_cmd=t.CMD;
prev_mode=t.MODE;
exp_err=0;
exp_res=0;
exp_cout=0;
exp_oflow=0;
exp_g=0;
exp_l=0;
exp_l=0;


end
`uvm_info("SB",$sformatf("exp_err=%0d out_err=%0d cmd=%0d wait=%0d op1=%0d op2=%0d",exp_err,out_mon.ERR,cmd_reg,wait_count,op1_valid,op2_valid),UVM_LOW); 
case(t.INP_VALID)
2'b01: begin
oprd1=t.OPA;
op1_valid=1;
end
2'b10: begin
oprd2=t.OPB;
op2_valid=1;
end
2'b11: begin
oprd1=t.OPA;
oprd2=t.OPB;
op1_valid=1;
op2_valid=1;
end
endcase

if(two_op_operation()) begin
	if(op1_valid && !op2_valid) begin
		if(wait_count<16) wait_count++;
		else exp_err=1;
	end
	else if(op2_valid && !op1_valid) begin
		if(wait_count <16) wait_count++;
		else exp_err=1;
	end
	else if(!(op1_valid && op2_valid)) return;

end
	
else begin
if(mode_reg) begin
case(cmd_reg) 
4'd4, 4'd5: if(!op1_valid) return;
4'd6, 4'd7: if(!op2_valid) return;
endcase
end
else begin
case(cmd_reg) 
4'd6,4'd8,4'd9: begin
if(!op1_valid) return;
end
4'd7,4'd10,4'd11: begin
if(!op2_valid) return;
end
endcase
end
end



exp_res=exp_res;
exp_cout=0;
exp_oflow=0;
exp_g=0;
exp_e=0;
exp_l=0;
if(mode_reg) begin
case(cmd_reg)
4'b0000: begin
{exp_cout,exp_res}=oprd1+oprd2;
end
4'b0001: begin
exp_res=oprd1-oprd2;
if(oprd1<oprd2) exp_oflow=1;
end
4'b0010: begin
{exp_cout,exp_res}=oprd1+oprd2+t.CIN;
end

4'b0011: begin
exp_res=oprd1-oprd2-t.CIN;
if(oprd1<oprd2)
exp_oflow=1;
end
4'b0100: begin
exp_res=oprd1+1;
end
4'b0101: begin
exp_res=oprd1-1;
end
4'b0110: begin
exp_res=oprd2+1;
end
4'b0111: begin
exp_res=oprd2-1;
end

4'b1000: begin
if(oprd1>oprd2) begin
exp_g=1;
exp_e=0;
exp_l=0;
end
else if(oprd1<oprd2) begin
exp_g=0;
exp_e=0;
exp_l=1;
end
else begin
exp_g=0;
exp_e=1;
exp_l=0;
end
end

4'b1001: begin
if(!mul_pend) begin
mul_pend=1;
mul_count=0;
mul_res=(oprd1+1) * (oprd2+1);
end
else begin
mul_count++;
if(mul_count==2) begin
exp_res=mul_res;
mul_pend=0;
mul_count=0;
end
end
end

4'b1010: begin
if(!mul_pend) begin
mul_pend=1;
mul_count=0;
mul_res=(oprd1<<1) * oprd2;
end
else begin
mul_count++;
if(mul_count==2) begin
exp_res=mul_res;
mul_pend=0;
mul_count=0;
end
end
end

endcase
end

else begin
case(cmd_reg)
4'b000: begin
exp_res={2'b0,oprd1 & oprd2};
end
4'b0001: begin
exp_res={2'b0,~(oprd1&oprd2)};
end
4'b0010: begin
exp_res={2'b0,oprd1|oprd2};
end
4'b0011: begin
exp_res={2'b0,~(oprd1|oprd2)};
end
4'b0100: begin
exp_res={2'b0,oprd1^oprd2};
end
4'b0101: begin
exp_res={2'b0,~(oprd1^oprd2)};
end
4'b0110: begin
exp_res={2'b0,~oprd1};
end
4'b0111: begin
exp_res={2'b0,~oprd2};
end
4'b1000: begin
exp_res={2'b0,oprd1>>1};
end
4'b1001: begin
exp_res={2'b0,oprd1<<1};
end
4'b1010: begin
exp_res={2'b0,oprd2>>1};
end
4'b1011: begin
exp_res={2'b0,oprd2<<1};
end
4'b1100:begin
exp_res={2'b0,(oprd1<<oprd2[2:0])| (oprd1>>(8- oprd2[2:0]))};
if(oprd2[7:4]!=0) exp_err=1;
end
4'b1101:begin
exp_res={2'b0,(oprd1>>oprd2[2:0])| (oprd1<<(8- oprd2[2:0]))};
if(oprd2[7:4]!=0) exp_err=1;
end

default: begin
exp_res=0;
end
endcase
end

endtask

task compare_output();
//if(exp_err!=out_mon.ERR) 
//`uvm_error("COMPARE",$sformatf("ERR mismatch EXP=%0b ACT=%0b",exp_err, out_mon.ERR));

bit test_fail=0;
if(!ce_reg) return;
if(mode_reg) begin

case(cmd_reg) 
4'b0000: begin
if(exp_res!=out_mon.RES) begin
 `uvm_error("Add","RES mismatch");
test_fail=1;
end
if(exp_cout!==out_mon.COUT)begin
 `uvm_error("Add","Cout mismatch");
test_fail=1;
end

end

4'b0001: begin
if(exp_res!=out_mon.RES) begin
 `uvm_error("Sub","RES mismatch");
test_fail=1;
end

if(exp_oflow!==out_mon.OFLOW) begin
 `uvm_error("Sub","OFLOW mismatch");
test_fail=1;
end

end

4'b0010: begin
if(exp_res!=out_mon.RES)begin
 `uvm_error("Add_cin","RES mismatch");
test_fail=1;
end

if(exp_cout!==out_mon.COUT) begin
 `uvm_error("Add_cin","Cout mismatch");
test_fail=1;
end

end

4'b0011: begin
if(exp_res!=out_mon.RES) begin
test_fail=1;
 `uvm_error("Sub_cin","RES mismatch");
end

if(exp_oflow!==out_mon.OFLOW) begin
 `uvm_error("Sub_cin","OFLOW mismatch");
test_fail=1;
end
end

4'b0100, 4'b0101, 4'b0110, 4'b0111, 4'b1001, 4'b1010: begin
if(exp_res!=out_mon.RES) begin
 `uvm_error("ARITHMETIC","RES mismatch");
test_fail=1;
end
end

4'b1000: begin
if(exp_g!=out_mon.G) begin
 `uvm_error("Compare","G mismatch");
test_fail=1;
end

if(exp_l!=out_mon.L) begin
 `uvm_error("Compare","L mismatch");
test_fail=1;
end

if(exp_e!=out_mon.E) begin
 `uvm_error("Compare","E mismatch");
test_fail=1;
end

end

endcase
end
else begin
case(cmd_reg)
4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111, 4'b1000, 4'b1001, 4'b1010, 4'b1011: begin
if(exp_res!=out_mon.RES) begin
 `uvm_error("Logical","RES mismatch");
test_fail=1;
end

end

4'b1100, 4'b1101: begin
if(exp_res!=out_mon.RES) begin
 `uvm_error("Rotate","RES mismatch");
test_fail=1;
end
if(exp_err!=out_mon.ERR) begin
 `uvm_error("Rotate","ERR mismatch");
test_fail=1;
end

end
endcase
end
 total_tests++;

   if(test_fail)
      failed_tests++;
   else
      passed_tests++;
endtask

function void report_phase(uvm_phase phase);
   super.report_phase(phase);

   `uvm_info("SCOREBOARD",$sformatf("\nTOTAL TESTS  : %0d\nPASSED TESTS : %0d\nFAILED TESTS : %0d\n",total_tests,passed_tests,failed_tests,),UVM_NONE)

endfunction
endclass





