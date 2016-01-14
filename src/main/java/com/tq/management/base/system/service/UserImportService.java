/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tq.management.base.dto.ServiceCallDto;
import com.tq.management.base.entity.FileInfo;
import com.tq.management.base.entity.ImportLog;
import com.tq.management.base.system.dto.UserImportDto;
import com.tq.management.base.utils.WebDto;

/**
 * @version 1.0
 * @author tangqian
 */
public interface UserImportService {

	public Map<String, Object> list(WebDto dto);

	public void add(ImportLog log);
	
	public ServiceCallDto<List<UserImportDto>> fileImport(FileInfo fileInfo);

	public ImportLog get(Integer id);
	
	/**
	 * 下载用户导入模板
	 */
	public void downloadTemplate(HttpServletRequest request, HttpServletResponse response);

}
