package com.codecore.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.AttentionDao;
import com.codecore.entity.Blog;
import com.codecore.entity.UserInfo;

public class AddAttentionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -822741816524109340L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		
		int uid=userInfo.getU_id();
		int fid=Integer.parseInt(request.getParameter("goal_uid"));
		AttentionDao attentionDao=new AttentionDao();
		attentionDao.addAttention(uid, fid);
		
		ArrayList<Blog> listAll=new ArrayList<Blog>();
		//---------//////////---分页处理-------------------//	 	
	 	//分页
	 	String pageNumberStr = request.getParameter("pageNumber");  
	    int pageNumber = 1;  
	    if(pageNumberStr!=null && !pageNumberStr.isEmpty())  
	    {  
	        pageNumber = Integer.parseInt(pageNumberStr);  
	    }  
	    int pageSize = 3; //分页大小  
	    int totalPosts = attentionDao.allBlogs(userInfo.getU_id()); //总文章数  
	    int totalPages = (int)totalPosts/pageSize + ((totalPosts%pageSize)>0?1:0); //计算得出的总页数  
	    session.setAttribute("pageSize", pageSize);  
	    session.setAttribute("totalPosts", totalPosts);  
	    session.setAttribute("pageNumber", pageNumber);  
	    session.setAttribute("totalPages", totalPages);  
	 	listAll=attentionDao.getBlog(userInfo.getU_id(), pageSize, pageNumber);
	 	
	 	session.setAttribute("listAll", listAll);
 	    session.setAttribute("userId", userInfo.getU_id());
 		session.setAttribute("attention", attentionDao.accountAttention(userInfo.getU_id()));
 		session.setAttribute("fans",attentionDao.accountFans(userInfo.getU_id()));
 	    String strFlag=request.getParameter("flag");
 	    if ("home".equals(strFlag)) {
 	    	  request.getRequestDispatcher("/home.jsp").forward(request, response);
		}else if("profile".equals(strFlag)){
			response.sendRedirect("/CodecoreMicroblog/profile.jsp");
		}else if("friend".equals(strFlag)){
			response.sendRedirect("/CodecoreMicroblog/friend.jsp");
		}else if("user".equals(strFlag)){
			response.sendRedirect("/CodecoreMicroblog/user.jsp");
		}
 	  
	}

}
