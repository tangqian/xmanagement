package com.tq.management.base.dto;

public class JsonCallDto {

	/**
	 * json调用结果状态 1 成功, 500 系统错误
	 */
	private int status;

	/**
	 * 调用结果信息
	 */
	private String msg;

	private Object data;

	public JsonCallDto() {
		super();
	}
	
	public JsonCallDto(int status) {
		this(status, null, null);
	}

	public JsonCallDto(int status, String msg) {
		this(status, msg, null);
	}

	public JsonCallDto(int status, String msg, Object data) {
		this.status = status;
		this.msg = msg;
		this.data = data;
	}
	
	public void setAll(ServiceCallDto<?> dto) {
		this.status = dto.isSuccess() ? 1 : 0;
		this.msg = dto.getMsg();
		this.data = dto.getData();
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
