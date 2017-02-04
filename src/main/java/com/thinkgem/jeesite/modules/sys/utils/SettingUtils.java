/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.utils;

import java.util.Map;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.dao.SettingDao;
import com.thinkgem.jeesite.modules.sys.entity.Setting;

/**
 * 系統参数工具类
 * @author ThinkGem
 * @version 2013-5-29
 */
public class SettingUtils {
	
	private static SettingDao settingDao = SpringContextHolder.getBean(SettingDao.class);

	public static final String CACHE_SETTING_MAP = "settingMap";
	
	public static String getSettingContent(String code){
		@SuppressWarnings("unchecked")
		Map<String, Setting> settingMap = (Map<String, Setting>)CacheUtils.get(CACHE_SETTING_MAP);
		if (settingMap==null){
			settingMap = Maps.newHashMap();
			for (Setting setting : settingDao.findList(new Setting())){
				settingMap.put(setting.getCode(), setting);
			}
			CacheUtils.put(CACHE_SETTING_MAP, settingMap);
		}
		Setting setting = settingMap.get(code);
		if(setting!=null) return setting.getContent();
		return "";
	}
	
}
