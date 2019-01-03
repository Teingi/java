package com.codecore.tools;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * 文件上传工具类
 * 
 * @author Vincent
 * 
 */
public class FileUpload {
	
	// 设置上传文件最大为 3M
	private static final long MAX_SIZE = 3 * 1024 * 1024;
	// 允许上传的文件格式的列表
	private static final String[] ALLOW_TYPE = new String[] { "jpg", "jpeg",
			"gif", "txt", "doc", "docx", "mp3", "wma", "m4a", "mp4", "png" };

	@SuppressWarnings("deprecation")
	public Object getInstance(HttpServletRequest request,
			ServletContext context, Class clazz, String filePath) {
		Object object = null;
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(20 * 1024 * 1024); // 20M
		factory.setRepository(new File(request.getRealPath(filePath)));
		ServletFileUpload handler = new ServletFileUpload(factory);
		handler.setSizeMax(MAX_SIZE);
		handler.setHeaderEncoding("utf-8");
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		try {
			List<FileItem> files = handler.parseRequest(request);
			Iterator<FileItem> it = files.iterator();
			object = clazz.newInstance();
			while (it.hasNext()) {
				FileItem item = it.next();
				if (item.isFormField()) {
					paramsMap.put(item.getFieldName(), item.getString("utf-8"));
				} else {
					String filename = item.getName();
					File file = new File(filename);
					File filetoserver = new File(context.getRealPath(filePath),
							file.getName());
					item.write(filetoserver);
					String filetodb = request.getContextPath()
							+ "/"
							+ filePath
							+ "/"
							+ filename
									.substring(filename.lastIndexOf("\\") + 1);
					paramsMap.put(item.getFieldName(), filetodb);
				}
			}
			BeanUtils.populate(object, paramsMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}
}
