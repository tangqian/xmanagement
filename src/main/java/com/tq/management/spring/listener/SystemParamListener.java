/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.spring.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.tq.management.base.utils.file.DataTemplate;
import com.tq.management.spring.utils.SystemParamUtil;

/**
 * @version 1.0
 * @author tangqian
 */
public class SystemParamListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
		SystemParamUtil.setWebRoot(event.getServletContext().getRealPath("/"));
		DataTemplate.init();
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
	}
}