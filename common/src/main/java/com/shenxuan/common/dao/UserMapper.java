package com.shenxuan.common.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.shenxuan.common.pojo.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户-数据访问层接口
 *
 * @author sunmeng
 * @date 2017年1月4日上午11:40:08
 */
public interface UserMapper extends BaseMapper<User> {

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
	User selectAllByUsername(String username);
}