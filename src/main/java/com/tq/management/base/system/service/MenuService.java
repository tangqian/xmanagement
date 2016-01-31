/*
 * Copyright(c) 2015 tangqian.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.tangqian.com.cn/
 */
package com.tq.management.base.system.service;

import java.util.List;
import java.util.Map;

import com.tq.management.base.system.entity.Menu;
import com.tq.management.base.utils.WebDto;

/**
 * @version 1.0
 * @author tangqian
 */
public interface MenuService {

	public Map<String, Object> list(WebDto dto);

	public void add(Menu menu);

	public Menu get(Integer id);

	public void update(Menu menu);
	
	public List<Menu> getOneLevel();
	
	public List<Menu> getTwoLevel(Integer parentId);

	public void delete(Integer id);

	public boolean batchDelete(String ids);

	public void sort(Integer[] idArr);

}
