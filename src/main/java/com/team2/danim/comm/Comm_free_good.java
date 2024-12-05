package com.team2.danim.comm;

public class Comm_free_good {
	private String cfg_id;
	private int cfg_good;
	private int cfg_no;
	
	public Comm_free_good() {
		// TODO Auto-generated constructor stub
	}

	public Comm_free_good(String cfg_id, int cfg_good, int cfg_no) {
		super();
		this.cfg_id = cfg_id;
		this.cfg_good = cfg_good;
		this.cfg_no = cfg_no;
	}

	public String getCfg_id() {
		return cfg_id;
	}

	public void setCfg_id(String cfg_id) {
		this.cfg_id = cfg_id;
	}

	public int getCfg_good() {
		return cfg_good;
	}

	public void setCfg_good(int cfg_good) {
		this.cfg_good = cfg_good;
	}

	public int getCfg_no() {
		return cfg_no;
	}

	public void setCfg_no(int cfg_no) {
		this.cfg_no = cfg_no;
	}
}
