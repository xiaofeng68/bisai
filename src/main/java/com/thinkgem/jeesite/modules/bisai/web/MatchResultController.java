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
import com.thinkgem.jeesite.modules.bisai.entity.MatchResult;
import com.thinkgem.jeesite.modules.bisai.service.MatchResultService;

/**
 * 比赛结果Controller
 * @author 小风
 * @version 2017-03-28
 */
@Controller
@RequestMapping(value = "${adminPath}/bisai/matchResult")
public class MatchResultController extends BaseController {

	@Autowired
	private MatchResultService matchResultService;
	
	@ModelAttribute
	public MatchResult get(@RequestParam(required=false) String id) {
		MatchResult entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = matchResultService.get(id);
		}
		if (entity == null){
			entity = new MatchResult();
		}
		return entity;
	}
	
	@RequiresPermissions("bisai:matchResult:view")
	@RequestMapping(value = {"list", ""})
	public String list(MatchResult matchResult, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MatchResult> page = matchResultService.findPage(new Page<MatchResult>(request, response), matchResult); 
		model.addAttribute("page", page);
		return "modules/bisai/matchResultList";
	}

	@RequiresPermissions("bisai:matchResult:view")
	@RequestMapping(value = "form")
	public String form(MatchResult matchResult, Model model) {
		model.addAttribute("matchResult", matchResult);
		return "modules/bisai/matchResultForm";
	}

	@RequiresPermissions("bisai:matchResult:edit")
	@RequestMapping(value = "save")
	public String save(MatchResult matchResult, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, matchResult)){
			return form(matchResult, model);
		}
		matchResultService.save(matchResult);
		addMessage(redirectAttributes, "保存比赛结果成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/matchResult/?repage";
	}
	
	@RequiresPermissions("bisai:matchResult:edit")
	@RequestMapping(value = "delete")
	public String delete(MatchResult matchResult, RedirectAttributes redirectAttributes) {
		matchResultService.delete(matchResult);
		addMessage(redirectAttributes, "删除比赛结果成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/matchResult/?repage";
	}

}