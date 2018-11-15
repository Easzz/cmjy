package com.shenxuan.admin.controller;

import com.shenxuan.common.constans.MyConfig;
import com.shenxuan.common.pojo.addition.ResultUtil;
import com.shenxuan.common.pojo.addition.SubmitResultInfo;
import com.shenxuan.common.pojo.entity.User;
import com.shenxuan.common.service.IBusinessService;
import com.shenxuan.common.service.IPermissionService;
import com.shenxuan.common.service.IUserService;
import com.shenxuan.common.utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

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
			if (userCustom.getBusinessId() != null) {
				int dataStatus = businessService.selectByPrimaryKey(userCustom.getBusinessId()).getDataStatus();
				if (dataStatus == 0) {
					request.setAttribute("msg", "你所在的企业已被禁用！");
					return login(model);
				}
			}
			String md5Password = Md5Util.md5Hex(password + userCustom.getSalt());
			if (md5Password.equalsIgnoreCase(userCustom.getPassword())) {
				//根据手机号查询前台用户（手机号在系统中唯一）
				Employee employee = iEmployeeService.selectByMobile(userCustom.getMobilePhone());
				if (userCustom.getBusinessId() != null) {
					if (employee == null) {
						request.setAttribute("msg", "此用户对于前台用户为null！");
						return login(model);
					}
				}

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

				if (employee != null) {
					loginUser.setFrontEmployeeId(employee.getId());
				}
				//用户菜单
				loginUser.setMenus(permissionService.selectMenusByUserId(userCustom.getId()));

				//用户权限
				loginUser.setPermissions(permissionService.findPermissionListByUserId(userCustom.getId()));

				//把登录用户保存到session中
				session.setAttribute(MyConfig.LOGINUSER_KEY, loginUser);
//				sessionProvider.setAttribute(request, MyConfig.LOGINUSER_KEY, loginUser);
				loginLog.setLoginState(1);//登录状态：0→失败、1→成功
				loginLogService.insert(loginLog);
				return "redirect:/index.action";
			}
		}
		loginLog.setLoginState(0);//登录状态：0→失败、1→成功
		loginLogService.insert(loginLog);
		request.setAttribute("msg", "用户名或密码错误！");
		return login(model);
	}

	//主界面
	@RequestMapping("/index")
	public String index(Model model, HttpSession session) {
		//登录后的默认欢迎页面
		String url = "/welcome.action";
		model.addAttribute("welcomeUrl", url);
		// 去主界面，拦截器中控制，如果没有登录，是访问不了它
		return "index";
	}

	//欢迎界面
	@RequestMapping("/welcome")
	public String welcome(Model model, HttpSession session) throws Exception {
		LoginUser loginUser = (LoginUser) session.getAttribute(MyConfig.LOGINUSER_KEY);
		//判断是否是企业
		if (loginUser.getBusinessId() != null) {
			Employee employee = iEmployeeService.selectByPrimaryKey(loginUser.getFrontEmployeeId());
			BusinessBackIndexVo businessBackIndexVo = accountService.selectBusinessIndexData(employee);
			model.addAttribute("businessBackIndexVo", businessBackIndexVo);
			return "welcome";
		}
		if (SysRoleType.isGovUser(loginUser.getRoleId())){
			return "govWelcome";
		}

		BigDecimal totalIncome = accountingManagementService.selectTotalAmount(MyConfig.DATA_STATUS_YES);
		model.addAttribute("totalIncome", totalIncome);

		EmployeeQuery employeeQuery = new EmployeeQuery();
		if (employeeQuery.getEmployee() == null) {
			employeeQuery.setEmployee(new Employee());
		}
		employeeQuery.getEmployee().setDataStatus(MyConfig.DATA_STATUS_YES);

		int employeeCount = iEmployeeService.selectListCount(employeeQuery);
		model.addAttribute("employeeCount", employeeCount);

		List<StudySummaryCustom> studySummarys = studySummaryService.selectListTen();
		model.addAttribute("studySummarys", studySummarys);

		InfoEmployeeOnlineQuery infoEmployeeOnlineQuery = new InfoEmployeeOnlineQuery();

		if (infoEmployeeOnlineQuery.getInfoEmployeeOnline() == null) {
			infoEmployeeOnlineQuery.setInfoEmployeeOnline(new InfoEmployeeOnline());
		}

		infoEmployeeOnlineQuery.getInfoEmployeeOnline().setType(InfoEmployeeOnlineTypeEnum.FRONT);

		int activeUser = infoEmployeeOnlineService.selectListActiveCount(infoEmployeeOnlineQuery);
		model.addAttribute("activeUser", activeUser);

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
		return "redirect:/login.action";
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

	@RequestMapping(value = "/modifypwd", method = RequestMethod.POST)
	@ResponseBody
	public SubmitResultInfo modifypwd(String oldPassword, String newPassword, String newConfirmPassword,
									  HttpSession session) throws Exception {
		//判断新密码与确认新密码是否一致
		if (!newPassword.equals(newConfirmPassword)) {
			ResultUtil.throwCustomExcepion(107);
		}
		//登录用户
		LoginUser loginUser = (LoginUser) session.getAttribute(MyConfig.LOGINUSER_KEY);
		//判断原密码是否正确
		User userCustom = userService.selectByPrimaryKey(loginUser.getUserId());
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
	}

}
