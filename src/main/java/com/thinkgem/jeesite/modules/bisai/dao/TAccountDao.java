/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.bisai.entity.TAccount;

/**
 * 用户账号DAO接口
 * @author 小风
 * @version 2017-02-05
 */
@MyBatisDao
public interface TAccountDao extends CrudDao<TAccount> {
    /**   
     * @Title: getAccountByOpenId   
     * @Description: 根据openid获取账号
     * @param openId
     * @return
     * @author  author
     */
     
    TAccount getAccountByOpenId(String openId);
}