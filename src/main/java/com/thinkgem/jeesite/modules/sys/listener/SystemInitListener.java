package com.thinkgem.jeesite.modules.sys.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 系统初始化监听器
 * 
 * @author Administrator
 * @date 2011-12-16 下午11:26:14
 */
public class SystemInitListener implements ServletContextListener {
	private Logger log = LoggerFactory.getLogger(SystemInitListener.class);

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		log.info("=====================系统内存初始化监听启动==========================");
		log.info("=====================系统内存初始化监听启动完毕==========================");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
