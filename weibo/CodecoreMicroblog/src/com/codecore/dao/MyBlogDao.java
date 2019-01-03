package com.codecore.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.codecore.dbutil.DBConn;
import com.codecore.entity.Blog;
/**
 * 获取当前用户自己的博客信息
 * @author Vincent
 *
 */

public class MyBlogDao {
	//根据用户的id得到其所发微博信息
	public List<Blog> getMyBlogByUid(final int uid, int pageSize, int pageNo){
		List<Blog> mybloglist = new ArrayList<Blog>();
		String strSQL = "SELECT * FROM blog where u_id=(select u_id from userinfo where u_id=?) order by b_time desc limit ?, ?";
		DBConn dbConn = new DBConn();
		ResultSet rs = dbConn.execQuery(strSQL, new Object[]{uid, pageSize*(pageNo-1), pageSize});
		try {
		
			while(rs.next()) {
				Blog myblog = new Blog();
				myblog.setB_content(rs.getString("b_content"));
				myblog.setB_time(rs.getDate("b_time"));
				myblog.setB_id(rs.getInt("b_id"));
				myblog.setB_img(rs.getString("b_img"));
				myblog.setB_date(rs.getTime("b_time"));
				mybloglist.add(myblog);
			}
		   	return mybloglist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			dbConn.closeConn();
		}
	
	}
	
}
