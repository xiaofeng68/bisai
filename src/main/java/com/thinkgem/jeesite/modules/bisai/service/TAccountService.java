/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bisai.entity.TAccount;
import com.thinkgem.jeesite.modules.bisai.dao.TAccountDao;

/**
 * 用户账号Service
 * @author 小风
 * @version 2017-02-05
 */
@Service
@Transactional(readOnly = true)
public class TAccountService extends CrudService<TAccountDao, TAccount> {

	public TAccount get(String id) {
		return super.get(id);
	}
	/**   
	 * @Title: getAccountByOpenId   
	 * @Description: 根据openid获取用户信息
	 * @param openId
	 * @return
	 * @author  author
	 */
	 
	public TAccount getAccountByOpenId(String openId){
	    return dao.getAccountByOpenId(openId);
	}
	/**   
	 * @Title: getAccountByPhone   
	 * @Description: 根据手机号获取账号信息
	 * @param openId
	 * @return
	 * @author  author
	 */
	 
	public TAccount getAccountByPhone(String openId){
        return dao.getAccountByOpenId(openId);
    }
	public List<TAccount> findList(TAccount tAccount) {
		return super.findList(tAccount);
	}
	
	public Page<TAccount> findPage(Page<TAccount> page, TAccount tAccount) {
		return super.findPage(page, tAccount);
	}
	
	@Transactional(readOnly = false)
	public void save(TAccount tAccount) {
		super.save(tAccount);
	}
	
	@Transactional(readOnly = false)
	public void delete(TAccount tAccount) {
		super.delete(tAccount);
	}
	
}