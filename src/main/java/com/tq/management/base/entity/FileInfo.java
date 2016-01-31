package com.tq.management.base.entity;

public class FileInfo extends SuperEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public Long getSize() {
		return size;
	}

	public void setSize(Long size) {
		this.size = size;
	}

	public String getMd5() {
		return md5;
	}

	public void setMd5(String md5) {
		this.md5 = md5;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public Integer getTemp() {
		return temp;
	}

	public void setTemp(Integer temp) {
		this.temp = temp;
	}

	public FileInfo() {

	}

	public FileInfo(String savePath, String originalName, String ext, Long size,
			String contentType, String md5, Integer type, Integer temp) {
		this.savePath = savePath;
		this.originalName = originalName;
		this.ext = ext;
		this.size = size;
		this.contentType = contentType;
		this.md5 = md5;
		this.type = type;
		this.temp = temp;
	}

	private String savePath;

	private String originalName;

	private String ext;

	private Long size;

	private String md5;

	private String contentType;

	private Integer temp;

	private Integer type;

	@Override
	public void addInit() {
		
	}

}
