package com.codecore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.codecore.dbutil.DBConn;
import com.codecore.entity.Blog;
import com.codecore.entity.Collect;
import com.codecore.entity.UserInfo;

public class SearchDao {
	//搜索我的首页
	public  List<Blog> searchHome(final  String b_content ,final int u_id,  int pageSize, int pageNo){		 
		List<Blog> lstBlogs=new ArrayList<Blog>();
		DBConn dbConn=new DBConn();		
		String sql="select * from blog where b_content like ? and (u_id= any( select f_gid from friends where (f_uid=? and f_state=1) or (f_uid=? and f_state=2))or u_id=?  or u_id= any(select f_uid from friends where f_gid=? and f_state=2)) order by b_time desc limit ?, ?";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{"%"+b_content+"%",u_id ,u_id,u_id,u_id,pageSize*(pageNo-1), pageSize});
		try {
			while (rs.next()) {
				Blog blog=new Blog();
				blog.setB_content(rs.getString("b_content"));
				blog.setB_time(rs.getDate("b_time"));
				blog.setB_date(rs.getTime("b_time"));
				blog.setU_id(rs.getInt("u_id"));
				blog.setB_degree(rs.getInt("b_degree"));
				blog.setB_id(rs.getInt("b_id"));
				blog.setB_img(rs.getString("b_img"));
				lstBlogs.add(blog);
			}
			return lstBlogs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}finally{
			dbConn.closeConn();
		}
	}
	//搜索我的微博
	public List<Blog> searchProfile(final  String b_content ,final int u_id,  int pageSize, int pageNo){		 
		List<Blog> lstBlogs=new ArrayList<Blog>();
		DBConn dbConn=new DBConn();		
		String sql="select * from blog where b_content like ? and u_id=? order by b_time desc limit ?, ?";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{"%"+b_content+"%",u_id,pageSize*(pageNo-1), pageSize});
		try {
			while (rs.next()) {
				Blog blog=new Blog();
				blog.setB_content(rs.getString("b_content"));
				blog.setB_time(rs.getDate("b_time"));
				blog.setB_date(rs.getTime("b_time"));
				blog.setU_id(rs.getInt("u_id"));
				blog.setB_id(rs.getInt("b_id"));
				blog.setB_img(rs.getString("b_img"));
				lstBlogs.add(blog);
			}
			return lstBlogs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}finally{
			dbConn.closeConn();
		}
	}
	//搜索我的好友
	public List<UserInfo> searchFriend(final  String u_nick,final int u_id){		 
		List<UserInfo> lstFriend=new ArrayList<UserInfo>();
		DBConn dbConn=new DBConn();		
		String sql="select * from userinfo where u_nick like ? and (u_id=any(select f_gid from friends where f_uid=? and f_state=2) or u_id=any(select f_uid from friends where f_gid=? and f_state=2))";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{"%"+u_nick+"%",u_id,u_id});
		try {
			while (rs.next()) {
				UserInfo userInfo=new UserInfo();
				userInfo.setU_addr(rs.getString("u_addr"));
				userInfo.setU_img(rs.getString("u_img"));
				userInfo.setU_nick(rs.getString("u_nick"));
				 
				lstFriend.add(userInfo);
			}
			return lstFriend;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}finally{
			dbConn.closeConn();
		}
	}
	//搜索关注
	public List<UserInfo> searchFollowing(final  String u_nick,final int u_id){		 
		List<UserInfo> lstFollowing=new ArrayList<UserInfo>();
		DBConn dbConn=new DBConn();		
		String sql="select * from userinfo where u_nick like ? and (u_id=any(select f_gid from friends where f_uid=? and f_state=1))";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{"%"+u_nick+"%",u_id});
		try {
			while (rs.next()) {
				UserInfo userInfo=new UserInfo();
				userInfo.setU_addr(rs.getString("u_addr"));
				userInfo.setU_img(rs.getString("u_img"));
				userInfo.setU_nick(rs.getString("u_nick"));
				 
				lstFollowing.add(userInfo);
			}
			return lstFollowing;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}finally{
			dbConn.closeConn();
		}
	}
	//搜索我的收藏
	public List<Collect> searchCollect(final  String co_content ,final int u_id,  int pageSize, int pageNo){		 
		List<Collect> lstCollects=new ArrayList<Collect>();
		DBConn dbConn=new DBConn();		
		String sql="select * from collect where co_content like ? and u_id=? order by co_time desc limit ?, ?";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{"%"+co_content+"%",u_id,pageSize*(pageNo-1), pageSize});
		try {
			while (rs.next()) {
				Collect collect=new Collect();
				collect.setCo_content(rs.getString("co_content"));
				collect.setCo_time(rs.getDate("co_time"));
				collect.setCo_date(rs.getTime("co_time"));
				collect.setU_id(rs.getInt("u_id"));
				collect.setB_id(rs.getInt("b_id"));
				collect.setCo_img(rs.getString("co_img"));
				lstCollects.add(collect);
			}
			return lstCollects;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}finally{
			dbConn.closeConn();
		}
	}
	//统计搜索首页的微博总数
	public int allSearchBlogs(final String b_content,final int u_id ){
		DBConn dbConn=new DBConn();
		String sql="select count(*) from blog where  b_content like ? and (u_id= any( select f_gid from friends where (f_uid=? and f_state=1) or (f_uid=? and f_state=2))or u_id=?  or u_id= any(select f_uid from friends where f_gid=? and f_state=2))";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{"%"+b_content+"%",u_id,u_id,u_id,u_id});
		try {
			int num=0;
			while (rs.next()) {
				num=rs.getInt("count(*)");
			}
			return num;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return 0;
		}finally{
			dbConn.closeConn();
		}
	}
	//统计搜索我的微博页面的微博总数
	public int allSearchMyBlogs(final String b_content,final int u_id ){
		DBConn dbConn=new DBConn();
		String sql="select count(*) from blog where  b_content like ? and u_id=?";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{"%"+b_content+"%",u_id});
		try {
			int num=0;
			while (rs.next()) {
				num=rs.getInt("count(*)");
			}
			return num;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return 0;
		}finally{
			dbConn.closeConn();
		}
	}
	//统计搜索我的好友页面的总数	
	public int allSearchFriends(final String u_nick,final int u_id ){
		DBConn dbConn=new DBConn();
		String sql="select count(*) from userinfo where u_nick like ? and (u_id=any(select f_gid from friends where f_uid=? and f_state=2) or u_id=any(select f_uid from friends where f_gid=? and f_state=2))";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{"%"+u_nick+"%",u_id,u_id});
		try {
			int num=0;
			while (rs.next()) {
				num=rs.getInt("count(*)");
			}
			return num;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return 0;
		}finally{
			dbConn.closeConn();
		}
	}
	//统计搜索我的收藏页面的收藏总数
	public int allSearchCollects(final String co_content,final int u_id ){
		DBConn dbConn=new DBConn();
		String sql="select count(*) from collect where co_content like ? and u_id=?";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{"%"+co_content+"%",u_id });
		try {
			int num=0;
			while (rs.next()) {
				num=rs.getInt("count(*)");
			}
			return num;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return 0;
		}finally{
			dbConn.closeConn();
		}
	}
}
	 
 