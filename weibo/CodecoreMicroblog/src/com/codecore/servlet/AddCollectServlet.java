package com.codecore.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.CollectDao;
import com.codecore.entity.Blog;
import com.codecore.entity.Collect;
import com.codecore.entity.UserInfo;

public class AddCollectServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 //处理请求字符集
		request.setCharacterEncoding("utf-8");				  
		 //获取当前系统时间
	    Date   co_time   =   new   Date(System.currentTimeMillis());
	     //获取前台数据    
	    HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		int u_id=userInfo.getU_id(); 	
	    int b_id=Integer.parseInt(request.getParameter("bid"));
	    CollectDao collectDao = new CollectDao();
	    Blog blogs=collectDao.getBlogsById(b_id);
	    String  co_content=blogs.getB_content();
	    String  co_img=blogs.getB_img();
	     //将数据封装成Collect对象
	    Collect collect = new Collect();	    	    
	    collect.setU_id(u_id);
	    collect.setB_id(b_id);
	    collect.setCo_time(co_time);
	    collect.setCo_content(co_content);
	    collect.setCo_img(co_img);
	    //调用Dao层向数据库插入数据	   
	    boolean flag = collectDao.addcollect(collect);	   
	    //根据处理结果进行客户端响应
	    int res = flag?1:2;
	    String type=request.getParameter("type");
	    if("home".equals(type)){
	    	response.sendRedirect("../home.jsp?msg="+res);
	    }
	    else if("profile".equals(type)){
	    	response.sendRedirect("../profile.jsp?msg="+res);
	    }		
	}
}

