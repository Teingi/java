package com.codecore.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.codecore.dbutil.DBConn;
import com.codecore.entity.UserInfo;
/**
 * 
 * @author Vincent
 *	获取关注对象的信息
 */
public class FollowingDao {
	
	//当前用户所关注人的信息
	public List<UserInfo> getFollowingByUid(final int uid , int pageSize, int pageNo){
		List<UserInfo> followinglist = new ArrayList<UserInfo>();
		String strSQL = "select * from userinfo where u_id =any " +
				"(select f_gid from friends where f_uid= " +
				"(select u_id from userinfo where u_id=?)) " +
				"or u_id =any (select f_uid from friends where f_state=2 and " +
				"(f_gid= any (select u_id from userinfo where u_id=?))) limit ?, ?";
		//数据库连接
		DBConn dbConn = new DBConn();
		ResultSet rs = dbConn.execQuery(strSQL, new Object[]{uid, uid,pageSize*(pageNo-1), pageSize});
		try {
			//返回结果集
			while(rs.next()) {
				UserInfo following = new UserInfo();
				following.setU_id(rs.getInt("u_id"));
				following.setU_addr(rs.getString("u_addr"));
				following.setU_nick(rs.getString("u_nick"));
				following.setU_img(rs.getString("u_img"));
				followinglist.add(following);
			}
			return followinglist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			dbConn.closeConn();
		}
		
	}
	

}
