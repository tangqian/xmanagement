/*
 * Copyright(c) 2015 tangqian.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.tangqian.com.cn/
 */
package com.tq.management.base.system.service;

import java.util.Map;

import com.tq.management.base.system.entity.User;
import com.tq.management.base.utils.WebDto;

/**
 * @version 1.0
 * @author tangqian
 */
public interface UserService {

	public Map<String, Object> list(WebDto dto);

	public void add(User user);

	public User get(Integer id);

	public void update(User user);

	public void delete(Integer id);

	public boolean batchDelete(String ids);

}
