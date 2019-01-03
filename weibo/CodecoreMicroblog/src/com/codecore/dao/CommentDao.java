package com.codecore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.codecore.dbutil.DBConn;
import com.codecore.entity.Blog;
import com.codecore.entity.Comment;
/**
 * 
 * @author Vincent
 *	处理对微博的评论
 */
public class CommentDao {

	//添加评论
	public void postComment(Blog blog, final int uid, String comment){
		DBConn dbConn=new DBConn();
		Date date=new Date(System.currentTimeMillis());
		String insertSql="insert into comment (u_id, b_id, c_content, c_time) values (?,?,?,?)";
		dbConn.execOther(insertSql, new Object[]{uid, blog.getB_id(), comment, date});
		dbConn.closeConn();
	}
	//统计评论次数
	public int accountComment(final int bid){
		DBConn dbConn=new DBConn();
		String sql="select count(*) from comment where b_id=?";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{bid});
		int num=0;
		try {
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
	//根据ID获取评论
	public ArrayList<Comment> getContentById(final int bid){
		ArrayList<Comment> listComments=new ArrayList<Comment>();
		DBConn dbConn=new DBConn();
		String sql="select * from comment where b_id=?";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{bid});
		try {
			while (rs.next()) {
				Comment comment=new Comment();
				comment.setC_content(rs.getString("c_content"));
				comment.setU_id(rs.getInt("u_id"));
				listComments.add(comment);
			}
			return listComments;
		} catch (SQLException e) {
			return null;
		}finally{
			dbConn.closeConn();
		}
}
}