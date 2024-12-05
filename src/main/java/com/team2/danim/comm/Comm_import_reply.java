package com.team2.danim.comm;

import java.util.Date;

public class Comm_import_reply {
	private int cir_no;
	private int cir_ci_no;
	private String cir_owner;
	private String cir_owner_id;
	private String cir_txt;
	private Date cir_when;
	
	public Comm_import_reply() {
		// TODO Auto-generated constructor stub
	}

	public Comm_import_reply(int cir_no, int cir_ci_no, String cir_owner, String cir_owner_id, String cir_txt,
			Date cir_when) {
		super();
		this.cir_no = cir_no;
		this.cir_ci_no = cir_ci_no;
		this.cir_owner = cir_owner;
		this.cir_owner_id = cir_owner_id;
		this.cir_txt = cir_txt;
		this.cir_when = cir_when;
	}

	public int getCir_no() {
		return cir_no;
	}

	public void setCir_no(int cir_no) {
		this.cir_no = cir_no;
	}

	public int getCir_ci_no() {
		return cir_ci_no;
	}

	public void setCir_ci_no(int cir_ci_no) {
		this.cir_ci_no = cir_ci_no;
	}

	public String getCir_owner() {
		return cir_owner;
	}

	public void setCir_owner(String cir_owner) {
		this.cir_owner = cir_owner;
	}

	public String getCir_owner_id() {
		return cir_owner_id;
	}

	public void setCir_owner_id(String cir_owner_id) {
		this.cir_owner_id = cir_owner_id;
	}

	public String getCir_txt() {
		return cir_txt;
	}

	public void setCir_txt(String cir_txt) {
		this.cir_txt = cir_txt;
	}

	public Date getCir_when() {
		return cir_when;
	}

	public void setCir_when(Date cir_when) {
		this.cir_when = cir_when;
	}
	
	
}
