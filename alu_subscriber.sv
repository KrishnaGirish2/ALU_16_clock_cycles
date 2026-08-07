`uvm_analysis_imp_decl(_input)
`uvm_analysis_imp_decl(_output)
class subscriber extends uvm_component;

  `uvm_component_utils(subscriber) 
uvm_analysis_imp_input #(trans,subscriber) input_imp;
uvm_analysis_imp_output #(trans,subscriber) output_imp; 
  trans drv;   
  trans mon;    
covergroup input_cg;     
  opa:   coverpoint drv.OPA { bins opa_val={[0:255]}; }
 opb:   coverpoint drv.OPB { bins opb_val={[0:255]}; }
ce: coverpoint drv.CE{ bins ce_0={0}; bins ce_1={1};}
mode: coverpoint drv.MODE{bins mode_0={0}; bins mode_1={1};}
cin: coverpoint drv.CIN{bins cin_0={0}; bins cin_1={1};}
cmd: coverpoint drv.CMD{ bins cmd_val={[0:13]};}
inp_valid: coverpoint drv.INP_VALID{ bins inp_0={2'b00}; bins inp_1={1}; bins inp_2={2}; bins inp_3={3};}


inp_mode: cross inp_valid, mode;
inp_cmd: cross inp_valid, cmd;
cin_cmd: cross cin,cmd;
ce_cmd: cross ce, cmd;
mode_cmd: cross mode,cmd;
ce_mode: cross ce,mode;
cmd_inp: cross cmd, inp_valid;
endgroup
covergroup output_cg;
res: coverpoint mon.RES{ bins res_val={[0:1023]};}
cout: coverpoint mon.COUT{ bins cout_0={0}; bins cout_1={1};}
oflow: coverpoint mon.OFLOW{bins oflow_0={0}; bins oflow_1={1};}
g: coverpoint mon.G{ bins G_val={[0:1]};}
e: coverpoint mon.E{bins E_val={[0:1]};}
l: coverpoint mon.L{bins L_val[]={[0:1]};}
err: coverpoint mon.ERR{bins err_val[]={[0:1]};}
endgroup
/*covergroup alu_cg;
mode1: coverpoint drv.MODE;
cmd1: coverpoint drv.CMD;
err1: coverpoint mon.ERR;
err_mode: cross mode1, err1;
err_cmd: cross cmd1, mode1;
*/

 
  function new(string name = "subscriber", uvm_component parent = null);
    super.new(name,parent);
input_imp=new("input_imp",this);
output_imp=new("output_imp",this);
    input_cg = new();
    output_cg = new();
//	alu_cg=new();
  endfunction
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  
  endfunction
 
  virtual function void write_input(trans t);     
    drv = t;
   	input_cg.sample();
    `uvm_info(get_name,"[DRIVER]:INPUT RECIEVED",UVM_HIGH)
  endfunction


 virtual function void write_output(trans t);
mon=t;
output_cg.sample();
//alu_cg.sample();
endfunction
   
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info(get_name,$sformatf("INPUT COVERAGE = %0f\n OUTPUT COVERAGE = %0f",input_cg.get_coverage(),output_cg.get_coverage()),UVM_NONE);
  endfunction
 
endclass
