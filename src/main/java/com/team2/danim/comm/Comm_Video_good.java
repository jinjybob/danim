package com.team2.danim.comm;

public class Comm_Video_good {
	private String cvg_id;
	private int cvg_good;
	private int cvg_no;
	
	public Comm_Video_good() {
		// TODO Auto-generated constructor stub
	}

	public Comm_Video_good(String cvg_id, int cvg_good, int cvg_no) {
		super();
		this.cvg_id = cvg_id;
		this.cvg_good = cvg_good;
		this.cvg_no = cvg_no;
	}

	public String getCvg_id() {
		return cvg_id;
	}

	public void setCvg_id(String cvg_id) {
		this.cvg_id = cvg_id;
	}

	public int getCvg_good() {
		return cvg_good;
	}

	public void setCvg_good(int cvg_good) {
		this.cvg_good = cvg_good;
	}

	public int getCvg_no() {
		return cvg_no;
	}

	public void setCvg_no(int cvg_no) {
		this.cvg_no = cvg_no;
	}
	
	
}
