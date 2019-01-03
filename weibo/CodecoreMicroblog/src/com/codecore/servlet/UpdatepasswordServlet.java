package com.codecore.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codecore.dao.UserDao;
import com.codecore.entity.UserInfo;
 

public class UpdatepasswordServlet extends HttpServlet {
 
	/**
	 * 
	 */
	private static final long serialVersionUID = 4059301453534337662L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       doPost(request,response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int u_id=Integer.parseInt(request.getParameter("id")); 
		String u_password=request.getParameter("newpassword1");
		String password=request.getParameter("password");
		UserInfo userInfo=new UserInfo();
		userInfo.setU_password(u_password);
		UserDao userDao = new UserDao();
		boolean flag = userDao.checkPassword(password,u_id);
		if(flag==true){
			userDao.updatePassword(userInfo,u_id);	
			response.sendRedirect("../userinfo.jsp?msg=3");
		}
		else{
			response.sendRedirect("../mypassword.jsp?msg=4");
		}
		
		 
		 
	}

}
