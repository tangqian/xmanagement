/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @version 1.0
 * @author tangqian
 */
public enum PatternEnum {
	
	IDS(Pattern.compile("(\\d+,)*\\d+"));

	private Pattern pattern;

	PatternEnum(Pattern pattern) {
		this.pattern = pattern;
	}
	
	public boolean isValid(String ids){
		Matcher matcher = pattern.matcher(ids);   
		return matcher.matches();
	}
	
	public static void main(String[] args) {
		System.out.println(PatternEnum.IDS.isValid("1,23"));
	}
}
