package com.codecore.dao;

import java.sql.ResultSet;

import com.codecore.dbutil.DBConn;
import com.codecore.entity.UserInfo;

/**
 * 用户资料修改
 * 
 * @author Vincent
 * 
 */
public class UserDao {
	// 获取用户信息
	public UserInfo getUserInfoById(final int u_id) {
		String strSQL = "select * from userinfo where u_id = ?";
		DBConn dbConn = new DBConn();
		ResultSet rs = dbConn.execQuery(strSQL, new Object[] { u_id });
		UserInfo userInfo = new UserInfo();
		try {
			while (rs.next()) {
				userInfo.setU_id(rs.getInt(1));
				userInfo.setU_nick(rs.getString(4));
				userInfo.setU_img(rs.getString(5));
				userInfo.setU_sex(rs.getString(6));
				userInfo.setU_name(rs.getString(7));
				userInfo.setU_date(rs.getString(8));
				userInfo.setU_addr(rs.getString(9));
				userInfo.setU_mail(rs.getString(10));
				userInfo.setU_qq(rs.getString(11));
				userInfo.setU_msn(rs.getString(12));
				userInfo.setU_sign(rs.getString(13));
				userInfo.setU_question(rs.getString(15));
			}
			return userInfo;
		} catch (Exception e) {
			return null;
		} finally {
			dbConn.closeConn();
		}
	}

	// 保存用户修改完的资料
	public boolean updateUserInfo(final UserInfo userInfo, final int u_id) {
		String u_date = userInfo.getU_date();
		String u_mail = userInfo.getU_mail();
		String u_nick = userInfo.getU_nick();
		String u_name = userInfo.getU_name();
		String u_sex = userInfo.getU_sex();
		String u_addr = userInfo.getU_addr();
		String u_qq = userInfo.getU_qq();
		String u_msn = userInfo.getU_msn();
		String u_sign = userInfo.getU_sign();
		String updateSql = "update userinfo set u_nick=?,u_sex=?,u_name=?,u_date=?,u_addr=?,u_qq=?,u_msn=?,u_sign=?where u_id = ?";
		DBConn dbConn = new DBConn();
		int flag = dbConn.execOther(updateSql,
				new Object[] { u_nick, u_sex, u_name, u_date, u_addr, u_qq, u_msn, u_sign, u_id });
		return flag > 0 ? true : false;
	}

	// 保存用户修改的密码
	public boolean updatePassword(final UserInfo userInfo, final int u_id) {

		String u_password = userInfo.getU_password();
		String updateSql = "update userinfo set u_password=? where u_id = ?";
		DBConn dbConn = new DBConn();
		int flag = dbConn.execOther(updateSql, new Object[] { u_password, u_id });
		return flag > 0 ? true : false;
	}

	// 保存用户头像
	public void updateImg(final UserInfo userInfo) {
		String filetodb = userInfo.getU_img();
		String strSQL = "update userinfo set u_img=? where u_id=?";
		DBConn dbConn = new DBConn();
		dbConn.execOther(strSQL, new Object[] { filetodb, userInfo.getU_id() });
		dbConn.closeConn();
	}

	// 用户修改密码时先检查原密码是否正确
	public boolean checkPassword(final String password, final int u_id) {
		String strSQL = "select count(*) from userinfo where u_password = ? and u_id=?";
		DBConn dbConn = new DBConn();
		ResultSet rs = dbConn.execQuery(strSQL, new Object[] { password, u_id });
		try {
			rs.next();
			return rs.getInt(1) > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			dbConn.closeConn();
		}
	}

	// 帮助用户找回丢失的密码
	public UserInfo findPassword(final String u_mail, final String u_question) {
		UserInfo userInfo = null;
		try {
			String strSQL = "select * from userinfo where u_mail=? and u_question=?";
			DBConn dbConn = new DBConn();
			ResultSet rs = dbConn.execQuery(strSQL, new Object[] { u_mail, u_question });
			while (rs.next()) {
				userInfo = new UserInfo();
				userInfo.setU_id(rs.getInt(1));
				userInfo.setU_account(rs.getString(2));
				userInfo.setU_password(rs.getString(3));
				userInfo.setU_mail(rs.getString(10));
			}
			return userInfo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
