package com.team2.danim.comm;

import java.util.Date;

public class Comm_import {
	private int ci_no;
	private String ci_file_name;
	private String ci_write_name;
	private String ci_writer;
	private String ci_txt;
	private int ci_view;
	private Date ci_date;
	
	public Comm_import() {
		// TODO Auto-generated constructor stub
	}

	public Comm_import(int ci_no, String ci_file_name, String ci_write_name, String ci_writer, String ci_txt,
			int ci_view, Date ci_date) {
		super();
		this.ci_no = ci_no;
		this.ci_file_name = ci_file_name;
		this.ci_write_name = ci_write_name;
		this.ci_writer = ci_writer;
		this.ci_txt = ci_txt;
		this.ci_view = ci_view;
		this.ci_date = ci_date;
	}

	public int getCi_no() {
		return ci_no;
	}

	public void setCi_no(int ci_no) {
		this.ci_no = ci_no;
	}

	public String getCi_file_name() {
		return ci_file_name;
	}

	public void setCi_file_name(String ci_file_name) {
		this.ci_file_name = ci_file_name;
	}

	public String getCi_write_name() {
		return ci_write_name;
	}

	public void setCi_write_name(String ci_write_name) {
		this.ci_write_name = ci_write_name;
	}

	public String getCi_writer() {
		return ci_writer;
	}

	public void setCi_writer(String ci_writer) {
		this.ci_writer = ci_writer;
	}

	public String getCi_txt() {
		return ci_txt;
	}

	public void setCi_txt(String ci_txt) {
		this.ci_txt = ci_txt;
	}

	public int getCi_view() {
		return ci_view;
	}

	public void setCi_view(int ci_view) {
		this.ci_view = ci_view;
	}

	public Date getCi_date() {
		return ci_date;
	}

	public void setCi_date(Date ci_date) {
		this.ci_date = ci_date;
	}
	
	
}
