/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @version 1.0
 * @author tangqian
 */
@Controller
public class LoginController {

	@RequestMapping(value="/index")
	public ModelAndView page(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("system/frame/index");
		return mv;
	}
}
