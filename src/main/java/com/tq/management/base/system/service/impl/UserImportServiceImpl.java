/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.tq.management.base.entity.ImportLog;
import com.tq.management.base.enums.ImportTypeEnum;
import com.tq.management.base.system.mapper.ImportLogMapper;
import com.tq.management.base.system.service.UserImportService;
import com.tq.management.base.utils.CrudUtils;
import com.tq.management.base.utils.DataTables;
import com.tq.management.base.utils.WebDto;

/**
 * @version 1.0
 * @author tangqian
 */
@Service
public class UserImportServiceImpl implements UserImportService {

	@Resource
	private ImportLogMapper mapper;
	
	private static final String TEMPLATE_NAME = "D:/sys_user.xls";

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
	public void downloadTemplate(HttpServletRequest request, HttpServletResponse response) throws Exception{
		WritableWorkbook writeBook = Workbook.createWorkbook(new File(TEMPLATE_NAME));  
  
        // 2、新建工作表(sheet)对象，并声明其属于第几页  
        WritableSheet firstSheet = writeBook.createSheet("第一个工作簿", 1);// 第一个参数为工作簿的名称，第二个参数为页数  
        WritableSheet secondSheet = writeBook.createSheet("第二个工作簿", 0);  
  
        // 3、创建单元格(Label)对象，  
        Label label1 = new Label(1, 2, "test1");// 第一个参数指定单元格的列数、第二个参数指定单元格的行数，第三个指定写的字符串内容  
        firstSheet.addCell(label1);  
        Label label2 = new Label(1, 2, "test2");  
        secondSheet.addCell(label2);  
        // 4、打开流，开始写文件  
        writeBook.write();  
        // 5、关闭流  
        writeBook.close();    
	}
}
