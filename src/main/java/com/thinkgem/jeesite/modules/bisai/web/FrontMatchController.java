package com.thinkgem.jeesite.modules.bisai.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.utils.Json;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.bisai.entity.Match;
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleNote;
import com.thinkgem.jeesite.modules.bisai.service.MatchService;
import com.thinkgem.jeesite.modules.bisai.service.MatchTypeNoteService;
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
    public String matchBm(String type,String id,HttpServletRequest request ,Model model) {
        Match match = matchService.get(id);
        model.addAttribute("match", match);
        model.addAttribute("type", type);
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
    @RequestMapping(value="grouping-${matchid}-${type}${urlSuffix}")
    public String grouping(@PathVariable String matchid,@PathVariable String type,HttpServletRequest request ,Model model) {
        //进行分组算法保存数据
        MatchTypeNote matchTypeNote = new MatchTypeNote();
        Match match = new Match();
        match.setId(matchid);
        matchTypeNote.setMatch(match);
        List<MatchTypeNote> matchTypeList = matchTypeNoteService.findList(matchTypeNote);
        for(MatchTypeNote typeNode : matchTypeList){
            if(typeNode.getBtype().equals(1)){//单项赛
                PeopleNote peopleNote = new PeopleNote();
                peopleNote.setNote(typeNode);
                List<PeopleNote> peopleList = peopleNoteService.findList(peopleNote);
                List<List<PeopleNote>> list = GroupUtils.fenzu(peopleList,2,"1");
                int group=1;
                for(List<PeopleNote> pl : list){//组
                    
                    for(PeopleNote note : pl){
                        //保存人员参赛记录
                        
                    }
                }
            }else{//团队赛
                
            }
        }
        return "modules/bisai/front/grouping";
    }
    @RequestMapping(value="savePeopleNote${urlSuffix}",method=RequestMethod.POST)
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
    
}
