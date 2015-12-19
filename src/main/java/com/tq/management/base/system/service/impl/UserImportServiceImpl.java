/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.service.impl;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.tq.management.base.entity.ImportLog;
import com.tq.management.base.enums.ImportTypeEnum;
import com.tq.management.base.system.mapper.ImportLogMapper;
import com.tq.management.base.system.service.UserImportService;
import com.tq.management.base.utils.CrudUtils;
import com.tq.management.base.utils.DataTables;
import com.tq.management.base.utils.WebDto;
import com.tq.management.base.utils.file.DataTemplate;

/**
 * @version 1.0
 * @author tangqian
 */
@Service
public class UserImportServiceImpl implements UserImportService {

	private static Logger logger = LoggerFactory.getLogger(UserImportServiceImpl.class);

	@Resource
	private ImportLogMapper mapper;

	private static String TPL_IE;

	private static String TPL_FIREFOX;

	static {
		TPL_IE = "attachment; filename=";
		try {
			TPL_IE += java.net.URLEncoder.encode("用户导入模板.xls", "UTF-8");
		} catch (UnsupportedEncodingException e) {
		}

		TPL_FIREFOX = "attachment; filename=";
		try {
			TPL_FIREFOX += new String("用户导入模板.xls".getBytes("UTF-8"), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> list(WebDto dto) {
		String search = dto.getString("keyword");
		if (StringUtils.isNotBlank(search)) {
			dto.put("keyword", "%" + search + "%");
		}
		dto.put("type", ImportTypeEnum.SYS_USER.getCode());
		Integer totalNum = mapper.count(dto);

		List<ImportLog> lists;
		if (totalNum > 0) {
			lists = mapper.getPages(dto);
		} else {
			lists = Collections.EMPTY_LIST;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		DataTables.map(map, dto, totalNum, totalNum, lists);
		return map;
	}

	@Override
	public void add(ImportLog log) {
		CrudUtils.beforeAdd(log);
		mapper.insert(log);
	}

	@Override
	public ImportLog get(Integer id) {
		return mapper.get(id);

	}

	@Override
	public void downloadTemplate(HttpServletRequest request, HttpServletResponse response) {
		try {
			File template = DataTemplate.getUserTemplate();
			response.reset();
			response.setContentType("multipart/form-data");
			if (isMSIE(request)) {
				response.addHeader("Content-Disposition", TPL_IE);
			} else {
				response.addHeader("Content-Disposition", TPL_FIREFOX);
			}
			response.addHeader("Content-Length", "" + template.length());
			FileUtils.copyFile(template, response.getOutputStream());
		} catch (IOException e) {//发生异常表明下载失败,在统计下载次数时千万不能加1
			logger.error("用户导入模板下载发生异常!");
		} finally {
			//System.out.println("下载流已经完成");
		}
	}

	private boolean isMSIE(HttpServletRequest request) {
		String agent = request.getHeader("User-Agent");
		boolean isMSIE = (agent.contains("MSIE")  || agent.contains("Trident"));
		return isMSIE;
	}
}
