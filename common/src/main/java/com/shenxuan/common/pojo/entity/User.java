package com.shenxuan.common.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.Date;

/**
 * 用户类
 * @author monkey
 * @date 2016年6月12日 上午11:56:21
 */
public class User {
    private Integer id;

    private String username;

    private String realName;

    @JsonIgnore
    private String password;

    @JsonIgnore
    private String salt;

    private Integer deptId;

    private Integer posiId;
    
    private Integer roleId;
   private String mobilePhone;
   private String certIdNum;

   private Integer citySubstationId;
   private Integer substationId;

    public Integer getCitySubstationId() {
        return citySubstationId;
    }

    public void setCitySubstationId(Integer citySubstationId) {
        this.citySubstationId = citySubstationId;
    }

    public Integer getSubstationId() {
        return substationId;
    }

    public void setSubstationId(Integer substationId) {
        this.substationId = substationId;
    }

    public String getCertIdNum() {
        return certIdNum;
    }

    public void setCertIdNum(String certIdNum) {
        this.certIdNum = certIdNum;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public Integer getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	private Integer businessId;

    private Integer dataStatus;

    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date createTime;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt == null ? null : salt.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getPosiId() {
        return posiId;
    }

    public void setPosiId(Integer posiId) {
        this.posiId = posiId;
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

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}