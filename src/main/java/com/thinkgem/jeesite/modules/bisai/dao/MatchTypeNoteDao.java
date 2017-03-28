/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;

/**
 * 比赛类型记录DAO接口
 * @author 小风
 * @version 2017-03-07
 */
@MyBatisDao
public interface MatchTypeNoteDao extends CrudDao<MatchTypeNote> {
	  /**   
	 * @Title: deleteByMatch   
	 * @Description: 根据match删除对应的比赛类型记录
	 * @param matchid
	 * @author  author
	 */
	 
	void deleteByMatch(String matchid);
	/**
	 * 获取比赛参赛人数
	 * @param matchid
	 * @return
	 */
	int getMatchPeopleCount(String matchid);
}