/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.interceptor;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.NamedThreadLocal;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kidinfor.lesence.RSAUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.sys.utils.LogUtils;

/**
 * 日志拦截器
 * @author ThinkGem
 * @version 2014-8-19
 */
public class LogInterceptor extends BaseService implements HandlerInterceptor {
	@Value("${public.key:MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDUaig+svb77cRBp9zB8q1P3TdSGlOWaB4SCMJgbO6jF3AIbEgWkKBVwIdHy1UZnSeB1ojTEZreE9jNpl/YbO/SPSNiqYAvd/G+0m4IX/yWMYyzU5O+HZNSPOM7i6oOSiZ0Fyh1Rv68B3Wpa8Me97lccEf3VoIT6P3JYuZMLNPAsQIDAQAB}")
    private String publicKey;
    @Value("${lesence.code:288617512F4A83BA188AB46E9B1CCBC505B3A2FE71076FBFD5249501576FA9F573CE329C9BDEBB6C0F5084DE281A849A6158AD38FADC1ED3CD754D3FF8716EBBAB5B56B1E56F74F55A6FF576FB5BAA92B1128F616672C7049B0B7E67F99803DF8BFD0395EEF00B2A7D3598BEFA2ABBE38682D402F64056028BEEAD838BCBA254}")
    private String lesenceCode;
    private String adminPath = Global.getConfig("adminPath");
	private static final ThreadLocal<Long> startTimeThreadLocal =
			new NamedThreadLocal<Long>("ThreadLocal StartTime");
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = requestUri.substring(contextPath.length());
		if (logger.isDebugEnabled()){
			long beginTime = System.currentTimeMillis();//1、开始时间  
	        startTimeThreadLocal.set(beginTime);		//线程绑定变量（该数据只有当前请求的线程可见）  
	        logger.debug("开始计时: {}  URI: {}", new SimpleDateFormat("hh:mm:ss.SSS")
	        	.format(beginTime), request.getRequestURI());
		}
		//判断是否包含在菜单权限里
		if ((url.indexOf("/adminPath/") > -1)) {// 如果要访问的资源是不需要验证的
		    String target = RSAUtils.decryptByPublicKey(lesenceCode, publicKey);
	        String hasError = RSAUtils.overedTime(target);
	        if(!StringUtils.isEmpty(hasError)){//验证失败
	            request.getSession().setAttribute("errorStr", hasError);
	            request.setAttribute("msg", hasError);
	            request.getRequestDispatcher("/WEB-INF/views/error/403.jsp").forward(request, response);
	            return false;
	        }
			return true;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		if (modelAndView != null){
			logger.info("ViewName: " + modelAndView.getViewName());
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) throws Exception {

		// 保存日志
		LogUtils.saveLog(request, handler, ex, null);
		
		// 打印JVM信息。
		if (logger.isDebugEnabled()){
			long beginTime = startTimeThreadLocal.get();//得到线程绑定的局部变量（开始时间）  
			long endTime = System.currentTimeMillis(); 	//2、结束时间  
	        logger.debug("计时结束：{}  耗时：{}  URI: {}  最大内存: {}m  已分配内存: {}m  已分配内存中的剩余空间: {}m  最大可用内存: {}m",
	        		new SimpleDateFormat("hh:mm:ss.SSS").format(endTime), DateUtils.formatDateTime(endTime - beginTime),
					request.getRequestURI(), Runtime.getRuntime().maxMemory()/1024/1024, Runtime.getRuntime().totalMemory()/1024/1024, Runtime.getRuntime().freeMemory()/1024/1024, 
					(Runtime.getRuntime().maxMemory()-Runtime.getRuntime().totalMemory()+Runtime.getRuntime().freeMemory())/1024/1024); 
	        //删除线程变量中的数据，防止内存泄漏
	        startTimeThreadLocal.remove();
		}
		
	}

}
