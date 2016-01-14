/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.alibaba.druid.support.json.JSONUtils;
import com.tq.management.base.dto.JsonCallDto;

/**
 * @version 1.0
 * @author tangqian
 */
public class ViewExceptionHandler extends SimpleMappingExceptionResolver {
	
	private static Logger logger = LoggerFactory.getLogger(ViewExceptionHandler.class);
	
	@Override
	protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception ex) {
		System.out.println("resolver ...");
		String viewName = determineViewName(ex, request);
		if (viewName != null) {// JSP格式返回
			if (!(request.getHeader("accept").indexOf("application/json") > -1 || (request.getHeader("X-Requested-With") != null && request
					.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) {
				// 如果不是异步请求
				// Apply HTTP status code for error views, if specified.
				// Only apply it if we're processing a top-level request.
				Integer statusCode = determineStatusCode(request, viewName);
				if (statusCode != null) {
					applyStatusCodeIfPossible(request, response, statusCode);
				}
				return getModelAndView(viewName, ex, request);
			} else {// JSON格式返回
				try {
					PrintWriter writer = response.getWriter();
					JsonCallDto dto = new JsonCallDto(0, ex.getMessage());
					writer.write(JSONUtils.toJSONString(dto));
					writer.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				return null;
			}
		} else {
			if (!(request.getHeader("accept").indexOf("application/json") > -1 || (request.getHeader("X-Requested-With") != null && request
					.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) {
				System.out.println("not ajax");
				logger.error("view exception", ex);
				return new ModelAndView("system/frame/500_independ");
			}else {
				System.out.println("ajax");
				logger.error("view exception", ex);
				if(request.getHeader("Accept").toLowerCase().startsWith("application/json")){
					try {
						PrintWriter writer = response.getWriter();
						JsonCallDto dto = new JsonCallDto(500, ex.getMessage());
						writer.write(JSONUtils.toJSONString(dto));
						writer.flush();
					} catch (IOException e) {
						e.printStackTrace();
					}
					return null;
				}else
					return new ModelAndView("system/frame/500");
				/*try {
					PrintWriter writer = response.getWriter();
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("status", 0);
					map.put("msg", ex.toString());
					writer.write(JSONUtils.toJSONString(map));
					writer.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				return null;*/
			}
		}
	}
}
