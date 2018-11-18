package com.shenxuan.common.pojo.addition;

import com.shenxuan.common.pojo.entity.Business;
import com.shenxuan.common.pojo.entity.PageQuery;

public class BusinessQuery {

	private Business business;
	
	private PageQuery pageQuery;

	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public PageQuery getPageQuery() {
		return pageQuery;
	}

	public void setPageQuery(PageQuery pageQuery) {
		this.pageQuery = pageQuery;
	}
	
}
