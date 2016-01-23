/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.tq.management.base.controller.BaseController;
import com.tq.management.base.dto.JsonCallDto;
import com.tq.management.base.dto.ServiceCallDto;
import com.tq.management.base.entity.FileInfo;
import com.tq.management.base.enums.FileEnums;
import com.tq.management.base.system.dto.UserImportDto;
import com.tq.management.base.system.service.FileInfoService;
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
	
	private static final String UPLOAD = "system/user/import/upload";

	@Resource
	private UserImportService userImportService;
	
	@Resource
	private FileInfoService fileInfoService;

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
	
	@RequestMapping(value="/upload", method = RequestMethod.GET)
	public ModelAndView upload(){
		return new ModelAndView(UPLOAD);
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void doUpload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletResponse response) throws IOException {
		JsonCallDto dto = new JsonCallDto();
		FileInfo fileInfo = fileInfoService.add(file, FileEnums.TypeEnum.USER_EXCEL, FileEnums.TempEnum.NO);
		
		if(fileInfo == null){
			dto.setMsg("文件上传失败!");
		}else{
			ServiceCallDto<List<UserImportDto>> result = userImportService.fileImport(fileInfo);
			dto.setAll(result);
		}
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(JSON.toJSONString(dto));
	}

	@RequestMapping(value = "/template", method = RequestMethod.GET)
	public void download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		userImportService.downloadTemplate(request, response);
	}

}
