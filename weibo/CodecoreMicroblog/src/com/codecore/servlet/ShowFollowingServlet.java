package com.codecore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.AttentionDao;
import com.codecore.dao.FollowingDao;
import com.codecore.entity.UserInfo;

public class ShowFollowingServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 657645564361174363L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
    	throws ServletException, IOException {

		doPost(request,response);
}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	HttpSession session=request.getSession();
	AttentionDao attentionDao=new AttentionDao();
	///////////----------分页处理--------////////
 	//获取当前用户id
 	int uid=0;
 	if (request.getParameter("u_id")!=null) {
 		uid=Integer.parseInt(request.getParameter("u_id"));
	}else{
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		uid=userInfo.getU_id();
	}
 	int pageNumber = 0;  
 	if (request.getParameter("pageNumber")!=null) {
 		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}else
		pageNumber=1;
    int pageSize = 10; //分页大小  
    int totalPosts = (int)attentionDao.accountAttention(uid); //总文章数  
    int totalPages = (int)totalPosts/pageSize + ((totalPosts%pageSize)>0?1:0); //计算得出的总页数  
    session.setAttribute("f_pageSize", pageSize);  
    session.setAttribute("f_totalPosts", totalPosts);  
    session.setAttribute("f_pageNumber", pageNumber);  
    session.setAttribute("f_totalPages", totalPages);
 	//////////-------分页结束----------/////////////
	List<UserInfo> followinglist  = new FollowingDao().getFollowingByUid(uid,pageSize, pageNumber);
	request.setAttribute("followinglist", followinglist );
	session.setAttribute("pageFlag", "following");
	request.getRequestDispatcher("../friend.jsp").forward(request, response);
	}
}
