package com.thinkgem.jeesite.modules.sys.web;

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
import com.thinkgem.jeesite.modules.sys.entity.Setting;
import com.thinkgem.jeesite.modules.sys.service.SettingService;

/**
 * 参数配置Controller
 * @author 小风
 * @version 2017-04-08
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/setting")
public class SettingController extends BaseController {

	@Autowired
	private SettingService settingService;
	
	@ModelAttribute
	public Setting get(@RequestParam(required=false) String id) {
		Setting entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = settingService.get(id);
		}
		if (entity == null){
			entity = new Setting();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:setting:view")
	@RequestMapping(value = {"list", ""})
	public String list(Setting setting, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Setting> page = settingService.findPage(new Page<Setting>(request, response), setting); 
		model.addAttribute("page", page);
		return "modules/sys/settingList";
	}

	@RequiresPermissions("sys:setting:view")
	@RequestMapping(value = "form")
	public String form(Setting setting, Model model) {
		model.addAttribute("setting", setting);
		return "modules/sys/settingForm";
	}

	@RequiresPermissions("sys:setting:edit")
	@RequestMapping(value = "save")
	public String save(Setting setting, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, setting)){
			return form(setting, model);
		}
		settingService.save(setting);
		addMessage(redirectAttributes, "保存参数成功");
		return "redirect:"+Global.getAdminPath()+"/sys/setting/?repage";
	}
	
	@RequiresPermissions("sys:setting:edit")
	@RequestMapping(value = "delete")
	public String delete(Setting setting, RedirectAttributes redirectAttributes) {
		settingService.delete(setting);
		addMessage(redirectAttributes, "删除参数成功");
		return "redirect:"+Global.getAdminPath()+"/sys/setting/?repage";
	}

}