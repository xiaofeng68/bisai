package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.Setting;
import com.thinkgem.jeesite.modules.sys.dao.SettingDao;

/**
 * 参数配置Service
 * @author 小风
 * @version 2017-04-08
 */
@Service("settingService")
@Transactional(readOnly = true)
public class SettingService extends CrudService<SettingDao, Setting> {

	public Setting get(String id) {
		return super.get(id);
	}
	
	public List<Setting> findList(Setting setting) {
		return super.findList(setting);
	}
	
	public Page<Setting> findPage(Page<Setting> page, Setting setting) {
		return super.findPage(page, setting);
	}
	
	@Transactional(readOnly = false)
	public void save(Setting setting) {
		super.save(setting);
	}
	
	@Transactional(readOnly = false)
	public void delete(Setting setting) {
		super.delete(setting);
	}
	
}