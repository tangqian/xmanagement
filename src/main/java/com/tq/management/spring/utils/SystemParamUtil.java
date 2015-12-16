package com.tq.management.spring.utils;

public abstract class SystemParamUtil {

	private static final String WEB_ROOT_KEY = "webapp.root";
	
	private static boolean ROOT_INITED = false;

	public static void setWebRoot(String root) {
		if (!ROOT_INITED){
			System.setProperty(WEB_ROOT_KEY, root);
			ROOT_INITED = true;
		}
	}

	public static String getWebRoot() {
		return System.getProperty(WEB_ROOT_KEY);
	}
}
