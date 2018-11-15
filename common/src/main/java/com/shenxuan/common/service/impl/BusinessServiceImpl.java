package com.shenxuan.common.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shenxuan.common.dao.BusinessMapper;
import com.shenxuan.common.pojo.entity.Business;
import com.shenxuan.common.service.IBusinessService;
import org.springframework.stereotype.Service;

@Service
public class BusinessServiceImpl extends ServiceImpl<BusinessMapper, Business> implements IBusinessService {
}
