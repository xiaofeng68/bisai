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
import com.thinkgem.jeesite.modules.bisai.entity.PeopleNote;
import com.thinkgem.jeesite.modules.bisai.service.PeopleNoteService;

/**
 * 参赛人员记录Controller
 * @author 小风
 * @version 2017-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/bisai/peopleNote")
public class PeopleNoteController extends BaseController {

	@Autowired
	private PeopleNoteService peopleNoteService;
	
	@ModelAttribute
	public PeopleNote get(@RequestParam(required=false) String id) {
		PeopleNote entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = peopleNoteService.get(id);
		}
		if (entity == null){
			entity = new PeopleNote();
		}
		return entity;
	}
	
	@RequiresPermissions("bisai:peopleNote:view")
	@RequestMapping(value = {"list", ""})
	public String list(PeopleNote peopleNote, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PeopleNote> page = peopleNoteService.findPage(new Page<PeopleNote>(request, response), peopleNote); 
		model.addAttribute("page", page);
		return "modules/bisai/peopleNoteList";
	}

	@RequiresPermissions("bisai:peopleNote:view")
	@RequestMapping(value = "form")
	public String form(PeopleNote peopleNote, Model model) {
		model.addAttribute("peopleNote", peopleNote);
		return "modules/bisai/peopleNoteForm";
	}

	@RequiresPermissions("bisai:peopleNote:edit")
	@RequestMapping(value = "save")
	public String save(PeopleNote peopleNote, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, peopleNote)){
			return form(peopleNote, model);
		}
		peopleNoteService.save(peopleNote);
		addMessage(redirectAttributes, "保存参赛人员成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/peopleNote/?repage";
	}
	
	@RequiresPermissions("bisai:peopleNote:edit")
	@RequestMapping(value = "delete")
	public String delete(PeopleNote peopleNote, RedirectAttributes redirectAttributes) {
		peopleNoteService.delete(peopleNote);
		addMessage(redirectAttributes, "删除参赛人员成功");
		return "redirect:"+Global.getAdminPath()+"/bisai/peopleNote/?repage";
	}

}