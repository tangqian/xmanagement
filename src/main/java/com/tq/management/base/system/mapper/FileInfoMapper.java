package com.tq.management.base.system.mapper;

import com.tq.management.base.entity.FileInfo;

public interface FileInfoMapper {
	
	public void insert(FileInfo file);

	public FileInfo get(int id);

}
