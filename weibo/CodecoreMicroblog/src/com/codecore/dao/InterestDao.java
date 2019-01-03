package com.codecore.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.codecore.dbutil.DBConn;
import com.codecore.entity.UserInfo;
/**
 * 获取感兴趣的人的用户信息
 * @author Vincent
 *
 */
public class InterestDao {
	
	//根据用户id获取感兴趣人的信息
	public List<UserInfo> getInterestByUid(final int uid){
		List<UserInfo> interestlist = new ArrayList<UserInfo>();
		String strSQL = "SELECT * FROM userinfo where u_id!=? and u_id not in" +
				" (select f_gid from friends where f_state=1 and f_uid=?) and u_id not in " +
				"(select f_gid from friends where f_state=2 and f_uid=?) and u_id not in " +
				"(select f_uid from friends where f_state=2 and f_gid=?)";
		DBConn dbConn = new DBConn();
		ResultSet rs = dbConn.execQuery(strSQL, new Object[]{uid,uid, uid, uid});
		try {
			while(rs.next()) {
				UserInfo interest = new UserInfo();
				interest.setU_addr(rs.getString("u_addr"));
				interest.setU_nick(rs.getString("u_nick"));
				interest.setU_img(rs.getString("u_img"));
				interest.setU_date(rs.getString("u_date"));
				interestlist.add(interest);
			}
		   	return interestlist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			dbConn.closeConn();
		}
	}
}
