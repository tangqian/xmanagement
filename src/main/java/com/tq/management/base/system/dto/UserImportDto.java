package com.tq.management.base.system.dto;

import com.alibaba.fastjson.annotation.JSONField;
import com.tq.management.base.system.entity.User;

public class UserImportDto {

	@JSONField(serialize = false)
	private User user;

	private boolean success;

	private String reason;

	private int rowNum;
	
	private String loginName;
	
	public UserImportDto() {
	}
	
	public UserImportDto(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isSuccess() {
		return success;
	}
	
	public void setFailure() {
		this.success = false;
	}

	public void setSuccess() {
		this.success = true;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public String getLoginName() {
		return user != null ? user.getLoginName() : loginName;
	}

}
