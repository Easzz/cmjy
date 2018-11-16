package com.shenxuan.admin.config;

import com.shenxuan.common.constans.MyConfig;
import com.shenxuan.common.pojo.addition.LoginUser;
import com.shenxuan.common.utils.ResourcesUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户的认证拦截器
 * @author monkey
 * @date 2016年6月23日 上午10:21:48
 */
public class LoginInterceptor implements HandlerInterceptor {

	// 进入handler之前
	// 使用：用户的认证、用户的授权
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//校验用户身份是否合法，也就是判断用户是否登录
		HttpSession session=request.getSession();
		//LoginUser loginUser=(LoginUser) session.getAttribute(MyConfig.LOGINUSER_KEY);
		LoginUser loginUser=(LoginUser) session.getAttribute(MyConfig.LOGINUSER_KEY);
		if (loginUser!=null) {
			//登录了就放行
			return true;
		}
		
		//获取请求的url地址
		String requestUrl=request.getRequestURI();
		
		//没登录的时候，判断是否访问公共资源，这这个ResourcesUtil还有读取单条配置信息的方法getValue
		List<String> openUrls=ResourcesUtil.gekeyList(MyConfig.ANONYMOUS_URL);
		for (String openUrl : openUrls) {
			if (requestUrl.contains(openUrl)) {
				return true;
			}
		}
		
		//到了这里一定是没有登录，同时访问的是非匿名地址，那么直接去登录页面
		//request.getRequestDispatcher("/logout.jsp").forward(request, response);
		//抛出异常的方式可以解决用户ajax提交时会有登录失效提示
		//FIXME 在ResultUtil中封装一个登录失效方法，需要修改js中加入登录失效提示，ResultInfo也要加一个分类就是失效
		//ResultUtil.throwCustomExcepion(MyConfig.LOGIN_FAILURE);//没有登录抛出未登录异常
		
		return false;
	}

	// 进入action之后，返回modelAndView之前
	// 使用：这里对统一返回数据进行处理，比如统一添加菜单导航
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
						   ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	// action执行完成，以后返回modelAndView了
	// 使用：统一异常处理，在这里统一记录系统日志。监控action执行时间，在preHandle和afterCompletion记录两个时间做对比
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
