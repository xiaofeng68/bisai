package com.thinkgem.jeesite.modules.bisai.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.bisai.entity.MatchResult;

/**
 * 比赛结果DAO接口
 * @author 小风
 * @version 2017-03-28
 */
@MyBatisDao
public interface MatchResultDao extends CrudDao<MatchResult> {
	void deleteByMatch(String matchid);
	
	List<MatchResult> findTopResult(MatchResult result);
	void refashOrg();
}