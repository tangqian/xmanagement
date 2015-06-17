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

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.tq.management.base.system.entity.User;
import com.tq.management.base.utils.DataTables;
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
		Integer totalNum = template.selectOne("UserMapper.count", dto);
		List<User> lists = template.selectList("UserMapper.list", dto);
		DataTables.map(map, dto, totalNum, totalNum, lists);
		return map;
	}
	
	public void add(WebDto dto) {
		template.insert("UserMapper.add", dto);
		if(true){
			throw new NullPointerException();
		}
	}

	public User get(Integer id) {
		if(true){
			throw new NullPointerException();
		}
		return template.selectOne("UserMapper.get", id);

	}
}
