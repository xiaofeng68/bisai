/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.Json;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.bisai.entity.Match;
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleGroup;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleNote;
import com.thinkgem.jeesite.modules.bisai.service.MatchService;
import com.thinkgem.jeesite.modules.bisai.service.MatchTypeNoteService;
import com.thinkgem.jeesite.modules.bisai.service.PeopleGroupService;
import com.thinkgem.jeesite.modules.bisai.service.PeopleNoteService;
import com.thinkgem.jeesite.modules.bisai.util.GroupUtils;
import com.thinkgem.jeesite.modules.bisai.util.MatchTypeNoteUtils;
import com.thinkgem.jeesite.modules.bisai.util.PeopleGroupUtils;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 比赛信息Controller
 * @author 小风
 * @version 2017-02-09
 */
@Controller
@RequestMapping(value = "${adminPath}/bisai/match")
public class MatchController extends BaseController {
	@Autowired
	private PeopleNoteService peopleNoteService;
	@Autowired
	private MatchService matchService;
	@Autowired
	private PeopleGroupService peopleGroupService;
	@Autowired
	private MatchTypeNoteService matchTypeNoteService;
	@RequestMapping(value = "matchRecreate${urlSuffix}")
	public String matchRecreate(String id, HttpServletRequest request, Model model) {
		// 复制比赛信息
		Match match = matchService.get(id);
		match.setId(null);
		match.setState("0");
		match.setUser(null);
		matchService.save(match);
		/*String newId = match.getId();
		// 复制类型
		MatchTypeNote matchTypeNote = new MatchTypeNote();
		match.setId(id);
		Match omatch = new Match();
		omatch.setId(id);
		matchTypeNote.setMatch(omatch);
		List<MatchTypeNote> list = matchTypeNoteService.findList(matchTypeNote);
		match.setId(newId);
		for (MatchTypeNote type : list) {
			type.setId(null);
			type.setMatch(match);
			matchTypeNoteService.save(type);
		}*/
		return "redirect:"+Global.getAdminPath()+"/bisai/match/?repage";
	}
	/**
	 * 比赛结束
	 */
	@RequestMapping(value = "overMatch")
	@ResponseBody
	public Json overMatch(String id, HttpServletRequest request) {
		Json json = new Json();
		try {
			// 监测成绩是否都已经录入
			Match match = matchService.get(id);
			if ("3".equals(match.getState()) && peopleGroupService.checkMatchOver(id)) {
				json.setSuccess(true);
				return json;
			}
			match.setState("3");
			matchService.updateMatchState(match);
			List<MatchTypeNote> list = MatchTypeNoteUtils.getMatchTypes(id);
			for (MatchTypeNote note : list) {
				PeopleGroupUtils.savePeopleSort(id, note.getBtype(), note.getType());
			}
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("本赛事已结束！！");
			json.setSuccess(false);
		}
		return json;
	}
	/**
	 * 保存赛事成绩
	 */
	@RequestMapping(value = "saveScoreTable")
	public String saveScoreTable(String scores, String id, String type, String stype, String lun, Model model,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		scores = StringEscapeUtils.unescapeHtml4(scores);
		JSONArray array = JSONArray.fromObject(scores);
		if (array.size() == 0) {// 下一轮分组
			PeopleGroup peopleGroup = new PeopleGroup();
			peopleGroup.setMatchid(id);
			peopleGroup.setBtype(type);
			peopleGroup.setType(stype);
			peopleGroup.setLun(lun);
			if (peopleGroupService.countScoreIsNull(peopleGroup) == 0) {// 判断是否都类型下是否都录入完成，//完成进行下一轮分组
				// 根据出线人数进行分组
				MatchTypeNote matchTypeNote = new MatchTypeNote();
				Match match = new Match();
				match.setId(id);
				matchTypeNote.setMatch(match);
				matchTypeNote.setBtype(type);
				matchTypeNote.setType(stype);
				List<MatchTypeNote> typeList = matchTypeNoteService.findList(matchTypeNote);
				int nextLun = Integer.parseInt(lun) + 1;
				if (typeList.size() == 1) {
					matchTypeNote = typeList.get(0);
					int chuxian = matchTypeNote.getZuchuxian();
					if ("2".equals(matchTypeNote.getBtype())) {
						PeopleNote peopleNote = new PeopleNote();
						peopleNote.setNote(matchTypeNote);
						peopleNote.setState("1");
						List<PeopleNote> peopleList = peopleNoteService.findList(peopleNote);
						Map<String, List<PeopleNote>> orgMap = new HashMap<String, List<PeopleNote>>();
						for (PeopleNote pl : peopleList) {
							String key = pl.getOrgname();
							List<PeopleNote> cList = orgMap.get(key);
							if (cList == null) {
								cList = new ArrayList<PeopleNote>();
							}
							cList.add(pl);
							orgMap.put(key, cList);
						}

						List<PeopleNote> peopleGroupList = peopleGroupService.getTuanNextGroupPeople(peopleGroup,matchTypeNote,true);// 取出获胜的部门
						if (peopleGroupList.size() == 2) {// 如果是决赛
							List<PeopleNote> peopleGroup34List = peopleGroupService.getTuanNextGroupPeople(peopleGroup,matchTypeNote,false);// 3/4比赛
							initTuanNextGroup(id, type, stype, matchTypeNote, nextLun, peopleGroup34List, orgMap);
							initTuanNextGroup(id, type, stype, matchTypeNote, nextLun + 1, peopleGroupList, orgMap);
						} else if (peopleGroupList.size() > 2) {// 淘汰赛
							initTuanNextGroup(id, type, stype, matchTypeNote, nextLun, peopleGroupList, orgMap);
						} else {
							addMessage(redirectAttributes, "该类型的比赛已结束，无法继续分组！");
						}
					} else {// 根据出线人数获取要分组的list
						List<PeopleNote> peopleGroupList = peopleGroupService.getNextGroupPeople(peopleGroup, chuxian);// chuxian在16人内未1
						if (peopleGroupList.size() == 2) {// 如果是决赛
							List<PeopleNote> peopleGroup34List = peopleGroupService.get34GroupPeople(peopleGroup);// 3/4比赛
							initNextGroup(id, type, stype, matchTypeNote, nextLun, peopleGroup34List);
							initNextGroup(id, type, stype, matchTypeNote, nextLun + 1, peopleGroupList);
						} else if (peopleGroupList.size() > 2) {// 淘汰赛
							initNextGroup(id, type, stype, matchTypeNote, nextLun, peopleGroupList);
						} else {
							addMessage(redirectAttributes, "该类型的比赛已结束，无法继续分组！");
						}
					}
				} else {
					addMessage(redirectAttributes, "数据异常，请联系管理员！");
				}
			} else {// 否则给处提示
				addMessage(redirectAttributes, "请先录完所有的小组成绩！");
			}
		} else {
			List<PeopleGroup> list = new ArrayList<PeopleGroup>();
			for (Object obj : array) {
				JSONObject jsonObj = (JSONObject) obj;
				PeopleGroup group = new PeopleGroup();
				group.setId(jsonObj.getString("id"));
				group.setScore1(jsonObj.getInt("score"));
				list.add(group);
			}
			peopleGroupService.saveScores(list);
			addMessage(redirectAttributes, "保存成功！");
		}
		return "redirect:matchScore.html?id=" + id + "&stype=" + stype;
	}
	/**
	 * 成绩录入
	 */
	@RequestMapping(value = "matchScore${urlSuffix}")
	public String matchScore(String id, String stype, HttpServletRequest request, Model model) {
		Match match = matchService.get(id);
		if(StringUtils.isEmpty(match.getChangci())||"0".equals(match.getChangci())){
			model.addAttribute("type",1);
		}else{
			model.addAttribute("type",2);
		}
		model.addAttribute("match", match);
		model.addAttribute("stype", stype);
		if ("1".equals(stype)) {// 录
			if (!"3".equals(match.getState())){// 比赛的成绩都录入完毕
				model.addAttribute("overButton", peopleGroupService.checkMatchOver(id));
			}else
				model.addAttribute("overButton", true);
			return "modules/bisai/mark";
		} else {// 查看
			return "modules/bisai/final";
		}
	}
	/**
	 * 赛事分组页面
	 */
	@RequestMapping(value = "term-{matchid}-{type}${urlSuffix}")
	public String tream(@PathVariable String matchid, @PathVariable String type, HttpServletRequest request,
			Model model,RedirectAttributes redirectAttributes) {
		Match match = matchService.get(matchid);
		model.addAttribute("match", match);
		model.addAttribute("type", type);
		List<MatchTypeNote> list = MatchTypeNoteUtils.getMatchTypes(matchid);
		if(list==null||list.size()==0){
			addMessage(redirectAttributes, "比赛类型为空，无法分组！");
			return "modules/bisai/matchPeopleEdit";
		}
		return "modules/bisai/term";
	}
	/**
	 * 赛事分组
	 */
	@RequestMapping(value = "grouping-{matchid}-{type}${urlSuffix}")
	public String grouping(@PathVariable String matchid, @PathVariable String type, HttpServletRequest request,
			Model model) {
		Match match = matchService.get(matchid);
		model.addAttribute("matchid", matchid);
		model.addAttribute("type", type);
		// 进行分组算法保存数据
		MatchTypeNote matchTypeNote = new MatchTypeNote();
		matchTypeNote.setBtype(type);
		matchTypeNote.setMatch(match);
		List<MatchTypeNote> matchTypeList = matchTypeNoteService.findList(matchTypeNote);
		// 清除之前的分组
		PeopleGroup peopleGroup = new PeopleGroup();
		peopleGroup.setMatchid(matchid);
		peopleGroup.setBtype(type);
		peopleGroupService.deleteByTypeNote(peopleGroup);
		if ("2".equals(type)) {
			Map<String, Object> groupMap = new HashMap<String, Object>();
			for (MatchTypeNote typeNode : matchTypeList) {
				// 跟新分组信息
				typeNode.setPeoples(Integer.parseInt(request.getParameter("peoples" + typeNode.getType())));// 分组
				typeNode.setSaizhi(Integer.parseInt(request.getParameter("saizhi" + typeNode.getType())));
				typeNode.setJushu(Integer.parseInt(request.getParameter("jushu" + typeNode.getType())));
				typeNode.setZuchuxian(Integer.parseInt(request.getParameter("zuchuxian" + typeNode.getType())));
				matchTypeNoteService.save(typeNode);
				PeopleNote peopleNote = new PeopleNote();
				peopleNote.setNote(typeNode);
				peopleNote.setState("1");
				List<List<PeopleNote>> ppeopleList = new ArrayList<List<PeopleNote>>();
				// 根据分组数量进行随机分组
				List<PeopleNote> peopleList = peopleNoteService.findList(peopleNote);
				List<PeopleNote> colls = new ArrayList<PeopleNote>();
				Map<String, List<PeopleNote>> orgMap = new HashMap<String, List<PeopleNote>>();
				for (PeopleNote pl : peopleList) {
					String key = pl.getOrgname();
					List<PeopleNote> cList = orgMap.get(key);
					if (cList == null) {
						cList = new ArrayList<PeopleNote>();
						colls.add(pl);
					}
					cList.add(pl);
					orgMap.put(key, cList);
				}
				// 查询出所有的部门来
				int groupnums = typeNode.getPeoples();// 分组数量
				int peoples = colls.size() / groupnums;// 每组人数
				for (int group = 0; group < groupnums; group++) {
					List<PeopleNote> list = new ArrayList<PeopleNote>();
					do {
						int randomIndex = Math.abs(new Random().nextInt(colls.size()));
						list.add(colls.remove(randomIndex));
					} while (list.size() < peoples);
					ppeopleList.add(list);
				}
				// 根据部门进行分组
				List<List<PeopleNote[]>> groupList = GroupUtils.BiSaifenzu(ppeopleList);
				groupMap.put(typeNode.getId(), groupList); // 把分组放入缓存
				Map<String, List<PeopleNote[]>> groupsMap = new HashMap<String, List<PeopleNote[]>>();
				for (int group = 0, groups = groupList.size(); group < groups; group++) {// 组
					List<PeopleNote[]> pl = groupList.get(group);
					for (int cc = 0, ccs = pl.size(); cc < ccs; cc++) {// 场
						PeopleNote[] notes = pl.get(cc);
						String key = notes[0].getOrgname();
						List<PeopleNote> list0 = orgMap.get(notes[0].getOrgname());
						List<PeopleNote> list1 = orgMap.get(notes[1].getOrgname());
						groupsMap.put(key, new ArrayList<PeopleNote[]>());
						for (int changci = 0; changci < typeNode.getNum(); changci++) {
							for (int jushu = 1, sum = typeNode.getJushu(); jushu <= sum; jushu++) {
								PeopleNote peoplec1 = list0.get(changci);
								PeopleNote peoplec2 = list1.get(changci);
								PeopleNote[] arr = new PeopleNote[2];
								arr[0] = peoplec1;
								arr[1] = peoplec2;
								groupsMap.get(key).add(arr);
								// 根据部门下的人进行场次组装分组
								// 保存人员分组记录
								PeopleGroup people = new PeopleGroup();
								people.setMatchid(matchid);
								people.setBtype(type);
								people.setType(typeNode.getType());
								people.setGroupnum(String.valueOf(1 + group));
								people.setChang(String.valueOf(1 + changci));
								people.setPeopleNote(peoplec1);
								people.setJushu(jushu + "");
								people.setLun("1");
								peopleGroupService.save(people);
								people = new PeopleGroup();
								people.setMatchid(matchid);
								people.setBtype(type);
								people.setType(typeNode.getType());
								people.setGroupnum(String.valueOf(1 + group));
								people.setChang(String.valueOf(1 + changci));
								people.setPeopleNote(peoplec2);
								people.setJushu(jushu + "");
								people.setLun("1");
								peopleGroupService.save(people);
							}
						}
					}
				}
				model.addAttribute("groupcMap", groupsMap);
			}
			model.addAttribute("groupMap", groupMap);
		} else {// 单项赛
			Map<String, Object> groupMap = new HashMap<String, Object>();
			for (MatchTypeNote typeNode : matchTypeList) {
				// 跟新分组信息
				typeNode.setPeoples(Integer.parseInt(request.getParameter("peoples" + typeNode.getType())));// 分组
				typeNode.setSaizhi(Integer.parseInt(request.getParameter("saizhi" + typeNode.getType())));
				typeNode.setJushu(Integer.parseInt(request.getParameter("jushu" + typeNode.getType())));
				typeNode.setZuchuxian(Integer.parseInt(request.getParameter("zuchuxian" + typeNode.getType())));
				matchTypeNoteService.save(typeNode);
				PeopleNote peopleNote = new PeopleNote();
				peopleNote.setNote(typeNode);
				peopleNote.setState("1");
				List<List<PeopleNote>> ppeopleList = new ArrayList<List<PeopleNote>>();
				// 根据分组数量进行随机分组
				List<PeopleNote> peopleList = peopleNoteService.findList(peopleNote);
				int groupnums = typeNode.getPeoples();// 分组数量
				int peoples = peopleList.size() / groupnums;// 每组人数
				for (int group = 0; group < groupnums; group++) {
					List<PeopleNote> list = new ArrayList<PeopleNote>();
					do {
						int randomIndex = Math.abs(new Random().nextInt(peopleList.size()));
						list.add(peopleList.remove(randomIndex));
					} while (list.size() < peoples);
					ppeopleList.add(list);
				}
				List<List<PeopleNote[]>> groupList = GroupUtils.BiSaifenzu(ppeopleList);
				groupMap.put(typeNode.getId(), groupList); // 把分组放入缓存
				for (int group = 0, groups = groupList.size(); group < groups; group++) {// 组
					List<PeopleNote[]> pl = groupList.get(group);
					for (int cc = 0, ccs = pl.size(); cc < ccs; cc++) {// 场
						for (int jushu = 1, sum = typeNode.getJushu(); jushu <= sum; jushu++) {
							PeopleNote[] note = pl.get(cc);
							// 保存人员分组记录
							PeopleGroup people = new PeopleGroup();
							people.setMatchid(matchid);
							people.setBtype(type);
							people.setType(typeNode.getType());
							people.setGroupnum(String.valueOf(1 + group));
							people.setChang(String.valueOf(1 + cc));
							people.setPeopleNote(note[0]);
							people.setJushu(jushu + "");
							people.setLun("1");
							peopleGroupService.save(people);
							people = new PeopleGroup();
							people.setMatchid(matchid);
							people.setBtype(type);
							people.setType(typeNode.getType());
							people.setGroupnum(String.valueOf(1 + group));
							people.setChang(String.valueOf(1 + cc));
							people.setPeopleNote(note[1]);
							people.setJushu(jushu + "");
							people.setLun("1");
							peopleGroupService.save(people);
						}
					}
				}
			}
			model.addAttribute("groupMap", groupMap);
		}
		// 校验是否都分组完成，分组完成后修改比赛状态
		if (peopleGroupService.checkGroupEnd(matchid) == 0) {
			match.setState("2");// 报名完成进入进行中
			matchService.updateMatchState(match);
		}

		// 更新赛事状态
		return "modules/bisai/grouping";
	}
	/**
	 * 关闭赛事
	 */
	@RequestMapping(value = "closeMatch${urlSuffix}")
	public String closeMatch(String id, HttpServletRequest request, Model model) {
		Match match = matchService.get(id);
		match.setState("-1");
		matchService.updateMatchState(match);
		return "redirect:"+Global.getAdminPath()+"/bisai/match/?repage";
	}
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
	@RequestMapping(value = "peopleUpdate")
	public String peopleUpdate(Match match, Model model) {
		model.addAttribute("match", match);
		if(StringUtils.isEmpty(match.getChangci())||"0".equals(match.getChangci())){
			model.addAttribute("type",1);
		}else{
			model.addAttribute("type",2);
		}
		return "modules/bisai/matchPeopleEdit";
	}

