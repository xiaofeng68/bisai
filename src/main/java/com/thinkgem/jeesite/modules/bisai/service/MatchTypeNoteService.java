/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;
import com.thinkgem.jeesite.modules.bisai.dao.MatchTypeNoteDao;

/**
 * 比赛类型记录Service
 * @author 小风
 * @version 2017-03-07
 */
@Service
@Transactional(readOnly = true)
public class MatchTypeNoteService extends CrudService<MatchTypeNoteDao, MatchTypeNote> {

	public MatchTypeNote get(String id) {
		return super.get(id);
	}
	
	public List<MatchTypeNote> findList(MatchTypeNote matchTypeNote) {
		return super.findList(matchTypeNote);
	}
	
	public Page<MatchTypeNote> findPage(Page<MatchTypeNote> page, MatchTypeNote matchTypeNote) {
		return super.findPage(page, matchTypeNote);
	}
	
	@Transactional(readOnly = false)
	public void save(MatchTypeNote matchTypeNote) {
		super.save(matchTypeNote);
	}
	
	@Transactional(readOnly = false)
	public void delete(MatchTypeNote matchTypeNote) {
		super.delete(matchTypeNote);
	}
	
}