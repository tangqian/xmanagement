/*
 * Copyright(c) 2015 tangqian.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.tangqian.com.cn/
 */
package com.tq.management.base.system.service.impl;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.tq.management.base.system.entity.Menu;
import com.tq.management.base.system.mapper.MenuMapper;
import com.tq.management.base.system.service.MenuService;
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
public class MenuServiceImpl implements MenuService {

	@Resource
	private MenuMapper mapper;

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> list(WebDto dto) {
		String search = dto.getString("keyword");
		if (StringUtils.isNotBlank(search)) {
			dto.put("keyword", "%" + search + "%");
		}
		Integer totalNum = mapper.count(dto);

		List<Menu> lists;
		if (totalNum > 0) {
			lists = mapper.getPages(dto);
			for (Menu menu : lists) {
				menu.setStatus(StatusEnum.readable(menu.getStatus()));
			}
		} else {
			lists = Collections.EMPTY_LIST;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		DataTables.map(map, dto, totalNum, totalNum, lists);
		return map;
	}

	@Override
	public void add(Menu menu) {
		CrudUtils.beforeAdd(menu);
		mapper.insert(menu);
	}

	@Override
	public void delete(Integer id) {
		Menu menu = new Menu();
		menu.setId(id);
		CrudUtils.beforeUpdate(menu);
		mapper.delete(menu);
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
	public Menu get(Integer id) {
		return mapper.get(id);

	}

	@Override
	public void update(Menu menu) {
		CrudUtils.beforeUpdate(menu);
		mapper.update(menu);
	}

	@Override
	public List<Menu> getOneLevel() {
		return mapper.getOneLevel();
	}

	@Override
	public List<Menu> getTwoLevel(Integer parentId) {
		return mapper.getTwoLevel(parentId);
	}

	@Override
	public void sort(Integer[] idArr) {
		for (int i = 0; i < idArr.length; i++) {
			Integer id = idArr[i];
			mapper.updateSort(id, i);
		}
	}
}
