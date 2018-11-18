package com.shenxuan.common.dao;


import com.shenxuan.common.pojo.addition.BusinessCustom;
import com.shenxuan.common.pojo.addition.BusinessQuery;
import com.shenxuan.common.pojo.entity.Business;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BusinessMapper extends BaseMapper<Business, BusinessQuery, BusinessCustom> {

}