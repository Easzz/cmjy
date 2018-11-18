package com.shenxuan.admin.controller;

import com.shenxuan.common.constans.MyConfig;
import com.shenxuan.common.pojo.addition.*;
import com.shenxuan.common.pojo.entity.PageQuery;
import com.shenxuan.common.pojo.entity.Role;
import com.shenxuan.common.pojo.entity.RoleQuery;
import com.shenxuan.common.pojo.entity.User;
import com.shenxuan.common.service.IBusinessService;
import com.shenxuan.common.service.IRoleService;
import com.shenxuan.common.service.IUserService;
import com.shenxuan.common.utils.Md5Util;
import com.shenxuan.common.utils.Util;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户-控制器
 * @author sunmeng
 * @date 2016年6月17日 上午9:27:35
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService roleService;

	@Autowired
	private IBusinessService businessService;



	//用户搜索建议数据
	@RequestMapping("/userSuggestListData")
	@ResponseBody
	public Object userSuggestListData(UserQuery userQuery) throws Exception{
		PageQuery pageQuery=new PageQuery(1, Integer.MAX_VALUE);
		userQuery.setPageQuery(pageQuery);

		//查询数据
		List<UserCustom> users = userService.selectList(userQuery);
		Map<String,Object> map = new HashMap<>();
		map.put("value", users);
		return map;
	}

	//列表页面
	@RequestMapping("/userList")
	public String userList(Model model)throws Exception{
		RoleQuery roleQuery = new RoleQuery();
		roleQuery.setPageQuery(new PageQuery(1, Integer.MAX_VALUE));
		List<Role> roles = roleService.selectList(roleQuery);
		model.addAttribute("roles", roles);

		return "user/userList";
	}


	//列表数据
	@RequestMapping("/userListData")
	@ResponseBody
	public Object userListData(UserQuery userQuery, int pageNumber, int pageSize) throws Exception{
		PageQuery pageQuery=new PageQuery(pageNumber, pageSize);
		userQuery.setPageQuery(pageQuery);

		//查询数据
		List<UserCustom> users = userService.selectList(userQuery);
		int count = userService.selectListCount(userQuery);

		DataGridResultInfo dataGridResultInfo=new DataGridResultInfo();
		dataGridResultInfo.setRows(users);
		dataGridResultInfo.setTotal(count);

		return dataGridResultInfo;
	}


	//新增页面
	@RequestMapping(value="/userAdd",method=RequestMethod.GET)
	public String userAdd(Model model)throws Exception{

		//查询角色列表
		PageQuery pageQuery_role = new PageQuery(1, Integer.MAX_VALUE);
		RoleQuery roleQuery = new RoleQuery();
		roleQuery.setPageQuery(pageQuery_role);
		Role role = new Role();
		role.setDataStatus(MyConfig.DATA_STATUS_YES);
		roleQuery.setRole(role);
		List<Role> roles = roleService.selectList(roleQuery);
		model.addAttribute("roles", roles);

		//查询企业列表
		BusinessQuery businessQuery=new BusinessQuery();
		PageQuery pageQuery = new PageQuery(1, Integer.MAX_VALUE);
		businessQuery.setPageQuery(pageQuery);
		List<BusinessCustom> business = businessService.selectList(businessQuery);
		model.addAttribute("business", business);
		return "user/userAdd";
	}

	//新增提交
	@RequestMapping(value="/userAdd",method=RequestMethod.POST)
	@ResponseBody
	public SubmitResultInfo userAdd(User user)throws Exception{
		if(user.getRoleId()==10){
			user.setCitySubstationId(null);
		}
		if(user.getRoleId()==9){
			user.setSubstationId(null);
		}
		userService.insert(user);
		return ResultUtil.getSuccessSubmitResult();
	}

	//修改页面
	@RequestMapping(value="/userEdit",method=RequestMethod.GET)
	public String userEdit(Integer id,Model model)throws Exception{
		//根据id查询查实体
		User user = userService.selectByPrimaryKey(id);
		model.addAttribute("user", user);
		//查询角色列表
		PageQuery pageQuery_role = new PageQuery(1, Integer.MAX_VALUE);
		RoleQuery roleQuery = new RoleQuery();
		roleQuery.setPageQuery(pageQuery_role);
		Role role = new Role();
		role.setDataStatus(MyConfig.DATA_STATUS_YES);
		roleQuery.setRole(role);
		List<Role> roles = roleService.selectList(roleQuery);
		model.addAttribute("roles", roles);

		//查询企业列表
		BusinessQuery businessQuery=new BusinessQuery();
		PageQuery pageQuery = new PageQuery(1, Integer.MAX_VALUE);
		businessQuery.setPageQuery(pageQuery);
		List<BusinessCustom> business = businessService.selectList(businessQuery);
		model.addAttribute("business", business);
		return "user/userEdit";
	}

	//修改提交
	@RequestMapping(value="/userEdit",method=RequestMethod.POST)
	@ResponseBody
	public SubmitResultInfo userEdit(User user)throws Exception{
		if (StringUtils.isNotBlank(user.getPassword())) {
			String salt = Util.randomNubmer4();
			user.setSalt(salt);
			user.setPassword(Md5Util.md5Hex(user.getPassword()+salt));
		} else {
			user.setPassword(null);
		}
		if(user.getRoleId()==10){
			user.setCitySubstationId(null);
		}
		if(user.getRoleId()==9){
			user.setSubstationId(null);
		}
		return ResultUtil.getSuccessSubmitResult();
	}


	//重置密码
	@RequestMapping(value="/userResetPassword")
	@ResponseBody
	public SubmitResultInfo userResetPassword(Integer id) throws Exception{
		User user = userService.selectByPrimaryKey(id);
		//默认密码+用户原来的salt
		String password = Md5Util.md5Hex(MyConfig.INIT_PASSWORD+user.getSalt());
		user.setPassword(password);
		userService.update(user);
		return ResultUtil.getSuccessSubmitResult();
	}

}
