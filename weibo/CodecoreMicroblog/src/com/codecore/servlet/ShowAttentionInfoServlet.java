package com.codecore.servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.AttentionDao;
import com.codecore.entity.UserInfo;

public class ShowAttentionInfoServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1365352763736664497L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid=Integer.parseInt(request.getParameter("a_uid"));
		AttentionDao attentionDao=new AttentionDao();
		//获取关注人信息
		List<UserInfo> lstInfos=attentionDao.getAttention(uid);
		HttpSession session=request.getSession();
		session.setAttribute("attInfos", lstInfos);
		request.getRequestDispatcher("/friend.jsp").forward(request, response);
		
	}

}
