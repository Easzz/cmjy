package com.shenxuan.common.service;

import com.shenxuan.common.pojo.addition.UserCustom;
import com.shenxuan.common.pojo.addition.UserQuery;
import com.shenxuan.common.pojo.entity.User;

/**
 * 用户-业务逻辑层接口
 *
 * @author sunmeng
 * @date 2016年6月17日 上午11:39:43
 */
public interface IUserService extends IBaseService<User,UserQuery, UserCustom> {
	/**
	 * 判断用户名是否存在
	 *
	 * @param username
	 * @return
	 * @throws Exception
	 * @author sunmeng
	 * @date 2016年6月17日 上午11:28:01
	 */
	boolean isExists(String username) throws Exception;

	/**
	 * 批量禁用
	 *
	 * @param ids
	 * @author sunmeng
	 * @date 2016年6月17日 下午2:49:20
	 */
	void userBatchDisable(int[] ids);

	/**
	 * 根据用户名查找用户
	 *
	 * @param username
	 * @return
	 * @throws Exception
	 * @author monkey
	 * @date 2016年6月22日 上午10:19:13
	 */
	public UserCustom selectByUsername(String username) throws Exception;

	/**
	 * 修改密码
	 *
	 * @param userId
	 * @param md5NewPassword
	 * @author sunmeng
	 * @date 2016年12月30日 上午11:17:19
	 */
	void updatePassword(Integer userId, String md5NewPassword);



}
