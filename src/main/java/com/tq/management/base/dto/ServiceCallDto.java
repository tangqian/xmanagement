package com.tq.management.base.dto;

/**
 * 
 * 服务调用结果传输类
 */
public class ServiceCallDto<T> {

	/**
	 * 调用是否成功
	 */
	private boolean isSuccess;
	
	/**
	 * 调用相关信息
	 */
	private String msg;
	
	/**
	 * 调用结果数据
	 */
	private T data;
	

	public boolean isSuccess() {
		return isSuccess;
	}
	
	public void setFailure(){
		isSuccess = false;
	}

	public void setSuccess() {
		this.isSuccess = true;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
