package com.codecore.entity;

import java.util.Date;

/**
 * 评论实体类，set和get所有评论信息
 * 
 * @author Vincent
 * 
 */
public class Comment {

	private Integer c_id;
	private String c_content;
	private Date c_time;
	private int u_id;
	private int c_degree;
	private int b_id;
	private Date c_date;

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int uId) {
		u_id = uId;
	}

	public int getC_degree() {
		return c_degree;
	}

	public void setC_degree(int cDegree) {
		c_degree = cDegree;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int bId) {
		b_id = bId;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date cDate) {
		c_date = cDate;
	}

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(Integer cId, String cContent, Date cTime) {
		super();
		c_id = cId;
		c_content = cContent;
		c_time = cTime;
	}

	public Integer getC_id() {
		return c_id;
	}

	public void setC_id(Integer cId) {
		c_id = cId;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String cContent) {
		c_content = cContent;
	}

	public Date getC_time() {
		return c_time;
	}

	public void setC_time(Date cTime) {
		c_time = cTime;
	}

}
