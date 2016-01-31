/*
 * Copyright(c) 2015 tangqian.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.tangqian.com.cn/
 */
package com.tq.management.base.system.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tq.management.base.controller.BaseController;
import com.tq.management.base.dto.JsonCallDto;
import com.tq.management.base.system.entity.Menu;
import com.tq.management.base.system.service.MenuService;
import com.tq.management.base.utils.StatusEnum;
import com.tq.management.base.utils.WebDto;


/**
 * @version 1.0
 * @author tangqian
 */
@Controller
@RequestMapping(value = "/menu")
public class MenuController extends BaseController {

	private static final String LIST = "system/menu/menu_list";

	private static final String ADD = "system/menu/menu_add";

	private static final String EDIT = "system/menu/menu_edit";

	private static final String VIEW = "system/menu/menu_view";
	
	private static final String TREE = "system/menu/menu_tree";

	@Resource
	private MenuService menuService;

	/**
	 * 列表页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/list")
	public ModelAndView index() {
		return new ModelAndView(LIST);
	}
	
	@RequestMapping(value = "/tree")
	public ModelAndView tree() {
		ModelAndView mv = new ModelAndView(TREE);
		mv.addObject("menus", menuService.getOneLevel());
		return mv;
	}

	@RequestMapping()
	@ResponseBody
	public Map<String, Object> list() {
		WebDto dto = new WebDto(getRequest());
		return menuService.list(dto);
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
	public JsonCallDto doAdd(Menu menu) {
		menuService.add(menu);
		return new JsonCallDto(1);
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
		Menu menu = menuService.get(id);
		mv.addObject("entity", menu);
		return mv;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public JsonCallDto doEdit(Menu menu) {
		menuService.update(menu);
		return new JsonCallDto(1);
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
		Menu menu = menuService.get(id);
		menu.setStatus(StatusEnum.readable(menu.getStatus()));
		mv.addObject("entity", menu);
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
	public JsonCallDto delete(@RequestParam(required = true) Integer id) {
		menuService.delete(id);
		return new JsonCallDto(1);
	}
	
	@RequestMapping(value = "/sort", method = RequestMethod.POST)
	@ResponseBody
	public JsonCallDto sort(@RequestParam(value = "ids[]", required = true) Integer ids[]) {
		menuService.sort(ids);
		return new JsonCallDto(1);
	}

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
	@ResponseBody
	public JsonCallDto batchDelete(
			@RequestParam(required = true) String ids) {
		JsonCallDto dto = new JsonCallDto();
		boolean result = menuService.batchDelete(ids);
		if (result) {
			dto.setStatus(1);
		} else {
			dto.setMsg("参数为空或者参数值不符合规定");
		}
		return dto;
	}
	
	
}
