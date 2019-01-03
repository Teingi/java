package com.codecore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.codecore.dbutil.DBConn;
import com.codecore.entity.UserInfo;

/**
 * 首页加载头像
 * 
 * @author Vincent
 * 
 */
public class UploadFaceDao {
	// 得到已注册用户的头像
	public List<UserInfo> uploadFace() {
		int num = getRandom();
		List<UserInfo> list = new ArrayList<UserInfo>();
		String sql = "select * from userinfo limit ?,24";
		DBConn dbConn = new DBConn();
		ResultSet rs = dbConn.execQuery(sql, new Object[] { num });
		try {
			while (rs.next()) {
				UserInfo user = new UserInfo();
				user.setU_id(rs.getInt("u_id"));
				user.setU_nick(rs.getString("u_nick"));
				user.setU_img(rs.getString("u_img"));
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbConn.closeConn();
		}
		return list;
	}

	// 登入验证
	public UserInfo check(final String account, final String password) {
		String strSQL = "SELECT * from userinfo where u_account=? and u_password=?";
		DBConn dbconn = new DBConn();
		ResultSet rs = dbconn.execQuery(strSQL, new Object[] { account,
				password });
		UserInfo user = new UserInfo();
		try {
			while (rs.next()) {
				user.setU_id(rs.getInt("u_id"));
				user.setU_account(rs.getString("u_account"));
			}
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		} finally {
			dbconn.closeConn();
		}
	}
	
	// 登入验证
	public boolean check(UserInfo userInfo) {
		String strSQL = "SELECT * from userinfo where u_account=? and u_password=?";
		DBConn dbconn = new DBConn();
		ResultSet rs = dbconn.execQuery(strSQL, new Object[] { userInfo.getU_account(),
				userInfo.getU_password() });
		boolean flag=false;
		try {
			while (rs.next()) {
				flag=true;
			}
			return flag;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return flag;
		} finally {
			dbconn.closeConn();
		}
	}

	// 生成随机数
	private static int getRandom() {
		Random random = new Random();
		int result = 0;
		for (int i = 0; i < 10; i++) {
			result = (Math.abs(random.nextInt()) % 5);
		}
		return result;
	}

}
