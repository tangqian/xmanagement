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

	private static final String LIST = "system/user/user_list";

	private static final String ADD = "system/user/user_add";

	private static final String EDIT = "system/user/user_edit";

	private static final String VIEW = "system/user/user_view";

	@Resource
	private UserService userService;

	/**
	 * 列表页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/list")
	public ModelAndView index() {
		return new ModelAndView(LIST);
	}

	@RequestMapping()
	@ResponseBody
	public Map<String, Object> list() {
		WebDto dto = new WebDto(getRequest());
		return userService.list(dto);
	}

	/**
	 * 新增页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView add() {
		return new ModelAndView(ADD);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> doAdd(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		user.setLoginName(user.getLoginName().toLowerCase());// 登录名统一转换成小写
		// Optional<String> optional = Optional.ofNullable(user.getLoginName());
		// optional.ifPresent((s) ->
		// user.setLoginName(user.getLoginName().toLowerCase()));// 登录名统一转换成小写
		user.setPassword(new SimpleHash("SHA-1", user.getLoginName(), user
				.getPassword()).toString());
		user.setSkin(1);
		userService.add(user);
		map.put("status", 1);
		return map;
	}

	/**
	 * 编辑页
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam(required = true) Integer id) {
		ModelAndView mv = new ModelAndView(EDIT);
		User user = userService.get(id);
		mv.addObject("entity", user);
		return mv;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> doEdit(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		String password = user.getPassword();
		if (StringUtils.isNotBlank(password)) {
			User oldUser = userService.get(user.getId());
			user.setPassword(new SimpleHash("SHA-1", oldUser.getLoginName(),
					password).toString());
		} else {
			user.setPassword(null);
		}
		userService.update(user);
		map.put("status", 1);
		return map;
	}

	/**
	 * 查看页
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam(required = true) Integer id) {
		ModelAndView mv = new ModelAndView(VIEW);
		User user = userService.get(id);
		mv.addObject("entity", user);
		return mv;
	}

	/**
	 * 单个删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(@RequestParam(required = true) Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		userService.delete(id);
		map.put("status", 1);
		return map;
	}

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> batchDelete(
			@RequestParam(required = true) String ids) {
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
