package com.thinkgem.jeesite.modules.bisai.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleNote;

/**
 * 参赛人员记录DAO接口
 * @author 小风
 * @version 2017-03-07
 */
@MyBatisDao
public interface PeopleNoteDao extends CrudDao<PeopleNote> {
	
}