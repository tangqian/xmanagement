/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.tq.management.base.system.entity.User;
import com.tq.management.base.utils.CrudUtils;
import com.tq.management.base.utils.DataTables;
import com.tq.management.base.utils.PatternEnum;
import com.tq.management.base.utils.StatusEnum;
import com.tq.management.base.utils.WebDto;

/**
 * @version 1.0
 * @author tangqian
 */
@Service
public class UserService {

	@Resource
	private SqlSessionTemplate template;

	public Map<String, Object> list(WebDto dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		String search = dto.getString("search[value]");
		if (StringUtils.isNotBlank(search)) {
			dto.put("searchValue", "%" + search + "%");
		}
		Integer totalNum = template.selectOne("UserMapper.count", dto);
		List<User> lists = template.selectList("UserMapper.list", dto);
		for (User user : lists) {
			user.setStatus(StatusEnum.readableInfo(user.getStatus()));
		}
		DataTables.map(map, dto, totalNum, totalNum, lists);
		return map;
	}

	public void add(WebDto dto) {
		String loginName = dto.getString("loginName").toLowerCase();
		dto.put("loginName", loginName);// 登录名统一转换成小写
		String password = dto.getString("password");
		password = new SimpleHash("SHA-1", loginName, password).toString();
		dto.put("password", password);
		dto.put("status", StatusEnum.VALID.getCode());
		dto.put("skin", 1);
		CrudUtils.beforeAdd(dto);
		template.insert("UserMapper.add", dto);
	}

	public void delete(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		CrudUtils.beforeUpdate(map);
		template.delete("UserMapper.delete", map);
	}

	public boolean batchDelete(String ids) {
		boolean success = false;
		if (StringUtils.isNotBlank(ids) && PatternEnum.IDS.isValid(ids)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ids", ids);
			CrudUtils.beforeUpdate(map);
			template.delete("UserMapper.batchDelete", map);
			success = true;
		}
		return success;
	}

	public User get(Integer id) {
		return template.selectOne("UserMapper.get", id);

	}

	public void update(WebDto dto) {
		CrudUtils.beforeUpdate(dto);
		template.update("UserMapper.update", dto);
	}
}
