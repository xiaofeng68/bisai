package com.thinkgem.jeesite.modules.bisai.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bisai.dao.BaomingOrgDao;
import com.thinkgem.jeesite.modules.bisai.entity.BaomingOrg;
import com.thinkgem.jeesite.modules.bisai.util.BaomingOrgUtils;

/**
 * 单位Service
 * @author 小风
 * @version 2017-03-26
 */
@Service
@Transactional(readOnly = true)
public class BaomingOrgService extends CrudService<BaomingOrgDao, BaomingOrg> {

	
	public BaomingOrg get(String id) {
		BaomingOrg baomingOrg = super.get(id);
		return baomingOrg;
	}
	
	public List<BaomingOrg> findList(BaomingOrg baomingOrg) {
		return super.findList(baomingOrg);
	}
	
	public Page<BaomingOrg> findPage(Page<BaomingOrg> page, BaomingOrg baomingOrg) {
		return super.findPage(page, baomingOrg);
	}
	
	@Transactional(readOnly = false)
	public void save(BaomingOrg baomingOrg) {
		super.save(baomingOrg);
		BaomingOrgUtils.clearCache(baomingOrg);
	}
	
	@Transactional(readOnly = false)
	public void delete(BaomingOrg baomingOrg) {
		super.delete(baomingOrg);
		BaomingOrgUtils.clearCache(baomingOrg);
	}
	
}