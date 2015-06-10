/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.tq.management.base.system.entity.User;

/**
 * @version 1.0
 * @author tangqian
 */
@Service
public class UserService {

	@Resource
	private SqlSessionTemplate template;
	
	public User getUser(Integer userId){
		return template.selectOne("UserMapper.getUserInfo", userId);
				
	}
}
