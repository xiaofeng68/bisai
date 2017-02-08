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
import com.thinkgem.jeesite.modules.bisai.entity.TAccount;
import com.thinkgem.jeesite.modules.bisai.service.TAccountService;

/**
 * 用户账号Controller
 * @author 小风
 * @version 2017-02-05
 */
@Controller
@RequestMapping(value = "${adminPath}/bisai/tAccount")
public class TAccountController extends BaseController {

	@Autowired
	private TAccountService tAccountService;
	
	@ModelAttribute("tAccount")
	public TAccount get(@RequestParam(required=false) String id) {
		TAccount entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tAccountService.get(id);
		}
		if (entity == null){
			entity = new TAccount();
		}
		return entity;
	}
	
	@RequiresPermissions("bisai:tAccount:view")
	@RequestMapping(value = {"list", ""})
	public String list(TAccount tAccount, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TAccount> page = tAccountService.findPage(new Page<TAccount>(request, response), tAccount); 
		model.addAttribute("page", page);
		return "modules/bisai/tAccountList";
	}

	@RequiresPermissions("bisai:tAccount:view")
	@RequestMapping(value = "form")
	public String form(TAccount tAccount, Model model) {
		model.addAttribute("tAccount", tAccount);
		return "modules/bisai/tAccountForm";
	}

	@RequiresPermissions("bisai:tAccount:edit")
	@RequestMapping(value = "save")
	public String save(TAccount tAccount, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tAccount)){
			return form(tAccount, model);
		}
		tAccountService.save(tAccount);
		addMessage(redirectAttributes, "保存用户成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/tAccount/?repage";
	}
	
	@RequiresPermissions("bisai:tAccount:edit")
	@RequestMapping(value = "delete")
	public String delete(TAccount tAccount, RedirectAttributes redirectAttributes) {
		tAccountService.delete(tAccount);
		addMessage(redirectAttributes, "删除用户成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/tAccount/?repage";
	}

}