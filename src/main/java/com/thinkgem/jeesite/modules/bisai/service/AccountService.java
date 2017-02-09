/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bisai.entity.Account;
import com.thinkgem.jeesite.modules.bisai.dao.AccountDao;

/**
 * 比赛账号Service
 * @author 小风
 * @version 2017-02-09
 */
@Service
@Transactional(readOnly = true)
public class AccountService extends CrudService<AccountDao, Account> {

	public Account get(String id) {
		return super.get(id);
	}
	
	public List<Account> findList(Account account) {
		return super.findList(account);
	}
	
	public Page<Account> findPage(Page<Account> page, Account account) {
		return super.findPage(page, account);
	}
	
	@Transactional(readOnly = false)
	public void save(Account account) {
		super.save(account);
	}
	
	@Transactional(readOnly = false)
	public void delete(Account account) {
		super.delete(account);
	}
	/**   
     * @Title: getAccountByOpenId   
     * @Description: 根据openid获取用户信息
     * @param openId
     * @return
     * @author  author
     */
     
    public Account getAccountByOpenId(String openId){
        return dao.getAccountByOpenId(openId);
    }
    /**   
     * @Title: getAccountByPhone   
     * @Description: 根据手机号获取账号信息
     * @param phone
     * @return
     * @author  author
     */
     
    public Account getAccountByPhone(String phone){
        return dao.getAccountByPhone(phone);
    }
}