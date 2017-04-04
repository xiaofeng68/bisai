package com.thinkgem.jeesite.modules.bisai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bisai.dao.MatchTypeNoteDao;
import com.thinkgem.jeesite.modules.bisai.dao.PeopleNoteDao;
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleNote;
import com.thinkgem.jeesite.modules.bisai.util.MatchTypeNoteUtils;
import com.thinkgem.jeesite.modules.bisai.util.PeopleNoteUtils;

/**
 * 参赛人员记录Service
 * @author 小风
 * @version 2017-03-07
 */
@Service
@Transactional(readOnly = true)
public class PeopleNoteService extends CrudService<PeopleNoteDao, PeopleNote> {
    @Autowired
    MatchTypeNoteDao matchTypeNoteDao;
	public PeopleNote get(String id) {
		return super.get(id);
	}
	
	public List<PeopleNote> findList(PeopleNote peopleNote) {
		return super.findList(peopleNote);
	}
	
	public Page<PeopleNote> findPage(Page<PeopleNote> page, PeopleNote peopleNote) {
		return super.findPage(page, peopleNote);
	}
	
	@Transactional(readOnly = false)
	public void save(PeopleNote peopleNote) {
		super.save(peopleNote);
		//更新typeNode的数量
		MatchTypeNote typeNode = matchTypeNoteDao.get(peopleNote.getNote().getId());
		matchTypeNoteDao.updateCount(typeNode);
		MatchTypeNoteUtils.clearCache(typeNode);
		PeopleNoteUtils.clearCache(peopleNote);
	}
	
	@Transactional(readOnly = false)
	public void delete(PeopleNote peopleNote) {
		super.delete(peopleNote);
		PeopleNoteUtils.clearCache(peopleNote);
	}
	
}