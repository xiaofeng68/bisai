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
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;
import com.thinkgem.jeesite.modules.bisai.service.MatchTypeNoteService;

/**
 * 比赛类型记录Controller
 * @author 小风
 * @version 2017-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/bisai/matchTypeNote")
public class MatchTypeNoteController extends BaseController {

	@Autowired
	private MatchTypeNoteService matchTypeNoteService;
	
	@ModelAttribute
	public MatchTypeNote get(@RequestParam(required=false) String id) {
		MatchTypeNote entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = matchTypeNoteService.get(id);
		}
		if (entity == null){
			entity = new MatchTypeNote();
		}
		return entity;
	}
	
	@RequiresPermissions("bisai:matchTypeNote:view")
	@RequestMapping(value = {"list", ""})
	public String list(MatchTypeNote matchTypeNote, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MatchTypeNote> page = matchTypeNoteService.findPage(new Page<MatchTypeNote>(request, response), matchTypeNote); 
		model.addAttribute("page", page);
		return "modules/bisai/matchTypeNoteList";
	}

	@RequiresPermissions("bisai:matchTypeNote:view")
	@RequestMapping(value = "form")
	public String form(MatchTypeNote matchTypeNote, Model model) {
		model.addAttribute("matchTypeNote", matchTypeNote);
		return "modules/bisai/matchTypeNoteForm";
	}

	@RequiresPermissions("bisai:matchTypeNote:edit")
	@RequestMapping(value = "save")
	public String save(MatchTypeNote matchTypeNote, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, matchTypeNote)){
			return form(matchTypeNote, model);
		}
		matchTypeNoteService.save(matchTypeNote);
		addMessage(redirectAttributes, "保存比赛类型记录成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/matchTypeNote/?repage";
	}
	
	@RequiresPermissions("bisai:matchTypeNote:edit")
	@RequestMapping(value = "delete")
	public String delete(MatchTypeNote matchTypeNote, RedirectAttributes redirectAttributes) {
		matchTypeNoteService.delete(matchTypeNote);
		addMessage(redirectAttributes, "删除比赛类型记录成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/matchTypeNote/?repage";
	}

}