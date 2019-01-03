package com.codecore.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.codecore.dao.AttentionDao;
import com.codecore.dao.UserDao;
import com.codecore.entity.UserInfo;
import com.codecore.tools.DataTool;

 

public class UpdateimgServlet extends HttpServlet {
	private static final long serialVersionUID = 6134014846518196144L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		    request.setCharacterEncoding("utf-8");
			try {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload fileload = new ServletFileUpload(factory);
				// 设置最大文件尺寸，这里是4MB
				fileload.setSizeMax(4194304);
				List<FileItem> files = fileload.parseRequest(request);
				//循环迭代分析每一个表单项
				Iterator<FileItem> iterator = files.iterator();
				while (iterator.hasNext()) {
					FileItem item = iterator.next();
					//如果当前项是普通表单项。
					if (item.isFormField()) { 
//						do something
					} else {
						// 获得获得文件名，此文件名包括路径
						String filename = item.getName();
						if (filename != null) {
							File file = new File(filename);
							DataTool dataTool=new DataTool();
							filename=dataTool.getDate()+"_"+file.getName();
							File filetoserver = new File(this.getServletContext().getRealPath("/face"),filename);
							item.write(filetoserver);
							String filetodb =request.getContextPath()+"/face/"+ filename.substring(filename.lastIndexOf("\\")+1);
							int u_id = Integer.parseInt(request.getParameter("uid"));
							UserInfo userInfo = new UserInfo();
							userInfo.setU_img(filetodb);
							userInfo.setU_id(u_id);
							UserDao userDao = new UserDao();
							userDao.updateImg(userInfo);
							HttpSession session = request.getSession();
							//获取新的userInfo
							AttentionDao attentionDao=new AttentionDao();
							userInfo=attentionDao.getUserInfo(u_id);
							session.setAttribute("userInfo",userInfo);
							response.sendRedirect("../myface.jsp");
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
}
