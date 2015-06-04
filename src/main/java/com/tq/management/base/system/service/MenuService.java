/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.tq.management.base.system.entity.Menu;

/**
 * @version 1.0
 * @author tangqian
 */
@Service
public class MenuService {

	@Resource
	private JdbcTemplate jdbcTemplate;

	public List<Menu> getList() {
		String sql = "select * from sys_menu ";
		List<Menu> list = jdbcTemplate.query(sql, new RowMapper<Menu>() {

			@Override
			public Menu mapRow(ResultSet rs, int rowNum) throws SQLException {
				Menu menu = new Menu();
				menu.setId(rs.getInt("id"));
				menu.setMenuName(rs.getString("menu_name"));
				return menu;
			}

		});

		return list;
	}

}
