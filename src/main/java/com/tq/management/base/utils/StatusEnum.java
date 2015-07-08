/*
 * 文 件 名:  StatusEnum.java
 * 创 建 人:  tangqian
 * 创建时间:  2013-5-15
 */
package com.tq.management.base.utils;

/**
 * <数据状态枚举类>
 */
public enum StatusEnum {
	DELETE("delete", "删除"), INVALID("invalid", "停用"), VALID("valid", "正常");

	private String code;

	private String meaning;

	/**
	 * <默认构造函数>
	 */
	StatusEnum(String code, String meaning) {
		this.code = code;
		this.meaning = meaning;
	}

	/**
	 * @return 返回 code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @return 返回 meaning
	 */
	public String getMeaning() {
		return meaning;
	}

	/**
	 * 可理解的名称
	 * 
	 * @param code
	 * @return
	 */
	public static String readableInfo(String code) {
		StatusEnum ret = null;
		for (StatusEnum e : StatusEnum.values()) {
			if (e.code.equals(code)) {
				ret = e;
				break;
			}
		}
		return ret == null ? "" : ret.meaning;
	}

}
