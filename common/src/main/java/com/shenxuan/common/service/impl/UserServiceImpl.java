package com.shenxuan.common.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shenxuan.common.dao.UserMapper;
import com.shenxuan.common.pojo.addition.UserCustom;
import com.shenxuan.common.pojo.entity.User;
import com.shenxuan.common.service.IUserService;
import org.springframework.stereotype.Service;

/**
 * Created by shenxuan on 2018/11/15 9:11
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
	@Override
	public UserCustom selectByUsername(String username) {
		return this.baseMapper.selectAllByUsername(username);
	}
}
