package com.tq.management.base.system.service;

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

}
