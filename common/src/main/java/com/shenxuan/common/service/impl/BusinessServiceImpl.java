package com.shenxuan.common.service.impl;

import com.shenxuan.common.constans.MyConfig;
import com.shenxuan.common.dao.BusinessMapper;
import com.shenxuan.common.pojo.addition.BusinessCustom;
import com.shenxuan.common.pojo.addition.BusinessQuery;
import com.shenxuan.common.pojo.addition.ResultUtil;
import com.shenxuan.common.pojo.addition.SubmitResultInfo;
import com.shenxuan.common.pojo.entity.Business;
import com.shenxuan.common.service.IBusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BusinessServiceImpl implements IBusinessService {

	@Autowired
	private BusinessMapper businessMapper;

	@Override
	public int insert(Business entity) throws Exception {
		// TODO Auto-generated method stub
		return businessMapper.insert(entity);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return businessMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int update(Business entity) throws Exception {
		// TODO Auto-generated method stub
		return businessMapper.update(entity);
	}

	@Override
	public Business selectByPrimaryKey(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return businessMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<BusinessCustom> selectList(BusinessQuery query) throws Exception {
		// TODO Auto-generated method stub
		return businessMapper.selectList(query);
	}

	@Override
	public int selectListCount(BusinessQuery query) throws Exception {
		// TODO Auto-generated method stub
		return businessMapper.selectListCount(query);
	}


	@Override
	public SubmitResultInfo saveBusiness(Business business) {
		Date now = new Date();
		// 保存企业
		business.setDataStatus(MyConfig.DATA_STATUS_YES);//状态(０：禁用，１：启用)
		business.setCreateTime(now);
		businessMapper.insert(business);
		return ResultUtil.getSuccessSubmitResult();
	}


}
