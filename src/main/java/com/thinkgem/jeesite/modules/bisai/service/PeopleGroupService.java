package com.thinkgem.jeesite.modules.bisai.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bisai.dao.PeopleGroupDao;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleGroup;

/**
 * 分组Service
 * @author 小风
 * @version 2017-02-09
 */
@Service
@Transactional(readOnly = true)
public class PeopleGroupService extends CrudService<PeopleGroupDao, PeopleGroup> {
    
	public PeopleGroup get(String id) {
		return super.get(id);
	}
	
	public List<PeopleGroup> findList(PeopleGroup match) {
		return super.findList(match);
	}
	
	public Page<PeopleGroup> findPage(Page<PeopleGroup> page, PeopleGroup match) {
		return super.findPage(page, match);
	}
	@Transactional(readOnly = false)
	public void save(PeopleGroup match) {
		super.save(match);
	}
	
	@Transactional(readOnly = false)
	public void delete(PeopleGroup match) {
		super.delete(match);
	}
	@Transactional(readOnly = false)
	public void deleteByTypeNote(PeopleGroup peopleGroup){
	    dao.deleteByTypeNote(peopleGroup);
	}
	public int checkGroupEnd(String matchid){
	    return dao.checkGroupEnd(matchid);
	}
}