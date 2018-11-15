package com.shenxuan.common.pojo.entity;

/**
 * 分页扩展类
 * 
 * @author monkey
 * @date 2016年6月3日 上午10:46:04
 */
public class PageQuery {
	
	public static final PageQuery ALL = new PageQuery(1, Integer.MAX_VALUE);
	
	public PageQuery(int pageIndex, int pageSize) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;

		this.pageStart = (pageIndex - 1) * pageSize;
	}

	// 当前页
	private int pageIndex;

	// 页大小
	private int pageSize;

	// 页开始值
	private int pageStart;

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	
	public static PageQuery of(int pageIndex, int pageSize) {
		return new PageQuery(pageIndex, pageSize);
	} 
}
