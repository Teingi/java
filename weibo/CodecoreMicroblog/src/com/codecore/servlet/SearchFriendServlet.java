 package com.codecore.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.AttentionDao;
import com.codecore.dao.SearchDao;
import com.codecore.entity.Blog;
import com.codecore.entity.UserInfo;

public class SearchFriendServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");					 	
	 	 //接受客户端数据
	 	String u_nick=request.getParameter("textfield3").trim();
	 	HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		int uid=userInfo.getU_id(); 	
	 	 //处理数据
		SearchDao searchDao=new SearchDao();	
	 	List<UserInfo> list =new ArrayList<UserInfo>();
		list =searchDao.searchFriend(u_nick,uid); 
		session.setAttribute("list", list);
		 //根据处理结果响应客户端
	 	request.getRequestDispatcher("../friend1.jsp").forward(request, response);	 
	}
}
