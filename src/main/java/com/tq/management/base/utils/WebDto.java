/*
 * Copyright(c) 2015 tangqian.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.tangqian.com.cn/
 */
package com.tq.management.base.utils;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

/**
 * @version 1.0
 * @author tangqian
 */
public class WebDto implements Map<String, Object> {

	private Map<String, Object> _map;

	public WebDto() {
		_map = new HashMap<String, Object>();
	}

	public WebDto(HttpServletRequest request) {
		_map = new HashMap<String, Object>();
		@SuppressWarnings("unchecked")
		Map<String, String[]> map = request.getParameterMap();
		Set<Entry<String, String[]>> set = map.entrySet();
		for (Entry<String, String[]> entry : set) {
			if (entry.getKey().equals("id"))
				_map.put(entry.getKey(), ArrayUtils.toInteger(entry.getValue()));
			else
				_map.put(entry.getKey(), ArrayUtils.toString(entry.getValue()));
		}
		_map.put("start", getInteger("start"));
		Integer length = getInteger("length");
		if(length != null && length == -1){
			length = Integer.MAX_VALUE;
		}
		_map.put("length", length);
	}

	public String getString(Object key) {
		Object obj = get(key);
		return obj == null ? null : obj.toString();
	}

	public Integer getInteger(String key) {
		Integer ret = null;
		Object obj = get(key);
		if (obj != null) {
			if (obj instanceof Integer) {
				ret = (Integer) obj;
			} else {
				try {
					ret = Integer.valueOf(obj.toString());
				} catch (NumberFormatException e) {
					ret = null;
				}

			}
		}
		return ret;
	}

	@Override
	public int size() {
		return _map.size();
	}

	@Override
	public boolean isEmpty() {
		return _map.isEmpty();
	}

	@Override
	public boolean containsKey(Object key) {
		return _map.containsKey(key);
	}

	@Override
	public boolean containsValue(Object value) {
		return _map.containsValue(value);
	}

	@Override
	public Object get(Object key) {
		return _map.get(key);
	}

	@Override
	public Object put(String key, Object value) {
		return _map.put(key, value);
	}

	@Override
	public Object remove(Object key) {
		return _map.remove(key);
	}

	@Override
	public void putAll(Map<? extends String, ? extends Object> m) {
		_map.putAll(m);
	}

	@Override
	public void clear() {
		_map.clear();
	}

	@Override
	public Set<String> keySet() {
		return _map.keySet();
	}

	@Override
	public Collection<Object> values() {
		return _map.values();
	}

	@Override
	public Set<java.util.Map.Entry<String, Object>> entrySet() {
		return _map.entrySet();
	}

}
