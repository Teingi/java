package com.codecore.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.AttentionDao;
import com.codecore.dao.UploadFaceDao;
import com.codecore.entity.Blog;
import com.codecore.entity.UserInfo;


@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UploadFaceDao upload=new UploadFaceDao();
		//-------------/////////------------------//
		HttpSession session=request.getSession();
		UserInfo userInfo=new UserInfo();
	 	userInfo=(UserInfo)session.getAttribute("userInfo");
	 	String u_account=null;
	 	String u_password=null;
	 	if (userInfo==null||userInfo.getU_account()==null) {
			u_account=request.getParameter("userid").trim();
	        u_password=request.getParameter("password").trim();
		}else{
			u_account=userInfo.getU_account();
			u_password=userInfo.getU_password();
		}
		userInfo=upload.check(u_account, u_password);
		//是否自动登入
		String autologin=request.getParameter("save");
        if (userInfo.getU_id()!=null) {
        	ArrayList<Blog> listAll=new ArrayList<Blog>();
    	 	AttentionDao attentionDao=new AttentionDao();
    		if ("yes".equals(autologin)) {
    			userInfo.setU_account(u_account);
    			userInfo.setU_password(u_password);
    			setCookie(request, response, userInfo);
    		}
 	   		//---------//////////---分页处理-------------------//	 	
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
     	    response.sendRedirect("/CodecoreMicroblog/home.jsp");
		}else
			response.sendRedirect("/CodecoreMicroblog/index.jsp?msg=5");
	}
	
	//保存cookie
	public void setCookie(HttpServletRequest request, HttpServletResponse response, UserInfo userInfo)
	throws ServletException, IOException {
		//保存Cookie
        if(userInfo.getU_account() !=""){
            Cookie c1 = new Cookie("userName",userInfo.getU_account());
            Cookie c2=new Cookie("password", userInfo.getU_password());
            c1.setMaxAge(60*60*60*12*30) ;
            c2.setMaxAge(60*60*60*12*30);
            response.addCookie(c1);
            response.addCookie(c2);
        }
	}
}
