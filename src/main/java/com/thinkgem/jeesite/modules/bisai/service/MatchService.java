/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bisai.dao.MatchDao;
import com.thinkgem.jeesite.modules.bisai.dao.MatchTypeNoteDao;
import com.thinkgem.jeesite.modules.bisai.entity.Match;
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;
import com.thinkgem.jeesite.modules.bisai.util.MatchTypeNoteUtils;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 比赛信息Service
 * @author 小风
 * @version 2017-02-09
 */
@Service
@Transactional(readOnly = true)
public class MatchService extends CrudService<MatchDao, Match> {
    @Autowired
    MatchTypeNoteDao matchTypeNoteDao;
    
	public Match get(String id) {
		return super.get(id);
	}
	
	public List<Match> findList(Match match) {
		return super.findList(match);
	}
	
	public Page<Match> findPage(Page<Match> page, Match match) {
		return super.findPage(page, match);
	}
	public Page<Match> findAllMatch(Page<Match> page){
	    Match match = new Match();
        match.setPage(page);
        page.setList(dao.findAllMatch(match));
	    return page;
	}
	@Transactional(readOnly = false)
	public void save(Match match) {
		super.save(match);
		//根据type生成对应的类型记录
		matchTypeNoteDao.deleteByMatch(match.getId());
		String type = match.getType();
		String[] typeArr = type.split(";");
		if(typeArr.length>0)
		if(!StringUtils.isEmpty(typeArr[0])){
		    MatchTypeNote typeNode=null;
		    String[] type1Arr = typeArr[0].split(",");
		    for(int i=0,j=type1Arr.length;i<j;i++){
    		    typeNode = new MatchTypeNote();
    		    typeNode.setBtype("1");
    		    typeNode.setMatch(match);
    		    typeNode.setNum(0);
    		    typeNode.setCounts(0);
    		    typeNode.setType(DictUtils.getDictValue(type1Arr[i],"MatchTypeNote_type","0"));
    		    matchTypeNoteDao.insert(typeNode);
		    }
		    if(typeNode!=null)
		        MatchTypeNoteUtils.clearCache(typeNode);
		}
		if(typeArr.length>1)
		if(!StringUtils.isEmpty(typeArr[1])){
		    MatchTypeNote typeNode=null;
		    String[] type2Arr = typeArr[1].split(",");
            for(int i=0,j=type2Arr.length;i<j;i++){
                String[] ctype = type2Arr[i].split(":");
                typeNode = new MatchTypeNote();
                typeNode.setBtype("2");
                typeNode.setMatch(match);
                typeNode.setNum(Integer.parseInt(ctype[1]));
                typeNode.setCounts(0);
                typeNode.setType(DictUtils.getDictValue(ctype[0],"MatchTypeNote_type","0"));
                matchTypeNoteDao.insert(typeNode);
            }
            if(typeNode!=null)
                MatchTypeNoteUtils.clearCache(typeNode);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(Match match) {
		super.delete(match);
	}
	/**   
	 * @Title: updateMatchState   
	 * @Description: 更新比赛状态
	 * @param match
	 * @author  author
	 */
	 
	@Transactional(readOnly = false)
	public void updateMatchState(Match match){
	    dao.updateMatchState(match);
	    //计算结果
	    
	}
	
}