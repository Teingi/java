package com.codecore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.AttentionDao;
import com.codecore.dao.MyBlogDao;
import com.codecore.entity.Blog;
import com.codecore.entity.UserInfo;

public class PageServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3419721864595457070L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		MyBlogDao myBlogDao=new MyBlogDao();
		AttentionDao attentionDao=new AttentionDao();
		
		int uid=0;
	 	if (request.getParameter("curUid")!=null) {
	 		uid=Integer.parseInt(request.getParameter("curUid"));
		}else{
			UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
			uid=userInfo.getU_id();
		}
	 	///////////----------分页处理--------////////
	 	int pageNumber = 0;  
	 	if (request.getParameter("pageNumber")!=null) {
	 		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}else
			pageNumber=1;
	    int pageSize = 3; //分页大小  
	    int totalPosts = (int)attentionDao.accountBlogs(uid); //总文章数  
	    int totalPages = (int)totalPosts/pageSize + ((totalPosts%pageSize)>0?1:0); //计算得出的总页数  
	    session.setAttribute("p_pageSize", pageSize);  
	    session.setAttribute("p_totalPosts", totalPosts);  
	    session.setAttribute("p_pageNumber", pageNumber);  
	    session.setAttribute("p_totalPages", totalPages);
	    List<Blog> mybloglist  = myBlogDao.getMyBlogByUid(uid,pageSize, pageNumber);
	 	//////////-------分页结束----------/////////////
	 	session.setAttribute("blogList", mybloglist);
	 	response.sendRedirect("/CodecoreMicroblog/profile.jsp");
//	 	request.getRequestDispatcher("/profile.jsp").forward(request, response);
	}

}
