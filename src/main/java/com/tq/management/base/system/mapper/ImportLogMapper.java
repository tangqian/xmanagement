package com.tq.management.base.system.mapper;

import java.util.List;
import java.util.Map;

import com.tq.management.base.entity.ImportLog;

public interface ImportLogMapper {
	
	public void insert(ImportLog log);

	public ImportLog get(int id);

	public int count(Map<String, Object> map);
     
    public List<ImportLog> getPages(Map<String, Object> map);  
}
