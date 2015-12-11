package com.tq.management.base.enums;


public enum ImportTypeEnum {

	SYS_USER(1, "用户导入"), SYS_ORGANIZE(2, "机构导入");

	private Integer code;

	private String meaning;

	/**
	 * <默认构造函数>
	 */
	ImportTypeEnum(Integer code, String meaning) {
		this.code = code;
		this.meaning = meaning;
	}

	/**
	 * @return 返回 code
	 */
	public Integer getCode() {
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
	public static String readable(Integer code) {
		ImportTypeEnum ret = null;
		for (ImportTypeEnum e : ImportTypeEnum.values()) {
			if (e.code.equals(code)) {
				ret = e;
				break;
			}
		}
		return ret == null ? "" : ret.meaning;
	}
}
