/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Setting;

/**
 * 系统参数DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface SettingDao extends CrudDao<Setting> {

	/**   
	 * @Title: findByCode   
	 * @Description: TODO(根据系统参数编号获取参数信息)   
	 * @param code
	 * @return
	 * @author  author
	 */
	 
	public Setting findByCode(String code);
	
}
