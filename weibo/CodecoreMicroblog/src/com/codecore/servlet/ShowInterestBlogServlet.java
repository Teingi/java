package com.codecore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.InterestBlogDao;
import com.codecore.entity.Blog;

public class ShowInterestBlogServlet extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 8710561933550644643L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
    	throws ServletException, IOException {
		doPost(request,response);
}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		String uid = request.getParameter("uid");
		if (uid!=null) {
			HttpSession idsession = request.getSession();
			idsession.setAttribute("ibuid", uid);
			List<Blog> interestbloglist  = new InterestBlogDao().getInterestBlogByUid(Integer.parseInt(uid));
			request.setAttribute("interestbloglist", interestbloglist);
			request.getRequestDispatcher("clickuser.jsp").forward(request, response);
		}else{
			response.sendRedirect("/CodecoreMicroblog/visitor.jsp");
		}
		
	}
}
