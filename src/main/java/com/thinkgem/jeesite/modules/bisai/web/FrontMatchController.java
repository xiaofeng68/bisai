package com.thinkgem.jeesite.modules.bisai.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.utils.Json;
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


@Controller
@RequestMapping(value = "${frontPath}/match")
public class FrontMatchController extends BaseController {
    @Autowired
    private PeopleNoteService peopleNoteService;
    @Autowired
    private MatchTypeNoteService matchTypeNoteService;
    @Autowired
    private MatchService matchService;
    @Autowired
    private PeopleGroupService peopleGroupService;
    
    @RequestMapping(value="editMatch${urlSuffix}")
    public String editMatch(Match match,HttpServletRequest request ,Model model) {
        if(match!=null){
            match = matchService.get(match.getId());
            model.addAttribute("match", match);
        }
        return "modules/bisai/front/apply";
    }
    @RequestMapping(value="closeMatch${urlSuffix}")
    public String closeMatch(String id,HttpServletRequest request ,Model model) {
        Match match = matchService.get(id);
        match.setState("-1");
        matchService.updateMatchState(match);
        return "modules/bisai/front/match";
    }
    @RequestMapping(value="matchBm${urlSuffix}")
    public String matchBm(String type,String id,HttpServletRequest request ,Model model,RedirectAttributes redirectAttributes) {
        Match match = matchService.get(id);
        model.addAttribute("match", match);
        model.addAttribute("type", type);
        //校验是否生成过对一个的分组
        PeopleGroup peopleGroup = new PeopleGroup();
        peopleGroup.setMatchid(id);
        peopleGroup.setBtype(type);
        List<PeopleGroup> list = peopleGroupService.findList(peopleGroup);
        if(list!=null&&list.size()>0){
            addMessage(redirectAttributes, "已分组完成");
            return "redirect:../match.html";
        } 
        return "modules/bisai/front/baoming";
    }
    @RequestMapping(value="matchScore${urlSuffix}")
    public String matchScore(String id,String type,HttpServletRequest request ,Model model) {
        Match match = matchService.get(id);
        model.addAttribute("type", type);
        model.addAttribute("match", match);
        if("1".equals(type)){//录
            return "modules/bisai/front/mark";
        }else{//查看
            return "modules/bisai/front/final";
        }
    }
    @RequestMapping(value="matchRecreate${urlSuffix}")
    public String matchRecreate(String id,HttpServletRequest request ,Model model) {
        //复制比赛信息
        Match match = matchService.get(id);
        match.setId(null);
        matchService.save(match);
        //复制类型
        
        return "modules/bisai/front/match";
    }
    @RequestMapping(value="term-{matchid}-{type}${urlSuffix}")
    public String tream(@PathVariable String matchid,@PathVariable String type,HttpServletRequest request ,Model model) {
        Match match = matchService.get(matchid);
        model.addAttribute("match", match);
        model.addAttribute("type",type);
        return "modules/bisai/front/term";
    }
    @RequestMapping(value="grouping-{matchid}-{type}${urlSuffix}")
    public String grouping(@PathVariable String matchid,@PathVariable String type,HttpServletRequest request ,Model model) {
        Match match = matchService.get(matchid);
        model.addAttribute("matchid",matchid);
        model.addAttribute("type",type);
        //进行分组算法保存数据
        MatchTypeNote matchTypeNote = new MatchTypeNote();
        matchTypeNote.setBtype(type);
        matchTypeNote.setMatch(match);
        List<MatchTypeNote> matchTypeList = matchTypeNoteService.findList(matchTypeNote);
        // 清除之前的分组
        PeopleGroup peopleGroup = new PeopleGroup();
        peopleGroup.setMatchid(matchid);
        peopleGroup.setBtype(type);
        peopleGroupService.deleteByTypeNote(peopleGroup);
        Map<String,Object> groupMap = new HashMap<String,Object>();
        for(MatchTypeNote typeNode : matchTypeList){
            //跟新分组信息
            typeNode.setPeoples(Integer.parseInt(request.getParameter("peoples"+typeNode.getType())));
            typeNode.setSaizhi(Integer.parseInt(request.getParameter("saizhi"+typeNode.getType())));
            typeNode.setJushu(Integer.parseInt(request.getParameter("jushu"+typeNode.getType())));
            typeNode.setZuchuxian(Integer.parseInt(request.getParameter("zuchuxian"+typeNode.getType())));
            matchTypeNoteService.save(typeNode);
            PeopleNote peopleNote = new PeopleNote();
            peopleNote.setNote(typeNode);
            List<List<PeopleNote>> ppeopleList = new ArrayList<List<PeopleNote>>();
            List<PeopleNote> peopleList = peopleNoteService.findList(peopleNote);
            ppeopleList.add(peopleList);
            List<List<PeopleNote[]>> groupList = GroupUtils.BiSaifenzu(ppeopleList);
            groupMap.put(typeNode.getId(), groupList); //把分组放入缓存
            for(int group=0,groups=groupList.size();group<groups;group++){//组
                List<PeopleNote[]> pl = groupList.get(group);
                for(int cc=0,ccs = pl.size();cc<ccs;cc++){//场
                    PeopleNote[] note = pl.get(cc);
                    //保存人员分组记录
                    PeopleGroup people = new PeopleGroup();
                    people.setMatchid(matchid);
                    people.setBtype(type);
                    people.setType(typeNode.getType());
                    people.setGroupnum(String.valueOf(1+group));
                    people.setChang(String.valueOf(1+cc));
                    people.setPeopleNote(note[0]);
                    peopleGroupService.save(people);
                    people = new PeopleGroup();
                    people.setMatchid(matchid);
                    people.setBtype(type);
                    people.setType(typeNode.getType());
                    people.setGroupnum(String.valueOf(1+group));
                    people.setChang(String.valueOf(1+cc));
                    people.setPeopleNote(note[1]);
                    peopleGroupService.save(people);
                }
            }
        }
        model.addAttribute("groupMap",groupMap);
        //校验是否都分组完成，分组完成后修改比赛状态
        if(peopleGroupService.checkGroupEnd(matchid)>0){
            match.setState("2");//报名完成进入进行中
        }
        
        //更新赛事状态
        return "modules/bisai/front/grouping";
    }
    @RequestMapping(value="savePeopleNote")
    @ResponseBody
    public Json savePeopleNote(PeopleNote peopleNote,String typeid,HttpServletRequest request ,Model model) {
        Json json = new Json();
        try{
            MatchTypeNote note = new MatchTypeNote();
            note.setId(typeid);
            peopleNote.setNote(note);
            peopleNoteService.save(peopleNote);
            json.setObj(peopleNote);
            json.setSuccess(true);
        }catch(Exception e){
            e.printStackTrace();
            json.setSuccess(false);
            json.setMsg("保存失败");
        }
        return json;
    }
    @RequestMapping(value="updatePeopleNote")
    @ResponseBody
    public Json updatePeopleNote(PeopleNote peopleNote,HttpServletRequest request) {
        Json json = new Json();
        try{
            PeopleNote cpeopleNote = peopleNoteService.get(peopleNote.getId());
            cpeopleNote.setState(peopleNote.getState());
            peopleNoteService.save(cpeopleNote);
            json.setObj(peopleNote);
            json.setSuccess(true);
        }catch(Exception e){
            e.printStackTrace();
            json.setSuccess(false);
            if("1".equals(peopleNote.getState())){
                json.setMsg("踢出失败");
            }else{
                json.setMsg("恢复失败");
            }
        }
        return json;
    }
    
}
