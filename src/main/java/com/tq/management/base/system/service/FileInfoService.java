package com.tq.management.base.system.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.tq.management.base.entity.FileInfo;
import com.tq.management.base.enums.FileEnums;

/**
 * @version 1.0
 * @author tangqian
 */
public interface FileInfoService {

	public FileInfo add(MultipartFile file, FileEnums.TypeEnum typeEnum, FileEnums.TempEnum tempEnum);
	
	public String getAbsolutePath(String relativePath);

	public FileInfo get(Integer id);
	
	/**
	 * 下载文件
	 * @throws IOException 
	 */
	public void download(String path, String fileName, HttpServletRequest request, HttpServletResponse response) throws IOException;
	
	/**
	 * 获取文件信息(当物理文件存在时)
	 * @param id　记录id
	 * @return
	 */
	public FileInfo getInfoOnExsit(Integer id);

}
