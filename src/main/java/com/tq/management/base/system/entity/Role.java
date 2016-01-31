/*
 * Copyright(c) 2015 tangqian.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.tangqian.com.cn/
 */
package com.tq.management.base.system.entity;

import java.util.List;

/**
 * @version 1.0
 * @author tangqian
 */
public class Role implements java.io.Serializable {

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getRemovable() {
		return removable;
	}

	public void setRemovable(Integer removable) {
		this.removable = removable;
	}

	public Integer getAllocatable() {
		return allocatable;
	}

	public void setAllocatable(Integer allocatable) {
		this.allocatable = allocatable;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	public List<Authority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<Menu> menus;
	private List<Authority> authorities;

	private Integer id;
	private String roleName;
	private Integer removable;
	private Integer allocatable;
	private String description;
	private Integer status;

}
