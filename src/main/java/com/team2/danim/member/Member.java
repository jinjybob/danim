package com.team2.danim.member;

public class Member {
	private String dm_id;
	private String dm_pw;
	private String dm_nickname;
	private String dm_email;
	private String dm_addr;
	private String dm_photo;
	private String dm_isAdmin;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String dm_id, String dm_pw, String dm_nickname, String dm_email, String dm_addr, String dm_photo,
			String dm_isAdmin) {
		super();
		this.dm_id = dm_id;
		this.dm_pw = dm_pw;
		this.dm_nickname = dm_nickname;
		this.dm_email = dm_email;
		this.dm_addr = dm_addr;
		this.dm_photo = dm_photo;
		this.dm_isAdmin = dm_isAdmin;
	}

	public String getDm_id() {
		return dm_id;
	}

	public void setDm_id(String dm_id) {
		this.dm_id = dm_id;
	}

	public String getDm_pw() {
		return dm_pw;
	}

	public void setDm_pw(String dm_pw) {
		this.dm_pw = dm_pw;
	}

	public String getDm_nickname() {
		return dm_nickname;
	}

	public void setDm_nickname(String dm_nickname) {
		this.dm_nickname = dm_nickname;
	}

	public String getDm_email() {
		return dm_email;
	}

	public void setDm_email(String dm_email) {
		this.dm_email = dm_email;
	}

	public String getDm_addr() {
		return dm_addr;
	}

	public void setDm_addr(String dm_addr) {
		this.dm_addr = dm_addr;
	}

	public String getDm_photo() {
		return dm_photo;
	}

	public void setDm_photo(String dm_photo) {
		this.dm_photo = dm_photo;
	}

	public String getDm_isAdmin() {
		return dm_isAdmin;
	}

	public void setDm_isAdmin(String dm_isAdmin) {
		this.dm_isAdmin = dm_isAdmin;
	}
	
	

	
}
