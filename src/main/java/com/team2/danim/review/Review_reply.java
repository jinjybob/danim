package com.team2.danim.review;

import java.util.Date;

public class Review_reply {
	
	private int rbr_no;
	private int rbr_rb_no;
	private String rbr_owner;
	private String rbr_txt;
	private Date rbr_when;

	public Review_reply() {
		// TODO Auto-generated constructor stub
	}

	public Review_reply(int rbr_no, int rbr_rb_no, String rbr_owner, String rbr_txt, Date rbr_when) {
		super();
		this.rbr_no = rbr_no;
		this.rbr_rb_no = rbr_rb_no;
		this.rbr_owner = rbr_owner;
		this.rbr_txt = rbr_txt;
		this.rbr_when = rbr_when;
	}

	public int getRbr_no() {
		return rbr_no;
	}

	public void setRbr_no(int rbr_no) {
		this.rbr_no = rbr_no;
	}

	public int getRbr_rb_no() {
		return rbr_rb_no;
	}

	public void setRbr_rb_no(int rbr_rb_no) {
		this.rbr_rb_no = rbr_rb_no;
	}

	public String getRbr_owner() {
		return rbr_owner;
	}

	public void setRbr_owner(String rbr_owner) {
		this.rbr_owner = rbr_owner;
	}

	public String getRbr_txt() {
		return rbr_txt;
	}

	public void setRbr_txt(String rbr_txt) {
		this.rbr_txt = rbr_txt;
	}

	public Date getRbr_when() {
		return rbr_when;
	}

	public void setRbr_when(Date rbr_when) {
		this.rbr_when = rbr_when;
	}

	

	
}
