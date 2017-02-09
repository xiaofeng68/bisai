/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.bisai.entity.Account;

/**
 * 比赛账号DAO接口
 * @author 小风
 * @version 2017-02-09
 */
@MyBatisDao
public interface AccountDao extends CrudDao<Account> {
    /**   
     * @Title: getAccountByOpenId   
     * @Description: 根据openid获取账号
     * @param openId
     * @return
     * @author  author
     */
     
    Account getAccountByOpenId(String openId);
    /**   
     * @Title: getAccountByPhone   
     * @Description: 根据手机号获取账号信息
     * @param phone
     * @return
     * @author  author
     */
    Account getAccountByPhone(String phone);
}