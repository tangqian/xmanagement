/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.system.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.tq.management.base.dto.ServiceCallDto;
import com.tq.management.base.entity.FileInfo;
import com.tq.management.base.entity.ImportLog;
import com.tq.management.base.enums.ImportTypeEnum;
import com.tq.management.base.system.dto.UserImportDto;
import com.tq.management.base.system.entity.User;
import com.tq.management.base.system.mapper.ImportLogMapper;
import com.tq.management.base.system.mapper.UserMapper;
import com.tq.management.base.system.service.FileInfoService;
import com.tq.management.base.system.service.UserImportService;
import com.tq.management.base.utils.CrudUtils;
import com.tq.management.base.utils.DataTables;
import com.tq.management.base.utils.DateUtils;
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

	@Resource
	private UserMapper userMapper;

	@Resource
	private FileInfoService fileInfoService;

	private static String TPL_IE;

	private static String TPL_FIREFOX;

	private static final String DEFAULT_PWD = "123456";

	private static final String EXTENSION_XLS = "xls";

	private static final String EXTENSION_XLSX = "xlsx";

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

	/**
	 * 取单元格的值
	 * 
	 * @param cell
	 *            单元格对象
	 * @param treatAsStr
	 *            为true时，当做文本来取值 (取到的是文本，不会把“1”取成“1.0”)
	 * @return
	 */
	private String getValue(Cell cell, boolean treatAsStr) {
		if (cell == null)
			return null;

		if (treatAsStr) {
			// 虽然excel中设置的都是文本，但是数字文本还被读错，如“1”取成“1.0”
			// 加上下面这句，临时把它当做文本来读取
			cell.setCellType(Cell.CELL_TYPE_STRING);
		}

		String value = null;
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_STRING:
			value = cell.getStringCellValue();
			break;
		case Cell.CELL_TYPE_NUMERIC:
			if (DateUtil.isCellDateFormatted(cell)) {
				value = cell.getDateCellValue().toString();
			} else {
				value = String.valueOf(cell.getNumericCellValue());
			}
			break;
		case Cell.CELL_TYPE_BOOLEAN:
			value = String.valueOf(cell.getBooleanCellValue());
			break;
		case Cell.CELL_TYPE_FORMULA:
			value = String.valueOf(cell.getCellFormula());
			break;
		default:
		}
		return value;
	}

	@Override
	public ServiceCallDto<List<UserImportDto>> fileImport(FileInfo fileInfo) {
		InputStream is = null;
		OutputStream out = null;
		Workbook wb = null;
		ServiceCallDto<List<UserImportDto>> result = new ServiceCallDto<List<UserImportDto>>();
		try {
			String filePath = fileInfoService.getAbsolutePath(fileInfo.getSavePath());
	        is = new FileInputStream(filePath);
	        if (filePath.endsWith(EXTENSION_XLS)) {
	            wb = new HSSFWorkbook(is);
	        } else if (filePath.endsWith(EXTENSION_XLSX)) {
	            wb = new XSSFWorkbook(is);
	        }
	        
	        List<UserImportDto> imports = parseData(wb);
	        if(imports.isEmpty()){
	        	result.setMsg("未检测到数据,请检查文件");
	        }else{
				ImportLog log = new ImportLog();
				log.setTotalNum(imports.size());
				int successNum = 0;
				
				for (UserImportDto temp : imports) {
					try {
						process(temp.getUser());
						userMapper.insert(temp.getUser());
						temp.setSuccess();
						successNum++;
					} catch (Exception e) {
						logger.error("导入用户失败!", e);
						temp.setFailure();
						temp.setReason(e.getMessage());
					}
					setResultToCell(wb, temp);
				}
				
				log.setSuccessNum(successNum);
				log.setFileId(fileInfo.getId());
				log.setName("导入用户[" + DateUtils.formatDate(new Date()) + "]");
				log.setType(ImportTypeEnum.SYS_USER.getCode());
				CrudUtils.beforeAdd(log);
				mapper.insert(log);
				result.setSuccess();
				result.setData(imports);
				
				try{
					out = new FileOutputStream(filePath);
				    wb.write(out);
				}catch (Exception e){
					logger.error("保存导入结果到excel中失败!", e);
				}
	        }
		} catch (FileNotFoundException e) {
			logger.error("导入文件未找到", e);
			result.setMsg("导入文件未找到");
		} catch (Exception e) {
			logger.error("文件格式不对,或者IO异常", e);
			result.setMsg("文件格式不对,或者IO异常");
		} finally {
			if(wb != null){
				try {
					wb.close();
				} catch (Exception e) {
				}
			}
			IOUtils.closeQuietly(is);
			IOUtils.closeQuietly(out);
		}
		return result;
	}

	private void setResultToCell(Workbook wb, UserImportDto dto) {
		Row row = wb.getSheetAt(0).getRow(dto.getRowNum());
		Cell cell = row.getCell(4);
		if (cell == null)
			cell = row.createCell(4);
		cell.setCellType(Cell.CELL_TYPE_STRING);
		if (dto.isSuccess())
			cell.setCellValue("成功");
		else
			cell.setCellValue("失败：" + dto.getReason());
	}

	private List<UserImportDto> parseData(Workbook rwb) {
		Sheet sheet = rwb.getSheetAt(0);
		int rows = sheet.getPhysicalNumberOfRows();// 获取工作表中的总行数

		List<UserImportDto> importList = new ArrayList<UserImportDto>();
		for (int i = 1; i < rows; i++) {
			Row row = sheet.getRow(i);
			if (row != null) {
				User user = new User();
				int columns = row.getLastCellNum();
				for (int j = 0; j < columns; j++) {
					setAttr(user, j, getValue(row.getCell(j), true));
				}
				UserImportDto dto = new UserImportDto(user);
				dto.setRowNum(i);
				importList.add(dto);
			}
		}
		return importList;
	}

	private void setAttr(User user, int index, String value) {
		switch (index) {
		case 0:
			user.setLoginName(value);
			break;
		case 1:
			user.setName(value);
			break;
		case 2:
			user.setEmail(value);
			break;
		case 3:
			user.setPhone(value);
			break;
		default:
			break;
		}
	}

	private void process(User user) {
		user.setLoginName(user.getLoginName().toLowerCase());// 登录名统一转换成小写
		user.setPassword(new SimpleHash("SHA-1", user.getLoginName(), DEFAULT_PWD).toString());
		user.init();
		CrudUtils.beforeAdd(user);
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
		} catch (IOException e) {// 发生异常表明下载失败,在统计下载次数时千万不能加1
			logger.error("用户导入模板下载发生异常!");
		} finally {
			// System.out.println("下载流已经完成");
		}
	}

	private boolean isMSIE(HttpServletRequest request) {
		String agent = request.getHeader("User-Agent");
		boolean isMSIE = (agent.contains("MSIE") || agent.contains("Trident"));
		return isMSIE;
	}
}
