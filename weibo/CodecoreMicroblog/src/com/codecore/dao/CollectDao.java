package com.codecore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.codecore.dbutil.DBConn;
import com.codecore.entity.Blog;
import com.codecore.entity.Collect;


public class  CollectDao {
	
	//添加收藏 
	public boolean addcollect(Collect collect){
		
		//拆出Collect对象属性
		int u_id =  collect.getU_id();
		int b_id =  collect.getB_id();
		Date co_time = new Date(System.currentTimeMillis());		 
		String co_content=collect.getCo_content();
		String co_img=collect.getCo_img();
		//组织SQL语句
		String strSql = "insert into collect(u_id,b_id,co_time,co_content,co_img) values(?,?,?,?,?)";
		//连接数据库
		DBConn dbConn = new DBConn();
		int affectedRows = dbConn.execOther(strSql, new Object[]{u_id ,b_id,co_time,co_content,co_img});
		//关闭数据连接
		 dbConn.closeConn();
		 return affectedRows >0?true:false;
			
	}
	//取消收藏
	public boolean cancelCollect(final int co_id) {
		String sqlDelete = "delete from collect where co_id=? ";
		DBConn dbConn = new DBConn();		
		int affectedRows= dbConn.execOther(sqlDelete, new Object[] { co_id });
		dbConn.closeConn();
		return affectedRows > 0 ? true : false;
	}	 
	//根据微博id得到微薄的内容
	public Blog getBlogsById(final int b_id){
		String sql="select * from blog where b_id=?";
		DBConn dbConn=new DBConn();
		ResultSet rs=dbConn.execQuery(sql, new Object[]{b_id});
		Blog blogs=new Blog();
		try {
			while(rs.next()){				
				blogs.setU_id(rs.getInt("u_id"));
				blogs.setB_content(rs.getString("b_content"));
				blogs.setB_img(rs.getString("b_img"));				
			}
			return blogs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally {
			dbConn.closeConn();
		}		
	}
	//向页面传输收藏数据库内容
	public List<Collect> getCollect(final int u_id, int pageSize, int pageNo){
		//创建一个空集合
		List<Collect>lstCollect = new ArrayList<Collect>();
		//动态创建SQL语句
		String strSQL = "select * from collect where u_id=? order by co_time desc limit ?, ?";
		//连接数据库
		DBConn dbConn = new DBConn();
		ResultSet rs = dbConn.execQuery(strSQL, new Object[]{u_id, pageSize*(pageNo-1), pageSize});
		
		try {
			//通过循环遍历结果集合RS
			while(rs.next()){
				//封装Collect对象
				Collect collect = new Collect();
				collect.setCo_id(rs.getInt("co_id"));
				collect.setU_id(rs.getInt("u_id"));
				collect.setB_id(rs.getInt("b_id"));
				collect.setCo_time(rs.getDate("co_time"));
				collect.setCo_content(rs.getString("co_content"));
				collect.setCo_date(rs.getTime("co_time"));
				collect.setCo_img(rs.getString("co_img"));
				//将封装好的对象放入集合中
				lstCollect.add(collect);
			}
			//返回集合
			return lstCollect;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			dbConn.closeConn();
		}		
	}
	//统计收藏数
	public int allCollects(final int u_id){
		DBConn dbConn=new DBConn();
		String sql="select count(*) from collect where u_id=?  ";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{ u_id});
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
	
	
	

