package com.thinkgem.jeesite.modules.bisai.util;

import java.util.ArrayList;
import java.util.List;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.bisai.dao.BaomingOrgDao;
import com.thinkgem.jeesite.modules.bisai.entity.BaomingOrg;
import com.thinkgem.jeesite.modules.bisai.entity.Match;

/**
 * 单位工具类
 * @author 
 * @version 2013-5-29
 */
public class BaomingOrgUtils {
	
	private static BaomingOrgDao baomingOrgDao = SpringContextHolder.getBean(BaomingOrgDao.class);

//	public static final String CACHE_SETTING_MAP = "baomingOrgMap";
	
    public static List<BaomingOrg> getBaomingOrg(String matchid){
		if(StringUtils.isEmpty(matchid)) return new ArrayList<BaomingOrg>();
	    BaomingOrg note = new BaomingOrg();
	    Match match = new Match();
	    match.setId(matchid);
	    note.setMatch(match);
	    List<BaomingOrg> list = baomingOrgDao.findList(note);
		return list;
	}
	public static void clearCache(BaomingOrg note){
    }
}
