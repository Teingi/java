package com.codecore.entity;

import java.util.Date;

public class Collect {
	private Integer co_id;
	private Integer b_id;
	private String co_content;
	private String co_img;	
	private Date co_time;
	private int u_id; 
	private Date co_date;
	public String getCo_img() {
		return co_img;
	}
	public void setCo_img(String co_img) {
		this.co_img = co_img;
	}
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public String getCo_content() {
		return co_content;
	}
	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}
	public Date getCo_time() {
		return co_time;
	}
	public void setCo_time(Date co_time) {
		this.co_time = co_time;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public Integer getCo_id() {
		return co_id;
	}
	public void setCo_id(Integer co_id) {
		this.co_id = co_id;
	}
	public Date getCo_date() {
		return co_date;
	}
	public void setCo_date(Date co_date) {
		this.co_date = co_date;
	}
	
}
