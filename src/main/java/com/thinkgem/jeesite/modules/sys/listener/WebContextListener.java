package com.thinkgem.jeesite.modules.sys.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.Setting;
import com.thinkgem.jeesite.modules.sys.service.SettingService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;


public class WebContextListener extends ContextLoaderListener {
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext servletContext = sce.getServletContext();
		SettingService settingService = SpringContextHolder.getBean(SettingService.class);
		//获取所有的系统参数
		List<Setting> settingList = settingService.findList(new Setting());
		for(Setting setting : settingList){
			servletContext.setAttribute(setting.getCode(),setting.getContent());
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
		if (!SystemService.printKeyLoadMessage()){
			return null;
		}
		return super.initWebApplicationContext(servletContext);
	}
}
