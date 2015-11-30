/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.utils;

import java.sql.Timestamp;
import java.util.Map;

import com.tq.management.base.entity.SuperEntity;

/**
 * 增删改查操作工具类
 * 
 * @version 1.0
 * @author tangqian
 * 
 */
public abstract class CrudUtils {

	public static void beforeAdd(SuperEntity entity) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		entity.setStatus(StatusEnum.VALID.getCode());
		entity.setCreateTime(timestamp);
		entity.setModifyTime(timestamp);
		entity.setModifier(1);
		entity.setCreator(1);
	}

	public static void beforeUpdate(SuperEntity entity) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		entity.setModifyTime(timestamp);
		entity.setModifier(2);
	}

	public static void beforeUpdate(Map<String, Object> dto) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		dto.put("modifyTime", timestamp);
		dto.put("modifier", 2);
	}
}
