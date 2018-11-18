package com.shenxuan.common.dao;

import com.shenxuan.common.pojo.addition.UserCustom;
import com.shenxuan.common.pojo.addition.UserQuery;
import com.shenxuan.common.pojo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户-数据访问层接口
 *
 * @author sunmeng
 * @date 2017年1月4日上午11:40:08
 */
@Mapper
public interface UserMapper extends BaseMapper<User, UserQuery,UserCustom> {

	/**
	 * 根据用户名查询记录数
	 *
	 * @param username
	 * @return
	 * @author sunmeng
	 * @date 2016年6月17日 上午11:29:58
	 */
	int selectCountByUsername(String username);

	/**
	 * 批量禁用
	 *
	 * @param ids
	 * @author sunmeng
	 * @date 2016年6月17日 下午2:50:34
	 */
	void userBatchDisable(int[] ids);


	List<User> setlectTempList(User user);

	 UserCustom selectByUsername(String username)throws Exception;
	/**
	 * 修改密码
	 *
	 * @param userId
	 * @param md5NewPassword
	 * @author sunmeng
	 * @date 2016年12月30日 上午11:18:56
	 */
	void updatePassword(@Param("userId") Integer userId, @Param("md5NewPassword") String md5NewPassword);

	/**
	 * 根据用户名查找所有用户
	 */
	UserCustom selectAllByUsername(String username);
}