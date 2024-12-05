package com.team2.danim.comm;

import java.util.Date;

public class Comm_picture_reply {
	
	private int cpr_no;
	private int cpr_cp_no;
	private String cpr_owner;
	private String cpr_owner_id;
	private String cpr_txt;
	private Date cpr_when;

	public Comm_picture_reply() {
		// TODO Auto-generated constructor stub
	}

	public Comm_picture_reply(int cpr_no, int cpr_cp_no, String cpr_owner, String cpr_owner_id, String cpr_txt,
			Date cpr_when) {
		super();
		this.cpr_no = cpr_no;
		this.cpr_cp_no = cpr_cp_no;
		this.cpr_owner = cpr_owner;
		this.cpr_owner_id = cpr_owner_id;
		this.cpr_txt = cpr_txt;
		this.cpr_when = cpr_when;
	}

	public int getCpr_no() {
		return cpr_no;
	}

	public void setCpr_no(int cpr_no) {
		this.cpr_no = cpr_no;
	}

	public int getCpr_cp_no() {
		return cpr_cp_no;
	}

	public void setCpr_cp_no(int cpr_cp_no) {
		this.cpr_cp_no = cpr_cp_no;
	}

	public String getCpr_owner() {
		return cpr_owner;
	}

	public void setCpr_owner(String cpr_owner) {
		this.cpr_owner = cpr_owner;
	}

	public String getCpr_owner_id() {
		return cpr_owner_id;
	}

	public void setCpr_owner_id(String cpr_owner_id) {
		this.cpr_owner_id = cpr_owner_id;
	}

	public String getCpr_txt() {
		return cpr_txt;
	}

	public void setCpr_txt(String cpr_txt) {
		this.cpr_txt = cpr_txt;
	}

	public Date getCpr_when() {
		return cpr_when;
	}

	public void setCpr_when(Date cpr_when) {
		this.cpr_when = cpr_when;
	}

	
}
