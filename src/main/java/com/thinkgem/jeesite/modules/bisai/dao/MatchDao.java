/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.bisai.entity.Match;

/**
 * 比赛信息DAO接口
 * @author 小风
 * @version 2017-02-09
 */
@MyBatisDao
public interface MatchDao extends CrudDao<Match> {
	/**   
	 * @Title: updateMatchState   
	 * @Description: 更新比赛状态
	 * @param match
	 * @author  author
	 */
	 
	void updateMatchState(Match match);
}