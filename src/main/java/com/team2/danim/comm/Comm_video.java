package com.team2.danim.comm;

import java.util.Date;

public class Comm_video {
	
	private int cv_no;
	private String cv_name;
	private String cv_write_name;
	private String cv_writer;
	private int cv_good;
	private String cv_txt;
	private int cv_view;
	private Date cv_date;
	
	public Comm_video() {
		// TODO Auto-generated constructor stub
	}

	public Comm_video(int cv_no, String cv_name, String cv_write_name, String cv_writer, int cv_good, String cv_txt,
			int cv_view, Date cv_date) {
		super();
		this.cv_no = cv_no;
		this.cv_name = cv_name;
		this.cv_write_name = cv_write_name;
		this.cv_writer = cv_writer;
		this.cv_good = cv_good;
		this.cv_txt = cv_txt;
		this.cv_view = cv_view;
		this.cv_date = cv_date;
	}

	public int getCv_no() {
		return cv_no;
	}

	public void setCv_no(int cv_no) {
		this.cv_no = cv_no;
	}

	public String getCv_name() {
		return cv_name;
	}

	public void setCv_name(String cv_name) {
		this.cv_name = cv_name;
	}

	public String getCv_write_name() {
		return cv_write_name;
	}

	public void setCv_write_name(String cv_write_name) {
		this.cv_write_name = cv_write_name;
	}

	public String getCv_writer() {
		return cv_writer;
	}

	public void setCv_writer(String cv_writer) {
		this.cv_writer = cv_writer;
	}

	public int getCv_good() {
		return cv_good;
	}

	public void setCv_good(int cv_good) {
		this.cv_good = cv_good;
	}

	public String getCv_txt() {
		return cv_txt;
	}

	public void setCv_txt(String cv_txt) {
		this.cv_txt = cv_txt;
	}

	public int getCv_view() {
		return cv_view;
	}

	public void setCv_view(int cv_view) {
		this.cv_view = cv_view;
	}

	public Date getCv_date() {
		return cv_date;
	}

	public void setCv_date(Date cv_date) {
		this.cv_date = cv_date;
	}

	
	
}
