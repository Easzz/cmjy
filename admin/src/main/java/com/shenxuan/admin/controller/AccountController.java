package com.shenxuan.admin.controller;

import com.shenxuan.common.constans.MyConfig;
import com.shenxuan.common.pojo.addition.LoginUser;
import com.shenxuan.common.pojo.addition.UserCustom;
import com.shenxuan.common.service.IBusinessService;
import com.shenxuan.common.service.IPermissionService;
import com.shenxuan.common.service.IUserService;
import com.shenxuan.common.utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 登录控制器
 *
 * @author monkey
 * @date 2016年6月22日 上午10:03:19
 */
@Controller
public class AccountController {

	@Autowired
	private IUserService userService;

	@Autowired
	private IBusinessService businessService;

	@Autowired
	private IPermissionService permissionService;


	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}

	//登录提交
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String username, String password, String captcha, Model model,
						HttpServletRequest request, HttpSession session) throws Exception {

		request.setAttribute("username", username);//回显用户名

		//根据用户名查询用户
		UserCustom userCustom = userService.selectByUsername(username);

		if (userCustom != null) {
			String md5Password = Md5Util.md5Hex(password + userCustom.getSalt());
			if (md5Password.equalsIgnoreCase(userCustom.getPassword())) {

				//登录的用户用这个封装类
				LoginUser loginUser = new LoginUser();
				loginUser.setUserId(userCustom.getId());
				loginUser.setUsername(userCustom.getUsername());
				loginUser.setRealName(userCustom.getRealName());
				loginUser.setDeptId(userCustom.getDeptId());
				loginUser.setPosiId(userCustom.getPosiId());
				loginUser.setRoleId(userCustom.getRoleId());
				loginUser.setBusinessId(userCustom.getBusinessId());
				loginUser.setRoleName(userCustom.getRoleName());

				loginUser.setMobilePhone(userCustom.getMobilePhone());
				loginUser.setCertIdNum(userCustom.getCertIdNum());
				loginUser.setCitySubstationId(userCustom.getCitySubstationId());
				loginUser.setSubstationId(userCustom.getSubstationId());
				//用户菜单
				loginUser.setMenus(permissionService.selectMenusByUserId(userCustom.getId()));

				//用户权限
				loginUser.setPermissions(permissionService.findPermissionListByUserId(userCustom.getId()));

				//把登录用户保存到session中
				session.setAttribute(MyConfig.LOGINUSER_KEY, loginUser);
//				sessionProvider.setAttribute(request, MyConfig.LOGINUSER_KEY, loginUser);
				return "redirect:/index";
			}
		}
		request.setAttribute("msg", "用户名或密码错误！");
		return login(model);
	}

	//主界面
	@RequestMapping("/index")
	public String index(Model model, HttpSession session) {
		//登录后的默认欢迎页面
		String url = "/welcome";
		model.addAttribute("welcomeUrl", url);
		// 去主界面，拦截器中控制，如果没有登录，是访问不了它
		return "index";
	}

	//欢迎界面
	@RequestMapping("/welcome")
	public String welcome(Model model, HttpSession session) throws Exception {
		LoginUser loginUser = (LoginUser) session.getAttribute(MyConfig.LOGINUSER_KEY);

		if (loginUser.getUserId() == 1) {
			//超级管理员或者运营客服
			model.addAttribute("superSu", 1);
		}

		return "adminwelcome";


	}



	//直接退出的页面
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();//session失效
		return "redirect:/login";
	}

	//退出跳转页面
	@RequestMapping("/logoutSkip")
	public String logoutSkip() throws Exception {
		return "logout";
	}

	//修改密码的页面
	@RequestMapping(value = "/modifypwd", method = RequestMethod.GET)
	public String modifypwd() {
		return "modifypwd";
	}

//	@RequestMapping(value = "/modifypwd", method = RequestMethod.POST)
	/*@ResponseBody
	public SubmitResultInfo modifypwd(String oldPassword, String newPassword, String newConfirmPassword,
									  HttpSession session) throws Exception {
		//判断新密码与确认新密码是否一致
		if (!newPassword.equals(newConfirmPassword)) {
			//ResultUtil.throwCustomExcepion(107);
		}
		//登录用户
		LoginUser loginUser = (LoginUser) session.getAttribute(MyConfig.LOGINUSER_KEY);
		//判断原密码是否正确
		//User userCustom = userService.selectByPrimaryKey(loginUser.getUserId());
		String md5Password = Md5Util.md5Hex(oldPassword + userCustom.getSalt());
		if (!md5Password.equalsIgnoreCase(userCustom.getPassword())) {
			//原密码不正确
			ResultUtil.throwCustomExcepion(108);
		}

		//修改新密码
		String md5NewPassword = Md5Util.md5Hex(newPassword + userCustom.getSalt());
		userService.updatePassword(userCustom.getId(), md5NewPassword);

		session.invalidate();//session失效
		return ResultUtil.getSuccessSubmitResult();
	}*/

}
