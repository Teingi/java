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

public class SearchProfileServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");				 	 	
	 	 //接受客户端数据
	 	String b_content=request.getParameter("textfield2").trim();
	 	HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		int uid=userInfo.getU_id(); 
	 	 
        ///////////----------分页处理--------////////
	 	int pageNumber = 0;  
	 	if (request.getParameter("pageNumber")!=null) {
	 	    pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}else
			pageNumber=1;
	    int pageSize = 3; //分页大小  
	    SearchDao searchDao=new SearchDao();
	    int totalPosts =  searchDao.allSearchMyBlogs(b_content,uid); //总文章数  
	    int totalPages = (int)totalPosts/pageSize + ((totalPosts%pageSize)>0?1:0); //计算得出的总页数  	    
	    session.setAttribute("p_pageSize", pageSize);  
	    session.setAttribute("p_totalPosts", totalPosts);  
	    session.setAttribute("p_pageNumber", pageNumber);  
	    session.setAttribute("p_totalPages", totalPages);
	    
	 	//////////-------分页结束----------/////////////
	 	  //处理数据
	 	List<Blog> list =new ArrayList<Blog>();
		list =searchDao.searchProfile(b_content,uid,pageSize, pageNumber); 		 	 
		session.setAttribute("list", list);
		  //根据处理结果响应客户端
	 	request.getRequestDispatcher("../profile1.jsp").forward(request, response);	 		 
	}
}
