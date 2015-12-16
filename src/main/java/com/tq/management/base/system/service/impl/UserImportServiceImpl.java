/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public void downloadTemplate(HttpServletRequest request, HttpServletResponse response){
		InputStream inputStream = null;
		ServletOutputStream out;
		try {  
			inputStream = DataTemplate.getUserTemplate();
			response.reset();
			response.setContentType("multipart/form-data");
			response.addHeader("Content-Disposition", "attachment;filename=111.xls");
            out = response.getOutputStream();
            int len;
            byte[] buffer = new byte[1024];
            while ((len = inputStream.read(buffer)) > 0)
                out.write(buffer,0,len);
            inputStream.close();
            out.close();
            out.flush();
        } catch (IOException e) {
        	if(inputStream != null){
        		try {
					inputStream.close();
				} catch (IOException e1) {
				}
        	}
        	logger.error("用户导入模板下载发生异常!", e);
        }
	}
}
