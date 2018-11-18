package com.shenxuan.common.service;

import com.shenxuan.common.pojo.addition.BusinessCustom;
import com.shenxuan.common.pojo.addition.BusinessQuery;
import com.shenxuan.common.pojo.addition.SubmitResultInfo;
import com.shenxuan.common.pojo.entity.Business;

public interface IBusinessService extends IBaseService<Business, BusinessQuery, BusinessCustom> {
	SubmitResultInfo saveBusiness(Business business);

}