	@RequiresPermissions("bisai:match:edit")
	@RequestMapping(value = "save")
	public String save(Match match, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, match)){
			return form(match, model);
		}
		//match.setAccount(account);//根据扫码登陆的账号获取对应的账号没有需要增加后赋予
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
	    match.setUser(UserUtils.getUser());
        matchService.updateMatchState(match);
        addMessage(redirectAttributes, "比赛申请通过");
        return "redirect:"+Global.getAdminPath()+"/bisai/match/?repage";
    }
	private void initNextGroup(String id, String type, String stype, MatchTypeNote matchTypeNote, int nextLun,
			List<PeopleNote> peopleGroup34List) {
		for (int i = 0, zu = 1, j = peopleGroup34List.size(); i < j; zu++, i += 2) {// 进行淘汰赛
			for (int jushu = 1, sum = matchTypeNote.getJushu(); jushu <= sum; jushu++) {
				PeopleNote note1 = peopleGroup34List.get(i);
				PeopleNote note2 = peopleGroup34List.get(i + 1);
				// 保存人员分组记录
				PeopleGroup people = new PeopleGroup();
				people.setMatchid(id);
				people.setBtype(type);
				people.setType(stype);
				people.setGroupnum(String.valueOf(zu));
				people.setChang(String.valueOf(1));
				people.setPeopleNote(note1);
				people.setJushu(jushu + "");
				people.setLun(nextLun + "");
				peopleGroupService.save(people);
				people = new PeopleGroup();
				people.setMatchid(id);
				people.setBtype(type);
				people.setType(stype);
				people.setGroupnum(String.valueOf(zu));
				people.setChang(String.valueOf(1));
				people.setPeopleNote(note2);
				people.setJushu(jushu + "");
				people.setLun(nextLun + "");
				peopleGroupService.save(people);
			}
		}
	}

	private void initTuanNextGroup(String id, String type, String stype, MatchTypeNote matchTypeNote, int nextLun,
			List<PeopleNote> orgList, Map<String, List<PeopleNote>> orgMap) {
		for (int i = 0, zu = 1, j = orgList.size(); i < j; zu++, i += 2) {// 进行淘汰赛
			List<PeopleNote> list0 = orgMap.get(orgList.get(i).getOrgname());
			List<PeopleNote> list1 = orgMap.get(orgList.get(i+1).getOrgname());
			for (int changci = 0; changci < matchTypeNote.getNum(); changci++) {// 根据场次获取pk人员
				for (int jushu = 1, sum = matchTypeNote.getJushu(); jushu <= sum; jushu++) {
					PeopleNote peoplec1 = list0.get(changci);
					PeopleNote peoplec2 = list1.get(changci);
					// 根据部门下的人进行场次组装分组
					// 保存人员分组记录
					PeopleGroup people = new PeopleGroup();
					people.setMatchid(id);
					people.setBtype(type);
					people.setType(stype);
					people.setGroupnum(String.valueOf(zu));
					people.setChang(String.valueOf(1 + changci));
					people.setPeopleNote(peoplec1);
					people.setJushu(jushu + "");
					people.setLun(String.valueOf(nextLun));
					peopleGroupService.save(people);
					people = new PeopleGroup();
					people.setMatchid(id);
					people.setBtype(type);
					people.setType(stype);
					people.setGroupnum(String.valueOf(zu));
					people.setChang(String.valueOf(1 + changci));
					people.setPeopleNote(peoplec2);
					people.setJushu(jushu + "");
					people.setLun(String.valueOf(nextLun));
					peopleGroupService.save(people);
				}
			}
		}
	}	
}