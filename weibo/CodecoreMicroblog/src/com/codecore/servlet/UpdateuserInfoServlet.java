package com.codecore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codecore.dao.UserDao;
import com.codecore.entity.UserInfo;
 

public class UpdateuserInfoServlet extends HttpServlet {
 
	/**
	 * 
	 */
	private static final long serialVersionUID = -933745162118546757L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 doPost(request,response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int u_id=Integer.parseInt(request.getParameter("id")); 
		String u_account=request.getParameter("account");
		String u_mail=request.getParameter("mail");
	    String u_nick=request.getParameter("nick");
	    String u_img=request.getParameter("img");
	    String u_sex=request.getParameter("sex");
	    

	    String u_date=request.getParameter("date");
	    
		 
	    String u_name=request.getParameter("name");
	    String u_password=request.getParameter("password");
		 
		 String u_addr=request.getParameter("addr");
		 
		 String u_qq=request.getParameter("qq");
		 String u_msn=request.getParameter("msn");
		 String u_sign=request.getParameter("sign");
		
		UserInfo userInfo=new UserInfo();
		 
		userInfo.setU_account(u_account);
		userInfo.setU_sex(u_sex);
		userInfo.setU_date(u_date); 
		userInfo.setU_img(u_img);
		userInfo.setU_mail(u_mail);
		userInfo.setU_nick(u_nick);
		userInfo.setU_name(u_name);
		userInfo.setU_password(u_password);
		userInfo.setU_addr(u_addr);
		userInfo.setU_qq(u_qq);
		userInfo.setU_msn(u_msn);
		userInfo.setU_sign(u_sign);

		UserDao userDao = new UserDao();
		boolean flag = userDao.updateUserInfo(userInfo,u_id);
		int res = flag?1:2;
		response.sendRedirect("../userinfo.jsp?msg=" + res);

		 
	}
	}

 
