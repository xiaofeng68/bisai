package com.thinkgem.jeesite.modules.bisai.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleGroup;

/**
 * 人员分组DAO接口
 * @author 小风
 * @version 2017-03-18
 */
@MyBatisDao
public interface PeopleGroupDao extends CrudDao<PeopleGroup> {
    public void deleteByTypeNote(PeopleGroup peopleGroup);
}