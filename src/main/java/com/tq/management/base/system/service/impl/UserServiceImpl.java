/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.service.impl;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.tq.management.base.system.entity.User;
import com.tq.management.base.system.mapper.UserMapper;
import com.tq.management.base.system.service.UserService;
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
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper mapper;

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> list(WebDto dto) {
		String search = dto.getString("keyword");
		if (StringUtils.isNotBlank(search)) {
			dto.put("keyword", "%" + search + "%");
		}
		Integer totalNum = mapper.count(dto);

		List<User> lists;
		if (totalNum > 0) {
			lists = mapper.getPages(dto);
			for (User user : lists) {
				user.setStatus(StatusEnum.readable(user.getStatus()));
			}
		} else {
			lists = Collections.EMPTY_LIST;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		DataTables.map(map, dto, totalNum, totalNum, lists);
		return map;
	}

	@Override
	public void add(User user) {
		CrudUtils.beforeAdd(user);
		mapper.insert(user);
	}

	@Override
	public void delete(Integer id) {
		User user = new User();
		user.setId(id);
		CrudUtils.beforeUpdate(user);
		mapper.delete(user);
	}

	@Override
	public boolean batchDelete(String ids) {
		boolean success = false;
		if (StringUtils.isNotBlank(ids) && PatternEnum.IDS.isValid(ids)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ids", ids);
			CrudUtils.beforeUpdate(map);
			mapper.batchDelete(map);
			success = true;
		}
		return success;
	}

	@Override
	public User get(Integer id) {
		return mapper.get(id);

	}

	@Override
	public void update(User user) {
		CrudUtils.beforeUpdate(user);
		mapper.update(user);
	}
}
