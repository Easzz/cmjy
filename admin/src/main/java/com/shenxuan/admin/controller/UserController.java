package com.shenxuan.admin.controller;

import com.shenxuan.common.pojo.entity.PageQuery;
import com.shenxuan.common.pojo.entity.Role;
import com.shenxuan.common.pojo.entity.RoleQuery;
import com.shenxuan.common.service.IBusinessService;
import com.shenxuan.common.service.IRoleService;
import com.shenxuan.common.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
	

	//列表页面
	@RequestMapping("/userList")
	public String userList(Model model)throws Exception{
		RoleQuery roleQuery = new RoleQuery();
		roleQuery.setPageQuery(new PageQuery(1, Integer.MAX_VALUE));
		List<Role> roles = roleService.selectList(roleQuery);
		model.addAttribute("roles", roles);
		
		return "user/userList";
	}


}
