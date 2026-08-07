class agent extends uvm_agent;
	`uvm_component_utils(agent)

  driver dr_h;
  input_monitor mon_h;
  output_monitor out_mon_h;
  sequencer seqr_h;
  alu_config m_cfg;

   function new(string name="agent",uvm_component parent);
	super.new(name,parent);
   endfunction

  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
    
  if(!uvm_config_db#(alu_config)::get(this,"","alu_config",m_cfg))
	`uvm_fatal(get_type_name(),"Agent Getting Failed");

    mon_h=input_monitor::type_id::create("mon_h",this);
out_mon_h=output_monitor::type_id::create("out_mon_h",this);


    if(m_cfg.is_active==UVM_ACTIVE)
    begin
    dr_h=driver::type_id::create("dr_h",this);
    seqr_h=sequencer::type_id::create("seqr_h",this);
    end

  endfunction

 function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
	if(m_cfg.is_active==UVM_ACTIVE)
	    begin
		dr_h.seq_item_port.connect(seqr_h.seq_item_export);
	    end
 endfunction

 endclass

