package com.shenxuan.admin.config;

import com.shenxuan.common.constans.MyConfig;
import com.shenxuan.common.pojo.addition.LoginUser;
import com.shenxuan.common.pojo.entity.Permission;
import com.shenxuan.common.utils.ResourcesUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户的授权拦截器
 * @author monkey
 * @date 2016年6月23日 上午11:48:16
 */
public class PermissionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 获取请求的url
		String requestUrl = request.getRequestURI();

		// 获取公开地址
		List<String> openUrls = ResourcesUtil.gekeyList(MyConfig.ANONYMOUS_URL);
		// 遍历公开 地址，如果是公开 地址则放行 （前面拦截器判断了一次，这里还要判断的原因是因为走了前面直接走后面）
		for (String openUrl : openUrls) {
			if (requestUrl.contains(openUrl)) {
				return true;
			}
		}

		// 判断请求的url是否公共 地址-需登陆即可操作url
		List<String> commonUrls = ResourcesUtil.gekeyList(MyConfig.COMMON_URL);
		for (String commonUrl : commonUrls) {
			if (requestUrl.contains(commonUrl)) {
				return true;
			}
		}

		// 获取登录用户
		HttpSession session = request.getSession();
		LoginUser loginUser = (LoginUser) session.getAttribute(MyConfig.LOGINUSER_KEY);

		// 超级用户有超级权限
		if (loginUser.getUserId()==1) {
			return true;
		}

		// 获取用户所具有的权限，进行判断
		List<Permission> permissions = loginUser.getPermissions();
		for (Permission permission : permissions) {
			// 剔除掉为null的
			if (StringUtils.isNotBlank(permission.getUrl())) {
				if (requestUrl.contains(permission.getUrl())) {
					//判断登录用户是否是企业，如果是，判断其是否购买模块
					return true;
				}
			}
		}

		// 没有权限访问就去拒绝页面
		//request.getRequestDispatcher("/WEB-INF/jsp/refuse.jsp").forward(request, response);
		//这里改成抛出异常，像登录认证一样， 方便控制对于ajax请求没有权限时做出提示。
	///	ResultUtil.throwCustomExcepion(MyConfig.NO_PERMISSION);

		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
						   ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
