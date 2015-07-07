/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		mv.setViewName("system/user/user_list");
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
		userService.add(dto);
		map.put("status", 1);
		return map;
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam(required = true) Integer id){
		ModelAndView mv = new ModelAndView();
		User user = userService.get(id);
		mv.addObject("entity", user);
		mv.setViewName("system/user/user_edit");
		return mv;
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> doEdit(){
		Map<String, Object> map = new HashMap<String, Object>();
		WebDto dto = new WebDto(getRequest());
		String password = dto.getString("password");
		if (StringUtils.isNotBlank(password)) {
			User user = userService.get(dto.getInteger("id"));
			password = new SimpleHash("SHA-1", user.getLoginName(), password).toString();
			dto.put("password", password);
		}else{
			dto.remove("password");
		}
		userService.edit(dto);
		map.put("status", 1);
		return map;
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam(required = true) Integer id){
		ModelAndView mv = new ModelAndView();
		User user = userService.get(id);
		mv.addObject("entity", user);
		mv.setViewName("system/user/user_view");
		return mv;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(@RequestParam(required = true) Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		userService.delete(id);
		map.put("status", 1);
		return map;
	}

	@RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> batchDelete(@RequestParam(required = true) String ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean result = userService.batchDelete(ids);
		if (result) {
			map.put("status", 1);
		} else {
			map.put("status", 0);
			map.put("msg", "参数为空或者参数值不符合规定");
		}
		return map;
	}

}
