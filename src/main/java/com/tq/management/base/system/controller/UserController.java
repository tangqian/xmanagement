/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tq.management.base.controller.BaseController;
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
		return mv;
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list() {
		WebDto dto = new WebDto(getRequest());
		return userService.list(dto);
	}

	@RequestMapping(value = "/add")
	public ModelAndView add() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/user/user_add");
		return mv;
	}

}
