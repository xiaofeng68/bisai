package com.thinkgem.jeesite.modules.bisai.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.bisai.entity.BaomingOrg;

/**
 * 单位DAO接口
 * @author 小风
 * @version 2017-03-26
 */
@MyBatisDao
public interface BaomingOrgDao extends CrudDao<BaomingOrg> {
	void deleteByMatch(String matchid);
}