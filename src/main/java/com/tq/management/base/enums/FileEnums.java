package com.tq.management.base.enums;

public class FileEnums {

	public enum TempEnum {
		NO(0, "否"), YES(1, "是");

		private Integer code;

		private String meaning;

		TempEnum(Integer code, String meaning) {
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
	}

	public enum TypeEnum {
		USER_EXCEL(1, "import", "通过EXCEL文件导入用户");

		private Integer code;

		private String classifyDir;

		private String meaning;

		/**
		 * <默认构造函数>
		 */
		TypeEnum(Integer code, String classifyDir, String meaning) {
			this.code = code;
			this.classifyDir = classifyDir;
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

		public String getClassifyDir() {
			return classifyDir;
		}

		/**
		 * 可理解的名称
		 * 
		 * @param code
		 * @return
		 */
		public static String readable(Integer code) {
			TypeEnum ret = null;
			for (TypeEnum e : TypeEnum.values()) {
				if (e.code.equals(code)) {
					ret = e;
					break;
				}
			}
			return ret == null ? "" : ret.meaning;
		}
	}
}
