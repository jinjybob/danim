package com.team2.danim.comm;

import java.util.Date;

public class Comm_free {
	private int cf_no;
	private String cf_file_name;
	private String cf_write_name;
	private String cf_writer;
	private String cf_txt;
	private int cf_good;
	private int cf_view;
	private Date cf_date;
	
	public Comm_free() {
		// TODO Auto-generated constructor stub
	}

	public Comm_free(int cf_no, String cf_file_name, String cf_write_name, String cf_writer, String cf_txt, int cf_good,
			int cf_view, Date cf_date) {
		super();
		this.cf_no = cf_no;
		this.cf_file_name = cf_file_name;
		this.cf_write_name = cf_write_name;
		this.cf_writer = cf_writer;
		this.cf_txt = cf_txt;
		this.cf_good = cf_good;
		this.cf_view = cf_view;
		this.cf_date = cf_date;
	}

	public int getCf_no() {
		return cf_no;
	}

	public void setCf_no(int cf_no) {
		this.cf_no = cf_no;
	}

	public String getCf_file_name() {
		return cf_file_name;
	}

	public void setCf_file_name(String cf_file_name) {
		this.cf_file_name = cf_file_name;
	}

	public String getCf_write_name() {
		return cf_write_name;
	}

	public void setCf_write_name(String cf_write_name) {
		this.cf_write_name = cf_write_name;
	}

	public String getCf_writer() {
		return cf_writer;
	}

	public void setCf_writer(String cf_writer) {
		this.cf_writer = cf_writer;
	}

	public String getCf_txt() {
		return cf_txt;
	}

	public void setCf_txt(String cf_txt) {
		this.cf_txt = cf_txt;
	}

	public int getCf_good() {
		return cf_good;
	}

	public void setCf_good(int cf_good) {
		this.cf_good = cf_good;
	}

	public int getCf_view() {
		return cf_view;
	}

	public void setCf_view(int cf_view) {
		this.cf_view = cf_view;
	}

	public Date getCf_date() {
		return cf_date;
	}

	public void setCf_date(Date cf_date) {
		this.cf_date = cf_date;
	}

	
	
}
