/*
 * Copyright(c) 2015 gvtv.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.gvtv.com.cn/
 */
package com.tq.management.base.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tq.management.base.dto.JsonCallDto;
import com.tq.management.base.entity.FileInfo;
import com.tq.management.base.system.service.FileInfoService;

/**
 * @version 1.0
 * @author tangqian
 */
@Controller
@RequestMapping(value = "/file")
public class FileController extends BaseController {

	@Resource
	private FileInfoService fileInfoService;

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void download(@RequestParam(required = true) String path,
			@RequestParam(required = true) String responseContent, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// fileInfoService.download(id, request, response);
		fileInfoService.download(path, responseContent, request, response);
	}

	@RequestMapping(value = "/auth", method = RequestMethod.GET)
	@ResponseBody
	public JsonCallDto check(@RequestParam(required = true) Integer id, HttpServletRequest request,
			HttpServletResponse response) {
		FileInfo info = fileInfoService.getInfoOnExsit(id);
		JsonCallDto dto = new JsonCallDto();
		if (info != null) {
			dto.setStatus(1);
			Map<String, String> map = new HashMap<String, String>();
			String encodeStr = null;
			try {
				encodeStr = java.net.URLEncoder.encode(info.getOriginalName(), "utf-8");
			} catch (UnsupportedEncodingException e) {
				logger.error("下载文件时文件名编码失败, 文件名={}", info.getOriginalName());
				encodeStr = info.getOriginalName();
			}
			map.put("responseContent", encodeStr);
			map.put("path", info.getSavePath());
			dto.setData(map);
		} else {
			dto.setMsg("文件不存在！");
		}
		return dto;
	}

}
