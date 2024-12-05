package com.team2.danim.comm;

import java.util.Date;

public class Comm_free_reply {
	private int cfr_no;
	private int cfr_cf_no;
	private String cfr_owner;
	private String cfr_owner_id;
	private String cfr_txt;
	private Date cfr_when;
	
	public Comm_free_reply() {
		// TODO Auto-generated constructor stub
	}

	public Comm_free_reply(int cfr_no, int cfr_cf_no, String cfr_owner, String cfr_owner_id, String cfr_txt,
			Date cfr_when) {
		super();
		this.cfr_no = cfr_no;
		this.cfr_cf_no = cfr_cf_no;
		this.cfr_owner = cfr_owner;
		this.cfr_owner_id = cfr_owner_id;
		this.cfr_txt = cfr_txt;
		this.cfr_when = cfr_when;
	}

	public int getCfr_no() {
		return cfr_no;
	}

	public void setCfr_no(int cfr_no) {
		this.cfr_no = cfr_no;
	}

	public int getCfr_cf_no() {
		return cfr_cf_no;
	}

	public void setCfr_cf_no(int cfr_cf_no) {
		this.cfr_cf_no = cfr_cf_no;
	}

	public String getCfr_owner() {
		return cfr_owner;
	}

	public void setCfr_owner(String cfr_owner) {
		this.cfr_owner = cfr_owner;
	}

	public String getCfr_owner_id() {
		return cfr_owner_id;
	}

	public void setCfr_owner_id(String cfr_owner_id) {
		this.cfr_owner_id = cfr_owner_id;
	}

	public String getCfr_txt() {
		return cfr_txt;
	}

	public void setCfr_txt(String cfr_txt) {
		this.cfr_txt = cfr_txt;
	}

	public Date getCfr_when() {
		return cfr_when;
	}

	public void setCfr_when(Date cfr_when) {
		this.cfr_when = cfr_when;
	}
	
	
	
	
	
}
