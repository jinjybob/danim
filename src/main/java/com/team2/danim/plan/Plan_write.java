package com.team2.danim.plan;

import java.util.Date;
import java.util.List;

public class Plan_write {

	private int p_no;
	private String p_writer;
	private String p_title;
	private String p_titleFile;
	private int p_days;
	private Date p_startDate;
	private int p_person;
	private String p_place;
	private String p_plan;
	private String p_budget;
	private String p_freeWrite;
	private String p_setTitle;
	private String p_setItem;
	private String p_setPrice;
	private Date p_writedate;

	public Plan_write() {
		// TODO Auto-generated constructor stub
	}

	public Plan_write(int p_no, String p_writer, String p_title, String p_titleFile, int p_days, Date p_startDate,
			int p_person, String p_place, String p_plan, String p_budget, String p_freeWrite, String p_setTitle,
			String p_setItem, String p_setPrice, Date p_writedate) {
		super();
		this.p_no = p_no;
		this.p_writer = p_writer;
		this.p_title = p_title;
		this.p_titleFile = p_titleFile;
		this.p_days = p_days;
		this.p_startDate = p_startDate;
		this.p_person = p_person;
		this.p_place = p_place;
		this.p_plan = p_plan;
		this.p_budget = p_budget;
		this.p_freeWrite = p_freeWrite;
		this.p_setTitle = p_setTitle;
		this.p_setItem = p_setItem;
		this.p_setPrice = p_setPrice;
		this.p_writedate = p_writedate;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_writer() {
		return p_writer;
	}

	public void setP_writer(String p_writer) {
		this.p_writer = p_writer;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getP_titleFile() {
		return p_titleFile;
	}

	public void setP_titleFile(String p_titleFile) {
		this.p_titleFile = p_titleFile;
	}

	public int getP_days() {
		return p_days;
	}

	public void setP_days(int p_days) {
		this.p_days = p_days;
	}

	public Date getP_startDate() {
		return p_startDate;
	}

	public void setP_startDate(Date p_startDate) {
		this.p_startDate = p_startDate;
	}

	public int getP_person() {
		return p_person;
	}

	public void setP_person(int p_person) {
		this.p_person = p_person;
	}

	public String getP_place() {
		return p_place;
	}

	public void setP_place(String p_place) {
		this.p_place = p_place;
	}

	public String getP_plan() {
		return p_plan;
	}

	public void setP_plan(String p_plan) {
		this.p_plan = p_plan;
	}

	public String getP_budget() {
		return p_budget;
	}

	public void setP_budget(String p_budget) {
		this.p_budget = p_budget;
	}

	public String getP_freeWrite() {
		return p_freeWrite;
	}

	public void setP_freeWrite(String p_freeWrite) {
		this.p_freeWrite = p_freeWrite;
	}

	public String getP_setTitle() {
		return p_setTitle;
	}

	public void setP_setTitle(String p_setTitle) {
		this.p_setTitle = p_setTitle;
	}

	public String getP_setItem() {
		return p_setItem;
	}

	public void setP_setItem(String p_setItem) {
		this.p_setItem = p_setItem;
	}

	public String getP_setPrice() {
		return p_setPrice;
	}

	public void setP_setPrice(String p_setPrice) {
		this.p_setPrice = p_setPrice;
	}

	public Date getP_writedate() {
		return p_writedate;
	}

	public void setP_writedate(Date p_writedate) {
		this.p_writedate = p_writedate;
	}

	
}
