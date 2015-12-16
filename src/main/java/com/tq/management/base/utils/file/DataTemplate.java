package com.tq.management.base.utils.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

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
		boolean result = (folder.exists() && folder.isDirectory()) ? true
				: folder.mkdirs();
		if (!result) {
			logger.error("数据模板目录生成失败!请检查路径 {}", new Object[] { fullPath });
		} else {
			DOWNLOAD_ABSOLUTE_PATE = fullPath;
			createUserTemplate();
		}
		return result;
	}

	private static File createUserTemplate() {
		File file = new File(DOWNLOAD_ABSOLUTE_PATE + USER_TEMPLATE_FILE_NAME);
		try {
			WritableWorkbook writeBook = Workbook.createWorkbook(file);
			WritableSheet sheet1 = writeBook.createSheet("Sheet1", 0);// 第一个参数为工作簿的名称，第二个参数为页数

			String[] header = new String[] { "用户名", "姓名", "邮箱", "电话" };
			String[] row1 = new String[] { "zhangsan", "张三",
					"zhangsan@163.com", "15812124848" };
			for (int i = 0; i < header.length; i++) {
				sheet1.setColumnView(i, 30);// 设置列宽
				// 创建单元格(Label)对象，第一个参数指定单元格的列数、第二个参数指定单元格的行数，第三个指定写的字符串内容
				Label label = new Label(i, 0, header[i]);
				sheet1.addCell(label);
			}
			for (int i = 0; i < row1.length; i++) {
				Label label = new Label(i, 1, row1[i]);
				sheet1.addCell(label);
			}
			writeBook.write();
			writeBook.close();
		} catch (Exception e) {
			logger.error("创建用户导入模板失败,异常为：" + e);
		}
		return file;
	}

	public static InputStream getUserTemplate() throws IOException{
		File file = new File(DOWNLOAD_ABSOLUTE_PATE + USER_TEMPLATE_FILE_NAME);
		if (!file.exists()) {
			file = createUserTemplate();
		}
		return new FileInputStream(file);
	}

}
