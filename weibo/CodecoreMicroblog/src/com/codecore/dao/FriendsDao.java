package com.codecore.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.codecore.dbutil.DBConn;
import com.codecore.entity.UserInfo;
/**
 * 
 * @author Vincent
 *	获取好友信息
 */
public class FriendsDao {
	
	//根据当前用户id获取其好友信息，并进行分页
	public List<UserInfo> getFriendsByUid(final int uid, int pageSize, int pageNo){
		List<UserInfo> friendlist = new ArrayList<UserInfo>();
		String strSQL = "select * from userinfo where u_id =any " +
				"(select f_gid from friends where f_state=2 and (f_uid= any " +
				"(select u_id from userinfo where u_id=?))) or u_id =any " +
				"(select f_uid from friends where f_state=2 and (f_gid= any " +
				"(select u_id from userinfo where u_id=?))) limit ?, ?";
		DBConn dbConn = new DBConn();
		ResultSet rs = dbConn.execQuery(strSQL, new Object[]{uid, uid, pageSize*(pageNo-1), pageSize});
		try {
		
			while(rs.next()) {
				UserInfo friends = new UserInfo();
				friends.setU_addr(rs.getString("u_addr"));
				friends.setU_nick(rs.getString("u_nick"));
				friends.setU_img(rs.getString("u_img"));
				friends.setU_id(rs.getInt("u_id"));
				friendlist.add(friends);
			}
			return friendlist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			dbConn.closeConn();
		}
	}

	//统计当前用户好友数量
	public int accountFriends(final int id){
		DBConn dbConn=new DBConn();
		String sql="select count(*) from friends where (f_uid=? and f_state=2) or (f_gid=? and f_state=2)";
		ResultSet rs=dbConn.execQuery(sql, new Object[]{id, id});
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
}
