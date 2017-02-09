/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.bisai.entity.Account;
import com.thinkgem.jeesite.modules.bisai.service.AccountService;

/**
 * 比赛账号Controller
 * @author 小风
 * @version 2017-02-09
 */
@Controller
@RequestMapping(value = "${adminPath}/bisai/account")
public class AccountController extends BaseController {

	@Autowired
	private AccountService accountService;
	
	@ModelAttribute
	public Account get(@RequestParam(required=false) String id) {
		Account entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = accountService.get(id);
		}
		if (entity == null){
			entity = new Account();
		}
		return entity;
	}
	
	@RequiresPermissions("bisai:account:view")
	@RequestMapping(value = {"list", ""})
	public String list(Account account, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Account> page = accountService.findPage(new Page<Account>(request, response), account); 
		model.addAttribute("page", page);
		return "modules/bisai/accountList";
	}

	@RequiresPermissions("bisai:account:view")
	@RequestMapping(value = "form")
	public String form(Account account, Model model) {
		model.addAttribute("account", account);
		return "modules/bisai/accountForm";
	}

	@RequiresPermissions("bisai:account:edit")
	@RequestMapping(value = "save")
	public String save(Account account, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, account)){
			return form(account, model);
		}
		accountService.save(account);
		addMessage(redirectAttributes, "保存账号成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/account/?repage";
	}
	
	@RequiresPermissions("bisai:account:edit")
	@RequestMapping(value = "delete")
	public String delete(Account account, RedirectAttributes redirectAttributes) {
		accountService.delete(account);
		addMessage(redirectAttributes, "删除账号成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/account/?repage";
	}

}