package com.shenxuan.common.service;

import com.baomidou.mybatisplus.service.IService;
import com.shenxuan.common.pojo.addition.UserCustom;
import com.shenxuan.common.pojo.entity.User;

/**
 * 用户-业务逻辑层接口
 *
 * @author sunmeng
 * @date 2016年6月17日 上午11:39:43
 */
public interface IUserService extends IService<User> {


	UserCustom selectByUsername(String username);
}
