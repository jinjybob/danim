package com.team2.danim.comm;

public class Comm_Picture_good {

	private String cpg_id;
	private int cpg_good;
	private int cpg_no;
	public Comm_Picture_good(String cpg_id, int cpg_good, int cpg_no) {
		super();
		this.cpg_id = cpg_id;
		this.cpg_good = cpg_good;
		this.cpg_no = cpg_no;
	}
	
	public Comm_Picture_good() {
		// TODO Auto-generated constructor stub
	}

	public String getCpg_id() {
		return cpg_id;
	}

	public void setCpg_id(String cpg_id) {
		this.cpg_id = cpg_id;
	}

	public int getCpg_good() {
		return cpg_good;
	}

	public void setCpg_good(int cpg_good) {
		this.cpg_good = cpg_good;
	}

	public int getCpg_no() {
		return cpg_no;
	}

	public void setCpg_no(int cpg_no) {
		this.cpg_no = cpg_no;
	}
	
	
}
