package com.kidinfor.util;

import com.kidinfor.fastweixin.api.JsAPI;
import com.kidinfor.fastweixin.api.UserAPI;
import com.kidinfor.fastweixin.api.config.ApiConfig;
import com.kidinfor.fastweixin.api.response.GetSignatureResponse;
import com.kidinfor.fastweixin.api.response.GetUserInfoResponse;
import com.thinkgem.jeesite.common.config.Global;

public class WeixinHelp {
	public static String OPENID = "openid";
	private static String appid = Global.getConfig("AppID");
	private static String secret = Global.getConfig("AppSecret");
    private static ApiConfig config;
    private static WeixinHelp WeixinUtil;
    private WeixinHelp(){}
    
    public static WeixinHelp getInstance(){
    	if(WeixinUtil==null){
    		WeixinUtil = new WeixinHelp();
    		config = new ApiConfig(appid, secret);
    	}
    	return WeixinUtil;
    }
    public GetUserInfoResponse getUserInfo(String openId){
    	UserAPI userAPI = new UserAPI(config);
        GetUserInfoResponse userInfo = userAPI.getUserInfo(openId);
        return userInfo;
    }
    public GetSignatureResponse getJsApiSign(String url){
    	JsAPI jsAPI = new JsAPI(config);
    	GetSignatureResponse response = jsAPI.getSignature(url);
    	return response;
    }
}
