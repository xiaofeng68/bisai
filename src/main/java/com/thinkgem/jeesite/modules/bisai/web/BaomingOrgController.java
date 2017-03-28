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
import com.thinkgem.jeesite.modules.bisai.entity.BaomingOrg;
import com.thinkgem.jeesite.modules.bisai.service.BaomingOrgService;

/**
 * 单位Controller
 * @author 小风
 * @version 2017-03-26
 */
@Controller
@RequestMapping(value = "${adminPath}/bisai/baomingOrg")
public class BaomingOrgController extends BaseController {

	@Autowired
	private BaomingOrgService baomingOrgService;
	
	@ModelAttribute
	public BaomingOrg get(@RequestParam(required=false) String id) {
		BaomingOrg entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = baomingOrgService.get(id);
		}
		if (entity == null){
			entity = new BaomingOrg();
		}
		return entity;
	}
	
	@RequiresPermissions("bisai:baomingOrg:view")
	@RequestMapping(value = {"list", ""})
	public String list(BaomingOrg baomingOrg, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<BaomingOrg> page = baomingOrgService.findPage(new Page<BaomingOrg>(request, response), baomingOrg); 
		model.addAttribute("page", page);
		return "modules/bisai/baomingOrgList";
	}

	@RequiresPermissions("bisai:baomingOrg:view")
	@RequestMapping(value = "form")
	public String form(BaomingOrg baomingOrg, Model model) {
		model.addAttribute("baomingOrg", baomingOrg);
		return "modules/bisai/baomingOrgForm";
	}

	@RequiresPermissions("bisai:baomingOrg:edit")
	@RequestMapping(value = "save")
	public String save(BaomingOrg baomingOrg, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, baomingOrg)){
			return form(baomingOrg, model);
		}
		baomingOrgService.save(baomingOrg);
		addMessage(redirectAttributes, "保存单位成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/baomingOrg/?repage";
	}
	
	@RequiresPermissions("bisai:baomingOrg:edit")
	@RequestMapping(value = "delete")
	public String delete(BaomingOrg baomingOrg, RedirectAttributes redirectAttributes) {
		baomingOrgService.delete(baomingOrg);
		addMessage(redirectAttributes, "删除单位成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/baomingOrg/?repage";
	}

}