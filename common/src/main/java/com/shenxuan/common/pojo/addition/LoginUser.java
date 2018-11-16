package com.shenxuan.common.pojo.addition;

import com.shenxuan.common.pojo.entity.MenuTree;
import com.shenxuan.common.pojo.entity.Permission;

import java.io.Serializable;
import java.util.List;

/**
 * 登录用户封装类
 * @author monkey
 * @date 2016年6月8日 下午2:48:38
 */
public class LoginUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4492482069814587226L;

	private int userId;//用户id
	private String username;//用户名
	private String realName;//真实姓名
	private Integer deptId;//部门id
    private Integer posiId;//岗位id
    private Integer roleId;//角色id
    private String roleName;//角色名称
    private Integer businessId;//企业id
	private Integer frontEmployeeId; //微信前端用户id
	private Integer citySubstationId;//市局用户id
	private Integer substationId; //分局用户id


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

	public Integer getFrontEmployeeId() {
		return frontEmployeeId;
	}

	public void setFrontEmployeeId(Integer frontEmployeeId) {
		this.frontEmployeeId = frontEmployeeId;
	}

	private String mobilePhone;
	private String certIdNum;

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

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

    private List<MenuTree> menus;//菜单
    private List<Permission> permissions;//权限

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
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

	public List<MenuTree> getMenus() {
		return menus;
	}

	public void setMenus(List<MenuTree> menus) {
		this.menus = menus;
	}

	public List<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

}
