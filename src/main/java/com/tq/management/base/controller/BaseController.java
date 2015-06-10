/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tq.management.base.system.entity.User;
import com.tq.management.base.system.service.UserService;

/**
 * @version 1.0
 * @author tangqian
 */
@Controller
@RequestMapping(value = "/base")
public class BaseController {
	
	@Resource
	private UserService service;
	
	@RequestMapping
	public ModelAndView page(){
		ModelAndView mv = new ModelAndView("system/test");
		mv.addObject("path", "d2222");
		User user = service.getUser(1);
		System.out.println(user);
		return mv;
	}

}
