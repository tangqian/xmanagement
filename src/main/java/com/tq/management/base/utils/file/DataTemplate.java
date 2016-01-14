package com.tq.management.base.utils.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tq.management.spring.utils.SystemParamUtil;

public abstract class DataTemplate {

	private static Logger logger = LoggerFactory.getLogger(DataTemplate.class);

	private static final String DOWNLOAD_TEMPLATE_PATH = "download/template/";

	private static final String USER_TEMPLATE_FILE_NAME = "sys_user.xls";

	private static String DOWNLOAD_ABSOLUTE_PATE = "";

	public static boolean init() {
		String fullPath = SystemParamUtil.getWebRoot() + DOWNLOAD_TEMPLATE_PATH;
		File folder = new File(fullPath);
		boolean result = (folder.exists() && folder.isDirectory()) ? true : folder.mkdirs();
		if (!result) {
			logger.error("数据模板目录生成失败!请检查路径 {}", new Object[] { fullPath });
		} else {
			DOWNLOAD_ABSOLUTE_PATE = fullPath;
			createUserTemplate();
		}
		return result;
	}

	private static String getUserFilename() {
		return DOWNLOAD_ABSOLUTE_PATE + USER_TEMPLATE_FILE_NAME;
	}

	private static File createUserTemplate() {
		File file = new File(getUserFilename());
		OutputStream os = null;
		try {
			HSSFWorkbook writeBook = new HSSFWorkbook();
			HSSFSheet sheet1 = writeBook.createSheet();
			String[] header = new String[] { "用户名", "姓名", "邮箱", "电话" };
			String[] rowArr1 = new String[] { "zhangsan", "张三", "zhangsan@163.com", "15812124848" };
			Row row = sheet1.createRow(0);
			for (int i = 0; i < header.length; i++) {
				Cell cell = row.createCell(i);
				cell.setCellValue(header[i]);
			}
			Row row1 = sheet1.createRow(1);
			for (int i = 0; i < rowArr1.length; i++) {
				Cell cell = row1.createCell(i);
				cell.setCellValue(rowArr1[i]);
			}
			writeBook.write(new FileOutputStream(file));
			writeBook.close();
		} catch (Exception e) {
			IOUtils.closeQuietly(os);
			logger.error("创建用户导入模板失败,异常为：" + e);
		}
		return file;
	}

	public static File getUserTemplate() throws IOException {
		File file = new File(getUserFilename());
		return file.exists() ? file : createUserTemplate();
	}

}
