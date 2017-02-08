package com.thinkgem.jeesite.modules.bisai.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thinkgem.jeesite.common.utils.MD5Util;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.bisai.entity.TAccount;
import com.thinkgem.jeesite.modules.bisai.global.GlobalBuss;
import com.thinkgem.jeesite.modules.bisai.service.TAccountService;
import com.thinkgem.jeesite.modules.wx.util.WeixinUtil;

import net.sf.json.JSONObject;

/**
 * 网站Controller
 * 
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}")
public class FrontController extends BaseController {
    @Autowired
    private TAccountService tAccountService;
    /**
     * 网站首页
     */
    @RequestMapping
    public String index(Model model) {
        model.addAttribute("isIndex", true);
        return "mobile/modules/bisai/front/index";
    }

    /**
     * 现有页面下部的菜单保留，点击我的，如果没有登陆就显示到登陆界面。 登陆界面有手机号和密码，也要有微信授权登陆的按钮。
     * 有注册按钮，点击注册，直接使用微信进行注册。 要求设定手机号登陆和一个登陆密码。
     */
    @RequestMapping(value = "my${urlSuffix}")
    public String index(HttpServletRequest request) {
        // 判断用户是否登陆
        HttpSession session = request.getSession();
        if (session.getAttribute(GlobalBuss.CURRENTACCOUNT) != null) {// 已登陆
            return "mobile/modules/bisai/front/about";
        }
        else {// 未登录
            return "mobile/modules/bisai/front/login";
        }
    }

    /** 注册页面 */
    @RequestMapping(value = "regist${urlSuffix}")
    public String regist(HttpServletRequest request) {
        return "mobile/modules/bisai/front/register";
    }
    /**微信用户授权*/
    @RequestMapping(value = "authtest")
    public String authtest(HttpServletRequest request ,HttpServletResponse response){
        //第一步：用户同意授权，获取code
        String projectPath = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        return "redirect:"+WeixinUtil.getWxCode(projectPath+"wxoauth");
    }
    /** 微信授权 */
    @RequestMapping(value = "wxoauth")
    public String wxoauth(HttpServletRequest request,String code,String state) {
        //第二步：通过code换取网页授权access_token
        JSONObject token = WeixinUtil.getUserToken(code);
        String openId = token.getString("openid");
        TAccount tAccount = tAccountService.getAccountByOpenId(openId);
        if(tAccount==null){
            //第四步：拉取用户信息(需scope为 snsapi_userinfo)
            JSONObject account = WeixinUtil.getUserInfo(token.getString("access_token"), openId);
            //保存用户信息
            tAccount = new TAccount();
            tAccount.setWxname(account.getString("nickname"));
            tAccount.setSex(account.getString("sex"));
            tAccount.setOpenId(account.getString("openid"));
            tAccount.setWxphoto(account.getString("headimgurl"));
            tAccountService.save(tAccount);
            request.getSession().setAttribute("currentAccount", tAccount);
        }
        if(tAccount!=null && !StringUtils.isEmpty(tAccount.getPhone())){
            return "mobile/modules/bisai/front/register";
        }
        //如果没有手机进行手机注册页面，并关联进行
        return "mobile/modules/bisai/front/about";
    }
    @RequestMapping(value = "regist",method=RequestMethod.POST)
    public String registAccount(HttpServletRequest request,TAccount account){
        //判断手机是否注册
        TAccount tAccount = tAccountService.getAccountByPhone(account.getPhone());
        if(tAccount!=null){//已注册
            return "redirect:mobile/modules/bisai/front/login";
        }else{
            account.setPassword(MD5Util.md5Hex(account.getPassword()));
            request.getSession().setAttribute(GlobalBuss.CURRENTACCOUNT, account);
            //第一步：用户同意授权，获取code
            String projectPath = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
            return "redirect:"+WeixinUtil.getWxCode(projectPath+"wxoauth");
        }
    }
    @RequestMapping(value = "login",method=RequestMethod.POST)
    public String loginAccount(HttpServletRequest request,TAccount account) {
        account.setPassword(MD5Util.md5Hex(account.getPassword()));
        TAccount dbaccount = tAccountService.getAccountByPhone(account.getPhone());
        if(dbaccount==null){//账号不存在
            request.setAttribute(GlobalBuss.ACCOUNTERROR, true);
            return "mobile/modules/bisai/front/login"; 
        }else if(!dbaccount.getPassword().equals(account.getPassword())){//密码错误
            request.setAttribute(GlobalBuss.PASSWDERROR, true);
            return "mobile/modules/bisai/front/login"; 
        }
        request.getSession().setAttribute(GlobalBuss.CURRENTACCOUNT, dbaccount);
        return "mobile/modules/bisai/front/about"; 
    }
    /**賽事列表*/
    @RequestMapping(value = "match${urlSuffix}")
    public String match(HttpServletRequest request) {
        return "mobile/modules/bisai/front/match";
    }
}
