/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bisai.dao.MatchDao;
import com.thinkgem.jeesite.modules.bisai.entity.Match;

/**
 * 比赛信息Service
 * @author 小风
 * @version 2017-02-09
 */
@Service
@Transactional(readOnly = true)
public class MatchService extends CrudService<MatchDao, Match> {
    
	public Match get(String id) {
		return super.get(id);
	}
	
	public List<Match> findList(Match match) {
		return super.findList(match);
	}
	
	public Page<Match> findPage(Page<Match> page, Match match) {
		return super.findPage(page, match);
	}
	
	@Transactional(readOnly = false)
	public void save(Match match) {
		super.save(match);
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
	}
	
}