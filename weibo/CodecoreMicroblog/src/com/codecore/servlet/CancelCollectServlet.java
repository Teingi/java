package com.codecore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.CollectDao;
import com.codecore.entity.UserInfo;

public class CancelCollectServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 doPost(request,response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取当前用户数据
		int co_id=Integer.parseInt(request.getParameter("co_id"));
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		int uid=userInfo.getU_id(); 							 
		//---------//////////---分页处理-------------------//	 	
	 	//分页
	 	String pageNumberStr = request.getParameter("pageNumber");  
	    int pageNumber = 1;  
	    if(pageNumberStr!=null && !pageNumberStr.isEmpty())  
	    {  
	        pageNumber = Integer.parseInt(pageNumberStr);  
	    }  
	    int pageSize = 3; //分页大小  
	    CollectDao collectDao=new CollectDao();
	    int totalPosts =collectDao.allCollects(uid); //总文章数  
	    int totalPages = (int)totalPosts/pageSize + ((totalPosts%pageSize)>0?1:0); //计算得出的总页数  	    
	    session.setAttribute("pageSize", pageSize);  
	    session.setAttribute("totalPosts", totalPosts);  
	    session.setAttribute("pageNumber", pageNumber);  
	    session.setAttribute("totalPages", totalPages);  
	     //分页结束
	     //处理数据	    
		boolean flag=collectDao.cancelCollect(co_id);
		 //页面跳转
 	    request.getRequestDispatcher("/servlet/ShowCollectServlet").forward(request, response); 	    		 
	}
}
