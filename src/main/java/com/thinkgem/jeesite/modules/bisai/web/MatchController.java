/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.web;

import java.util.Date;

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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.bisai.entity.Match;
import com.thinkgem.jeesite.modules.bisai.service.MatchService;

/**
 * 比赛信息Controller
 * @author 小风
 * @version 2017-02-09
 */
@Controller
@RequestMapping(value = "${adminPath}/bisai/match")
public class MatchController extends BaseController {

	@Autowired
	private MatchService matchService;
	
	@ModelAttribute
	public Match get(@RequestParam(required=false) String id) {
		Match entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = matchService.get(id);
		}
		if (entity == null){
			entity = new Match();
		}
		return entity;
	}
	
	@RequiresPermissions("bisai:match:view")
	@RequestMapping(value = {"list", ""})
	public String list(Match match, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Match> page = matchService.findPage(new Page<Match>(request, response), match); 
		model.addAttribute("page", page);
		return "modules/bisai/matchList";
	}

	@RequiresPermissions("bisai:match:view")
	@RequestMapping(value = "form")
	public String form(Match match, Model model) {
		model.addAttribute("match", match);
		return "modules/bisai/matchForm";
	}

	@RequiresPermissions("bisai:match:edit")
	@RequestMapping(value = "save")
	public String save(Match match, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, match)){
			return form(match, model);
		}
		matchService.save(match);
		addMessage(redirectAttributes, "保存比赛成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/match/?repage";
	}
	
	@RequiresPermissions("bisai:match:edit")
	@RequestMapping(value = "delete")
	public String delete(Match match, RedirectAttributes redirectAttributes) {
		matchService.delete(match);
		addMessage(redirectAttributes, "删除比赛成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/match/?repage";
	}
	@RequiresPermissions("bisai:match:grant")
    @RequestMapping(value = "grant")
    public String grant(Match match, RedirectAttributes redirectAttributes) {
	    match.setUpdatetime(new Date());
        matchService.updateMatchState(match);
        addMessage(redirectAttributes, "比赛申请通过");
        return "redirect:"+Global.getAdminPath()+"/bisai/match/?repage";
    }
	
}