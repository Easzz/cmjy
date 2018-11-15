package com.shenxuan.common.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Business {
    private Integer id;

    private String businessName;

    private Integer industryId;

    private String businessAddr;

    private String certPicUrl;
    
    private String legalPerson;

    private String legalPersonIdNo;
    
    private Integer citySubstationId;
    

    public String getLegalPerson() {
		return legalPerson;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	public String getLegalPersonIdNo() {
		return legalPersonIdNo;
	}

	public void setLegalPersonIdNo(String legalPersonIdNo) {
		this.legalPersonIdNo = legalPersonIdNo;
	}

	private Integer substationId;

    private Integer dataStatus;

	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName == null ? null : businessName.trim();
    }

    public Integer getIndustryId() {
        return industryId;
    }

    public void setIndustryId(Integer industryId) {
        this.industryId = industryId;
    }

    public String getCertPicUrl() {
        return certPicUrl;
    }

    public void setCertPicUrl(String certPicUrl) {
        this.certPicUrl = certPicUrl == null ? null : certPicUrl.trim();
    }

    public Integer getSubstationId() {
        return substationId;
    }

    public void setSubstationId(Integer substationId) {
        this.substationId = substationId;
    }

    public Integer getDataStatus() {
        return dataStatus;
    }

    public void setDataStatus(Integer dataStatus) {
        this.dataStatus = dataStatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

	public String getBusinessAddr() {
		return businessAddr;
	}

	public void setBusinessAddr(String businessAddr) {
		this.businessAddr = businessAddr;
	}

	public Integer getCitySubstationId() {
		return citySubstationId;
	}

	public void setCitySubstationId(Integer citySubstationId) {
		this.citySubstationId = citySubstationId;
	}
}