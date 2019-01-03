package com.codecore.entity;

/**
 * 用户实体类，包装了用户的所有信息
 * @author Vincent
 *
 */
public class UserInfo {
	private Integer u_id;
	private String u_account;
	private String u_password;
	private String u_nick;
	private String u_img;
	private String u_sex;
	private String u_name;
	private String u_date;
	private String u_addr;
	private String u_mail;
	private String u_qq;
	private String u_msn;
	private String u_sign;
	private String u_url;
	private String u_question;
	
	public String getU_question() {
		return u_question;
	}
	public void setU_question(String uQuestion) {
		u_question = uQuestion;
	}
	public String getU_url() {
		return u_url;
	}
	public void setU_url(String uUrl) {
		u_url = uUrl;
	}
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserInfo(Integer uId, String uAccount, String uPassword,
			String uNick, String uImg, String uSex, String uName, String uDate,
			String uAddr, String uMail, String uQq, String uMsn, String uSign) {
		super();
		u_id = uId;
		u_account = uAccount;
		u_password = uPassword;
		u_nick = uNick;
		u_img = uImg;
		u_sex = uSex;
		u_name = uName;
		u_date = uDate;
		u_addr = uAddr;
		u_mail = uMail;
		u_qq = uQq;
		u_msn = uMsn;
		u_sign = uSign;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer uId) {
		u_id = uId;
	}
	public String getU_account() {
		return u_account;
	}
	public void setU_account(String uAccount) {
		u_account = uAccount;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String uPassword) {
		u_password = uPassword;
	}
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String uNick) {
		u_nick = uNick;
	}
	public String getU_img() {
		return u_img;
	}
	public void setU_img(String uImg) {
		u_img = uImg;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String uSex) {
		u_sex = uSex;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String uName) {
		u_name = uName;
	}
	public String getU_date() {
		return u_date;
	}
	public void setU_date(String uDate) {
		u_date = uDate;
	}
	public String getU_addr() {
		return u_addr;
	}
	public void setU_addr(String uAddr) {
		u_addr = uAddr;
	}
	public String getU_mail() {
		return u_mail;
	}
	public void setU_mail(String uMail) {
		u_mail = uMail;
	}
	public String getU_qq() {
		return u_qq;
	}
	public void setU_qq(String uQq) {
		u_qq = uQq;
	}
	public String getU_msn() {
		return u_msn;
	}
	public void setU_msn(String uMsn) {
		u_msn = uMsn;
	}
	public String getU_sign() {
		return u_sign;
	}
	public void setU_sign(String uSign) {
		u_sign = uSign;
	}
	
	
}
