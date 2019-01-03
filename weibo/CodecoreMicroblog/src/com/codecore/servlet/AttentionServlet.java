package com.codecore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codecore.dao.AttentionDao;
import com.codecore.entity.UserInfo;

@SuppressWarnings("serial")
public class AttentionServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserInfo userInfo=(UserInfo)request.getSession().getAttribute("userInfo");
		AttentionDao attentionDao=new AttentionDao();
		request.setAttribute("attention", attentionDao.accountAttention(userInfo.getU_id()));
	}

}
