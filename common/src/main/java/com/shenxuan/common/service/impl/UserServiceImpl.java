package com.shenxuan.common.service.impl;

import com.shenxuan.common.constans.MyConfig;
import com.shenxuan.common.dao.UserMapper;
import com.shenxuan.common.pojo.addition.ResultUtil;
import com.shenxuan.common.pojo.addition.UserCustom;
import com.shenxuan.common.pojo.addition.UserQuery;
import com.shenxuan.common.pojo.entity.User;
import com.shenxuan.common.service.IUserService;
import com.shenxuan.common.utils.Md5Util;
import com.shenxuan.common.utils.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by shenxuan on 2018/11/15 9:11
 */
@Service
public class UserServiceImpl  implements IUserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public int insert(User entity) throws Exception {
		// 判断用户名是否存在
		if (isExists(entity.getUsername())) {
			ResultUtil.throwCustomExcepion(101);
		}
		String salt = Util.randomNubmer4();
		entity.setPassword(Md5Util.md5Hex(entity.getPassword() + salt));
		entity.setSalt(salt);
		entity.setCreateTime(new Date());
		entity.setDataStatus(MyConfig.DATA_STATUS_YES);
		return userMapper.insert(entity);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) throws Exception {
		return userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int update(User entity) throws Exception {
		return userMapper.update(entity);
	}

	@Override
	public User selectByPrimaryKey(Integer id) throws Exception {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<UserCustom> selectList(UserQuery query) throws Exception {
		return userMapper.selectList(query);
	}

	@Override
	public int selectListCount(UserQuery query) throws Exception {
		return userMapper.selectListCount(query);
	}

	@Override
	public boolean isExists(String username) throws Exception {
		Boolean result = true;
		int count = userMapper.selectCountByUsername(username);
		if (count == 0) {
			result = false;
		}
		return result;
	}

	@Override
	public void userBatchDisable(int[] ids) {
		userMapper.userBatchDisable(ids);
	}

	/**
	 * 根据用户名查找用户
	 *
	 * @param username
	 * @return
	 * @throws Exception
	 * @author monkey
	 * @date 2016年6月22日 上午10:19:13
	 */
	@Override
	public UserCustom selectByUsername(String username) throws Exception {
		return userMapper.selectByUsername(username);
	}

	@Override
	public void updatePassword(Integer userId, String md5NewPassword) {
		userMapper.updatePassword(userId, md5NewPassword);
	}

}
