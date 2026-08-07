class env extends uvm_env;
	`uvm_component_utils(env)
 
 agent agt_h;
 scoreboard sb_h;
subscriber sub_h;
 alu_config m_cfg;

 function new(string name="env",uvm_component parent);
	super.new(name,parent);
   endfunction

 function void build_phase(uvm_phase phase);
	super.build_phase(phase);

 if(!uvm_config_db#(alu_config)::get(this,"","alu_config",m_cfg))
	`uvm_fatal(get_type_name(),"Output_agt Getting Failed")

  agt_h=agent::type_id::create("agt_h",this);
  
  sb_h=scoreboard::type_id::create("sb_h",this);
sub_h=subscriber::type_id::create("sub_h",this);

 endfunction

 function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	agt_h.mon_h.inp_monitor_port.connect(sb_h.inp_mon_fifo.analysis_export);
agt_h.out_mon_h.out_monitor_port.connect(sb_h.out_mon_fifo.analysis_export);
agt_h.mon_h.inp_monitor_port.connect(sub_h.input_imp);
agt_h.out_mon_h.out_monitor_port.connect(sub_h.output_imp);

	 endfunction

endclass
  

	
  


