package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Setting;

/**
 * 参数配置DAO接口
 * @author 小风
 * @version 2017-04-08
 */
@MyBatisDao
public interface SettingDao extends CrudDao<Setting> {
	
}