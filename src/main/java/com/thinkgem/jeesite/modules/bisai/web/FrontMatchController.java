package com.thinkgem.jeesite.modules.bisai.web;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.bisai.entity.Match;
import com.thinkgem.jeesite.modules.bisai.service.AccountService;
import com.thinkgem.jeesite.modules.bisai.service.MatchService;


@Controller
@RequestMapping(value = "${frontPath}/match")
public class FrontMatchController extends BaseController {
    @Autowired
    private AccountService accountService;
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
    
    
}
