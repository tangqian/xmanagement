/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tq.management.base.controller.BaseController;
import com.tq.management.base.system.entity.User;
import com.tq.management.base.system.service.UserService;
import com.tq.management.base.utils.WebDto;

/**
 * @version 1.0
 * @author tangqian
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

	private static Logger logger = LoggerFactory.getLogger(UserController.class);

	@Resource
	private UserService userService;

	@RequestMapping
	public ModelAndView page() {
		ModelAndView mv = new ModelAndView();
		logger.info("ddddd");
		mv.setViewName("system/user/user_list");
		User user = userService.get(1);
		System.out.println(user);
		return mv;
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list() {
		WebDto dto = new WebDto(getRequest());
		return userService.list(dto);
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView add() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/user/user_add");
		return mv;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> doAdd() {
		Map<String, Object> map = new HashMap<String, Object>();
		WebDto dto = new WebDto(getRequest());
		String loginName = dto.getString("loginName");
		String password = dto.getString("password");
		password = new SimpleHash("SHA-1", loginName, password).toString();
		dto.put("password", password);
		dto.put("status", 1);
		userService.add(dto);
		map.put("status", 1);
		//map.put("msg", "新增用户成功！");
		return map;
	}

}
