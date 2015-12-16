/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tq.management.base.controller.BaseController;
import com.tq.management.base.system.service.UserImportService;
import com.tq.management.base.utils.WebDto;

/**
 * @version 1.0
 * @author tangqian
 */
@Controller
@RequestMapping(value = "/user/import")
public class UserImportController extends BaseController {
	
	private static final String LIST = "system/user/import/import_list";
	
	@Resource
	private UserImportService userImportService;
	
	@RequestMapping(value = "/list")
	public ModelAndView index() {
		return new ModelAndView(LIST);
	}
	
	@RequestMapping()
	@ResponseBody
	public Map<String, Object> list() {
		WebDto dto = new WebDto(getRequest());
		return userImportService.list(dto);
	}

	@RequestMapping(value = "/download/template", method = RequestMethod.GET)
	public void download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		userImportService.downloadTemplate(request, response);
	}

}
