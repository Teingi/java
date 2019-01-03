package com.codecore.entity;

/**
 * 关系实体类
 * 
 * @author Vincent
 * 
 */
public class Friends {
	private Integer f_id;
	private Integer f_uid;
	private Integer f_gid;
	private Integer f_state;

	public Friends() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Friends(Integer fId, Integer fUid, Integer fGid, Integer fState) {
		super();
		f_id = fId;
		f_uid = fUid;
		f_gid = fGid;
		f_state = fState;
	}

	public Integer getF_id() {
		return f_id;
	}

	public void setF_id(Integer fId) {
		f_id = fId;
	}

	public Integer getF_uid() {
		return f_uid;
	}

	public void setF_uid(Integer fUid) {
		f_uid = fUid;
	}

	public Integer getF_gid() {
		return f_gid;
	}

	public void setF_gid(Integer fGid) {
		f_gid = fGid;
	}

	public Integer getF_state() {
		return f_state;
	}

	public void setF_state(Integer fState) {
		f_state = fState;
	}

}
