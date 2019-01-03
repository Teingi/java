package com.codecore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.codecore.dbutil.DBConn;
import com.codecore.entity.UserInfo;

/**
 * 用户注册
 * 
 * @author Vincent
 * 
 */
public class RegisterDao {

	// 检查用户昵称是否可用
	public boolean checkNick(String nick) {
		DBConn dbConn = new DBConn();
		String sql = "select u_nick from userinfo where u_nick =?";
		ResultSet rs = dbConn.execQuery(sql, new Object[] { nick });
		boolean flag = true;
		try {
			while (rs.next()) {
				rs.getString("u_nick");
				flag = false;
			}
			return flag;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return flag;
		} finally {
			dbConn.closeConn();
		}
	}

	// 检查邮箱是否可用
	public boolean checkMail(String mail) {
		DBConn dbConn = new DBConn();
		String sql = "select u_mail from userinfo where u_mail =?";
		ResultSet rs = dbConn.execQuery(sql, new Object[] { mail });
		boolean flag = true;
		try {
			while (rs.next()) {
				rs.getString("u_mail");
				flag = false;
			}
			return flag;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return flag;
		} finally {
			dbConn.closeConn();
		}
	}

	// 验证成功，添加新用户
	public boolean addUser(UserInfo userInfo) {
		DBConn dbConn = new DBConn();
		String sql = "insert into userinfo (u_account, u_mail, u_password, u_nick, u_sex, u_addr, u_img) values(?, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		result = dbConn.execOther(sql, new Object[] { userInfo.getU_mail(),
				userInfo.getU_mail(), userInfo.getU_password(),
				userInfo.getU_nick(), userInfo.getU_sex(),
				userInfo.getU_addr(), userInfo.getU_img() });
		dbConn.closeConn();
		
		String strSQL = "select * from userinfo where u_account=?";
		ResultSet rs = dbConn.execQuery(strSQL, new Object[] { userInfo.getU_mail()});
		try {
			while (rs.next()) {
				userInfo.setU_id(rs.getInt(1));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result > 0 ? true : false;
	}
	


	// 通过用户昵称获取用户信息
	public UserInfo getInfoByAccount(String account) {
		DBConn dbConn = new DBConn();
		String sql = "select * from userinfo where u_account=?";
		ResultSet rs = dbConn.execQuery(sql, new Object[] { account });
		UserInfo userInfo = new UserInfo();
		try {
			while (rs.next()) {
				userInfo.setU_id(rs.getInt("u_id"));
				userInfo.setU_nick(rs.getString("u_nick"));
				userInfo.setU_img(rs.getString("u_img"));
				userInfo.setU_sex(rs.getString("u_sex"));
				userInfo.setU_name(rs.getString("u_name"));
				userInfo.setU_addr(rs.getString("u_addr"));
				userInfo.setU_mail(rs.getString("u_mail"));
				userInfo.setU_qq(rs.getString("u_qq"));
				userInfo.setU_msn(rs.getString("u_msn"));
				userInfo.setU_sign(rs.getString("u_sign"));
				userInfo.setU_url(rs.getString("u_url"));
				userInfo.setU_account(rs.getString("u_account"));
			}
			return userInfo;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
