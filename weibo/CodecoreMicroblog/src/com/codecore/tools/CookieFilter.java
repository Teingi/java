package com.codecore.tools;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codecore.dao.AttentionDao;
import com.codecore.dao.UploadFaceDao;
import com.codecore.entity.UserInfo;

public class CookieFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) res;
		HttpSession session = request.getSession();
		// 如果session中没有user对象，则创建一个。
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		if (userInfo==null) {
			if (session!=null) {
				userInfo=getCookie(request, response);
				if (userInfo!=null) {
					if (userInfo.getU_account()!=null) {
						session.setAttribute("userInfo", userInfo);
						response.sendRedirect("/CodecoreMicroblog/LoginServlet");
						return;
					}
				}
			}
		}
		chain.doFilter(req, res);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	//获取cookie
	public UserInfo getCookie(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//读取Cookie
        Cookie cookies[] = request.getCookies() ;
        Cookie c = null ;
        UserInfo userInfo=new UserInfo();
        UploadFaceDao upload=new UploadFaceDao();
        if(cookies != null){
            for(int i=0;i<cookies.length;i++){
                c = cookies[i] ;
                if("userName".equals(c.getName())){
                    userInfo.setU_account(c.getValue());
                }
                if ("password".equals(c.getName())) {
					userInfo.setU_password(c.getValue());
				}
            }
         return userInfo;
        }else{
        	return null;
        }
	}

}
