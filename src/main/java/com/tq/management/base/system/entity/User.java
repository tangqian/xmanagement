package com.tq.management.base.system.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.apache.shiro.crypto.hash.SimpleHash;

import com.alibaba.fastjson.annotation.JSONField;
import com.tq.management.base.entity.SuperEntity;
import com.tq.management.base.utils.WebDto;

/**
 * @version 1.0
 * @author tangqian
 */
public class User extends SuperEntity implements Serializable {

	public User() {

	}

	public User(WebDto dto) {
		Optional<String> optional = Optional.ofNullable(dto.getString("loginName"));
		optional.ifPresent((s) -> this.loginName = s.toLowerCase());// 登录名统一转换成小写
		if (dto.getString("password") != null)
			this.password = new SimpleHash("SHA-1", loginName, dto.getString("password"))
					.toString();
		this.name = dto.getString("name");
		this.email = dto.getString("email");
		this.description = dto.getString("description");
		this.phone = dto.getString("phone");
		this.skin = 1;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Timestamp lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getSkin() {
		return skin;
	}

	public void setSkin(Integer skin) {
		this.skin = skin;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<Role> roles;

	private String loginName; // 用户名

	private String password; // 密码

	private String name; // 姓名

	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Timestamp lastLogin; // 最后登录时间

	private String ip; // 用户登录ip地址

	private String description; // 用户登录ip地址

	private String email; // 用户登录ip地址

	private String phone; // 用户登录ip地址

	private Integer skin; // 皮肤

	/**
	 * 实体对象赋初始值
	 */
	public void addInit() {
		if (name == null)
			name = "";
		if (email == null)
			email = "";
		if (phone == null)
			phone = "";
		if (skin == null)
			skin = 1;
		if (description == null)
			description = "";
	}

}
