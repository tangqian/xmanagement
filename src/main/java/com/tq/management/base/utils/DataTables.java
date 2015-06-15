/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.utils;

import java.util.List;
import java.util.Map;

/**
 * @version 1.0
 * @author tangqian
 */
public abstract class DataTables {
	
	/**
	 * 映射分页数据到相应key上,以支持插件Data Tables显示数据
	 * @param map 容器类,存储将返回给页面的key-value对
	 * @param dto 包含table页重绘所需要的draw值
	 * @param recordsTotal 全部数据
	 * @param recordsFiltered 过滤后的总数据
	 * @param pageData 当前页具体数据
	 */
	public static void map(Map<String, Object> map, WebDto dto, Integer recordsTotal, Integer recordsFiltered, List<?> pageData) {
		map.put("draw", dto.get("draw"));
		map.put("recordsTotal", 10);
		map.put("recordsFiltered", 10);
		map.put("data", pageData);
	}
}
