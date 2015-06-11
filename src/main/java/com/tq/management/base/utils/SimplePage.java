/*
 * 文 件 名:  SimplePage.java
 * 创 建 人:  tangqian
 * 创建时间:  2014-3-19
 */
package com.tq.management.base.utils;

/**
 * <简单分页类>
 */
public class SimplePage {

	/** 每页显示的记录数，默认是20 */
	private int numPerPage = 20;

	/** 总页数 */
	private int totalPage;

	/** 总记录数 */
	private int totalCount = 0;

	/** 当前页 */
	private int currentPage = 1;

	/**
	 * <默认构造器>
	 */
	public SimplePage() {
	}

	/**
	 * <根据每页显示记录数及当前页创建实例>
	 */
	public SimplePage(int numPerPage, int pageNum) {
		if (numPerPage > 0)
			this.numPerPage = numPerPage;
		if (pageNum > 1)
			this.currentPage = pageNum;
	}

	/**
	 * <根据总记录数和每页显示记录数及当前页创建实例并初始化>
	 */
	public SimplePage(int totalCount, int numPerPage, int pageNum) {
		if (totalCount > 0)
			this.totalCount = totalCount;
		if (numPerPage > 0)
			this.numPerPage = numPerPage;
		if (pageNum > 1)
			this.currentPage = pageNum;
		updateTotalPage();
	}

	public void setNumPerPage(int numPerPage) {
		if (numPerPage > 0)
			this.numPerPage = numPerPage;
		updateTotalPage();
	}

	public void setTotalCount(int totalCount) {
		if (totalCount > 0)
			this.totalCount = totalCount;
		updateTotalPage();
	}

	public void setCurrentPage(int currentPage) {
		if (currentPage > 1) {
			if (totalPage > 0 && currentPage > totalPage)
				this.currentPage = totalPage;
			else
				this.currentPage = currentPage;
		}
	}

	/**
	 * <更新总页数>
	 *
	 */
	private void updateTotalPage() {
		this.totalPage = totalCount % numPerPage == 0 ? totalCount / numPerPage : (totalCount / numPerPage) + 1;
		if (this.totalPage > 0 && this.currentPage > this.totalPage)
			this.currentPage = this.totalPage;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * <获取总页数>
	 * 
	 * @return
	 */
	public int getTotalPage() {
		return totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

}
