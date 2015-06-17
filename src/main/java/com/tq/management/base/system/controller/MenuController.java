/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tq.management.base.controller.BaseController;
import com.tq.management.base.system.entity.Menu;
import com.tq.management.base.system.entity.User;
import com.tq.management.base.system.service.MenuService;
import com.tq.management.base.system.service.UserService;
import com.tq.management.base.utils.WebDto;


/**
 * @version 1.0
 * @author tangqian
 */
@Controller
@RequestMapping(value = "/menu")
public class MenuController extends BaseController {
	
	private static Logger logger = LoggerFactory.getLogger(MenuController.class);

	@Resource
	private MenuService menuService;
	
	@Resource
	private UserService userService;
	
	@RequestMapping
	public ModelAndView menu(){
		List<Menu> list = menuService.getList();
		logger.info("" + list.size());
		User user = userService.get(1);
		System.out.println(user);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/menu/menu_list");
		return mv;
	}
	
	@RequestMapping(value="/add")
	public ModelAndView add(){
		WebDto dto = new WebDto(getRequest());
		System.out.println(dto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/menu/menu_add");
		return mv;
	}
	
	
}
