package com.shenxuan.common.pojo.addition;

import com.shenxuan.common.pojo.entity.Business;

public class BusinessCustom extends Business {
	
	private String industryName;	//所属行业
	
	private String substationName;	//所属分局
	
	private String citySubstationName;//所属市局

	public String getIndustryName() {
		return industryName;
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	public String getSubstationName() {
		return substationName;
	}

	public void setSubstationName(String substationName) {
		this.substationName = substationName;
	}

	public String getCitySubstationName() {
		return citySubstationName;
	}

	public void setCitySubstationName(String citySubstationName) {
		this.citySubstationName = citySubstationName;
	}

}
