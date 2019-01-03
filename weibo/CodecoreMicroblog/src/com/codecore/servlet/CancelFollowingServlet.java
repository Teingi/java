package com.codecore.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.codecore.dao.AttentionDao;
import com.codecore.dao.CancelFollowingDao;


import com.codecore.entity.UserInfo;

public class CancelFollowingServlet extends HttpServlet {

	private static final long serialVersionUID = 3166884069812705339L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {		
		doPost(request,response);
}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 //接收客户端数据
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");		
		int uid=userInfo.getU_id();
		int fid=Integer.parseInt(request.getParameter("fid"));
		 //调用Dao层，处理数据	
		CancelFollowingDao cancelFollowingDao = new CancelFollowingDao();
		cancelFollowingDao.cancelFollowing(uid, fid);
		 //设置会话跟踪机制，进行会话响应
		session.setAttribute("userId", userInfo.getU_id());
		AttentionDao attentionDao=new AttentionDao();
 		session.setAttribute("attention", attentionDao.accountAttention(userInfo.getU_id()));
 		session.setAttribute("fans",attentionDao.accountFans(userInfo.getU_id()));		
 		String type=request.getParameter("type");
 		 if("following".equals(type)){
 			response.sendRedirect("servlet/ShowFollowingServlet");
 	    }
 	    else if("friend".equals(type)){
 	    	response.sendRedirect("servlet/ShowFriendsServlet");
 	    }		
	}
}
