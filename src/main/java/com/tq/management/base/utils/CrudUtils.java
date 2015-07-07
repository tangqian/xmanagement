/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.utils;

import java.sql.Timestamp;

/**
 * 增删改查操作工具类
 * @version 1.0
 * @author tangqian
 * 
 */
public abstract class CrudUtils {

	public static void beforeAdd(WebDto dto) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		dto.put("createTime", timestamp);
		dto.put("modifyTime", timestamp);
		dto.put("creator", 1);
		dto.put("modifier", 1);
	}
}
