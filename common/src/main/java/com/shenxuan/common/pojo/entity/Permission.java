package com.shenxuan.common.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 权限类
 * @author monkey
 * @date 2016年6月16日 下午5:42:08
 */
public class Permission implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -1280458113249914971L;

	private Integer id;

    private String permiName;

    private Integer permiType;

    private String url;

    private Integer parentId;

    private Integer sort;

    private Integer permiLevel;

    private Integer dataStatus;

    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date createTime;
    
    private String description;

    private String cssClass;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPermiName() {
        return permiName;
    }

    public void setPermiName(String permiName) {
        this.permiName = permiName == null ? null : permiName.trim();
    }

    public Integer getPermiType() {
        return permiType;
    }

    public void setPermiType(Integer permiType) {
        this.permiType = permiType;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getPermiLevel() {
        return permiLevel;
    }

    public void setPermiLevel(Integer permiLevel) {
        this.permiLevel = permiLevel;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}