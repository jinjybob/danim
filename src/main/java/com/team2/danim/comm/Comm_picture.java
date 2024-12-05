package com.team2.danim.comm;

import java.util.Date;

public class Comm_picture {
	private int comm_picture_no;
	private String comm_picture_name;
	private String comm_picture_write_name;
	private String comm_picture_writer;
	private String comm_picture_txt;
	private int comm_picture_good;
	private int comm_picture_view;
	private Date comm_picture_date;
	public Comm_picture() {
		// TODO Auto-generated constructor stub
	}

	public Comm_picture(int comm_picture_no, String comm_picture_name, String comm_picture_write_name,

			String comm_picture_writer, String comm_picture_txt, int comm_picture_good, int comm_picture_view,
			Date comm_picture_date) {

		super();
		this.comm_picture_no = comm_picture_no;
		this.comm_picture_name = comm_picture_name;
		this.comm_picture_write_name = comm_picture_write_name;
		this.comm_picture_writer = comm_picture_writer;

		this.comm_picture_txt = comm_picture_txt;
		this.comm_picture_good = comm_picture_good;
		this.comm_picture_view = comm_picture_view;
		this.comm_picture_date = comm_picture_date;
	}

	public int getComm_picture_no() {
		return comm_picture_no;
	}

	public void setComm_picture_no(int comm_picture_no) {
		this.comm_picture_no = comm_picture_no;
	}

	public String getComm_picture_name() {
		return comm_picture_name;
	}

	public void setComm_picture_name(String comm_picture_name) {
		this.comm_picture_name = comm_picture_name;
	}

	public String getComm_picture_write_name() {
		return comm_picture_write_name;
	}

	public void setComm_picture_write_name(String comm_picture_write_name) {
		this.comm_picture_write_name = comm_picture_write_name;
	}

	public String getComm_picture_writer() {
		return comm_picture_writer;
	}

	public void setComm_picture_writer(String comm_picture_writer) {
		this.comm_picture_writer = comm_picture_writer;
	}


	public String getComm_picture_txt() {
		return comm_picture_txt;
	}

	public void setComm_picture_txt(String comm_picture_txt) {
		this.comm_picture_txt = comm_picture_txt;
	}

	public int getComm_picture_good() {
		return comm_picture_good;
	}

	public void setComm_picture_good(int comm_picture_good) {
		this.comm_picture_good = comm_picture_good;
	}

	public int getComm_picture_view() {
		return comm_picture_view;
	}

	public void setComm_picture_view(int comm_picture_view) {
		this.comm_picture_view = comm_picture_view;
	}

	public Date getComm_picture_date() {
		return comm_picture_date;
	}

	public void setComm_picture_date(Date comm_picture_date) {
		this.comm_picture_date = comm_picture_date;
	}

	
	
	
}
