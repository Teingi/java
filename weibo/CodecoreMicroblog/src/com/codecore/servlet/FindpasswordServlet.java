package com.codecore.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import com.codecore.dao.UserDao;
import com.codecore.entity.UserInfo;

public class FindpasswordServlet extends HttpServlet {

	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 7437955871310285611L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	 doPost(request,response);
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
	        //从前台获取用户的Email和密保问题
			String u_mail=request.getParameter("email");
	        String u_question=request.getParameter("question");
	        UserDao userDao=new UserDao();
	        //查找用户密码
	        UserInfo userInfo=(UserInfo)userDao.findPassword(u_mail, u_question);
	        if(userInfo!=null){
	        	//向用户的邮箱发送密码
	        	SimpleEmail email = new SimpleEmail();
	    		//设置发送主机的服务器地址
	    		email.setHostName("smtp.163.com");
	    		try {
	    			//设置收件人邮箱
	    			email.addTo(userInfo.getU_mail(),userInfo.getU_account());
	    			//发件人邮箱
	    			email.setFrom("CodecoreBlog@163.com", "Codecore");
	    			//如果要求身份验证，设置用户名、密码，分别为发件人在邮件服务器上注册的用户名和密码
	    			email.setAuthentication("CodecoreBlog", "codecore");
	    			//设置邮件的主题
	    			email.setSubject("Codecore给您发送的邮件···");
	    			//邮件正文消息
	    			email.setMsg("亲爱的"+userInfo.getU_account()+"您好！感谢您注册Codecore微博系统。你的密码是："+userInfo.getU_password()+"请您妥善保管，以防被他人窃取···");
	    			email.send();
	    			response.sendRedirect("../findpassword.jsp?msg=10");
	    		} catch (EmailException e) {
	    			// TODO Auto-generated catch block
	    			response.sendRedirect("../findpassword.jsp?msg=7");
	    		}
	        }
	        else{
	        	response.sendRedirect("../findpassword.jsp?msg=7");
	        }
	}

}
