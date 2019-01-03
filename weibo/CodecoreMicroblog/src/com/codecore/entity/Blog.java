package com.codecore.entity;

import java.util.Date;

/**
 * 微博实体类，get和set所有微博信息
 * 
 * @author Vincent
 * 
 */
public class Blog {
	private Integer b_id;
	private String b_content;
	private Date b_time;
	private int u_id;
	private String b_img;
	private int b_degree;
	private Date b_date;

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date bDate) {
		b_date = bDate;
	}

	public int getB_degree() {
		return b_degree;
	}

	public void setB_degree(int bDegree) {
		b_degree = bDegree;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String bImg) {
		b_img = bImg;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int uId) {
		u_id = uId;
	}

	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Blog(Integer bId, String bContent, Date bTime) {
		super();
		b_id = bId;
		b_content = bContent;
		b_time = bTime;
	}

	public Integer getB_id() {
		return b_id;
	}

	public void setB_id(Integer bId) {
		b_id = bId;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String bContent) {
		b_content = bContent;
	}

	public Date getB_time() {
		return b_time;
	}

	public void setB_time(Date bTime) {
		b_time = bTime;
	}

}
