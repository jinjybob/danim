package com.team2.danim.comm;

import java.util.Date;

public class Comm_Video_reply {
	private int cvr_no;
	private int cvr_cv_no;
	private String cvr_owner;
	private String cvr_owner_id;
	private String cvr_txt;
	private Date cvr_when;
	
	public Comm_Video_reply() {
		// TODO Auto-generated constructor stub
	}

	public Comm_Video_reply(int cvr_no, int cvr_cv_no, String cvr_owner, String cvr_owner_id, String cvr_txt,
			Date cvr_when) {
		super();
		this.cvr_no = cvr_no;
		this.cvr_cv_no = cvr_cv_no;
		this.cvr_owner = cvr_owner;
		this.cvr_owner_id = cvr_owner_id;
		this.cvr_txt = cvr_txt;
		this.cvr_when = cvr_when;
	}

	public int getCvr_no() {
		return cvr_no;
	}

	public void setCvr_no(int cvr_no) {
		this.cvr_no = cvr_no;
	}

	public int getCvr_cv_no() {
		return cvr_cv_no;
	}

	public void setCvr_cv_no(int cvr_cv_no) {
		this.cvr_cv_no = cvr_cv_no;
	}

	public String getCvr_owner() {
		return cvr_owner;
	}

	public void setCvr_owner(String cvr_owner) {
		this.cvr_owner = cvr_owner;
	}

	public String getCvr_owner_id() {
		return cvr_owner_id;
	}

	public void setCvr_owner_id(String cvr_owner_id) {
		this.cvr_owner_id = cvr_owner_id;
	}

	public String getCvr_txt() {
		return cvr_txt;
	}

	public void setCvr_txt(String cvr_txt) {
		this.cvr_txt = cvr_txt;
	}

	public Date getCvr_when() {
		return cvr_when;
	}

	public void setCvr_when(Date cvr_when) {
		this.cvr_when = cvr_when;
	}
	
	
}
