package com.codecore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codecore.entity.UserInfo;

public class RemoveServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -9005033482700205192L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.getSession().invalidate();
		setCookie(request, response, null);
//		request.getRequestDispatcher("../index.jsp").forward(request, response);
		response.sendRedirect("/CodecoreMicroblog/index.jsp");
	}

	//±£´æcookie
	public void setCookie(HttpServletRequest request, HttpServletResponse response, UserInfo userInfo)
	throws ServletException, IOException {
        Cookie c1 = new Cookie("userName","");
        Cookie c2=new Cookie("password", "");
        c1.setMaxAge(0) ;
        c2.setMaxAge(0);
        response.addCookie(c1);
        response.addCookie(c2);
	}
}
