package com.codecore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.CommentDao;
import com.codecore.entity.Blog;

public class AddCommentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6282004198328297575L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		int uid=Integer.parseInt(request.getParameter("curUid").toString());
		int bid=Integer.parseInt(request.getParameter("bid").toString());
		String content=request.getParameter("txtContent");
		CommentDao commentDao=new CommentDao();
		Blog blog=new Blog();
		blog.setB_id(bid);
		commentDao.postComment(blog, uid, content);
		session.setAttribute("c_degree", commentDao.accountComment(bid));
		response.sendRedirect("/CodecoreMicroblog/home.jsp");
	}

}
