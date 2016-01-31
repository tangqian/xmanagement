/*
 * Copyright(c) 2015 tangqian.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.tangqian.com.cn/
 */
package com.tq.management.base.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @version 1.0
 * @author tangqian
 */
public abstract class SuperEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public abstract void addInit();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Timestamp modifyTime) {
		this.modifyTime = modifyTime;
	}

	public Integer getCreator() {
		return creator;
	}

	public void setCreator(Integer creator) {
		this.creator = creator;
	}

	public Integer getModifier() {
		return modifier;
	}

	public void setModifier(Integer modifier) {
		this.modifier = modifier;
	}

	private Integer id; // 记录id

	private String status; // 状态

	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Timestamp createTime;

	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Timestamp modifyTime;

	private Integer creator;

	private Integer modifier;

}
