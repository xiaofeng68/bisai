package com.thinkgem.jeesite.modules.bisai.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bisai.entity.MatchResult;
import com.thinkgem.jeesite.modules.bisai.dao.MatchResultDao;

/**
 * 比赛结果Service
 * @author 小风
 * @version 2017-03-28
 */
@Service
@Transactional(readOnly = true)
public class MatchResultService extends CrudService<MatchResultDao, MatchResult> {

	public MatchResult get(String id) {
		return super.get(id);
	}
	
	public List<MatchResult> findList(MatchResult matchResult) {
		return super.findList(matchResult);
	}
	
	public Page<MatchResult> findPage(Page<MatchResult> page, MatchResult matchResult) {
		return super.findPage(page, matchResult);
	}
	
	@Transactional(readOnly = false)
	public void save(MatchResult matchResult) {
		super.save(matchResult);
	}
	
	@Transactional(readOnly = false)
	public void delete(MatchResult matchResult) {
		super.delete(matchResult);
	}
	
}