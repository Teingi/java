package com.codecore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.codecore.dbutil.DBConn;
/**
 * 
 * @author Vincent
 *	统计当前页注册用户，用于首页显示
 */

public class CountUser {
	
	//统计用户个数
	public long countUser(){
		String sql="select count(*) from userinfo";
		DBConn dbConn=new DBConn();
		ResultSet rs1=dbConn.execQuery(sql, new Object[]{});
		try {
			rs1.next();
			long num=rs1.getInt(1);
			return num;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return e.getErrorCode();
		}finally{
			dbConn.closeConn();
		}
	}
}
