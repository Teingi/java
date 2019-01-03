 package com.codecore.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.SearchDao;
import com.codecore.entity.Collect;
import com.codecore.entity.UserInfo;

public class SearchCollectServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");			 		 
	 	SearchDao searchDao=new SearchDao();	
	 	 //接受客户端数据
	 	String co_content=request.getParameter("textfield4").trim();	
	 	HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		int uid=userInfo.getU_id(); 	
		 //分页开始
	 	int pageNumber = 0;  
	 	if (request.getParameter("pageNumber")!=null) {
	 		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}else
			pageNumber=1;
	    int pageSize = 3; //分页大小  
	    int totalPosts = searchDao.allSearchCollects(co_content,uid); //总文章数  
	    int totalPages = (int)totalPosts/pageSize + ((totalPosts%pageSize)>0?1:0); //计算得出的总页数  
	    session.setAttribute("pageSize", pageSize);  
	    session.setAttribute("totalPosts", totalPosts);  
	    session.setAttribute("pageNumber", pageNumber);  
	    session.setAttribute("totalPages", totalPages);
	 	 //分页结束
	     //处理数据
	 	List<Collect> list =new ArrayList<Collect>();
		list =searchDao.searchCollect(co_content,uid,pageSize, pageNumber); 		 	 
		session.setAttribute("listSearchCollect", list);
		 //页面跳转
	 	request.getRequestDispatcher("../collect1.jsp").forward(request, response);	 		 
	}
}
