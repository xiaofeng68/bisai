package com.thinkgem.jeesite.modules.bisai.util;

import java.util.ArrayList;
import java.util.List;

import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.bisai.dao.MatchTypeNoteDao;
import com.thinkgem.jeesite.modules.bisai.entity.Match;
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;

/**
 * 比赛类型记录工具类
 * @author 
 * @version 2013-5-29
 */
public class MatchTypeNoteUtils {
	
	private static MatchTypeNoteDao matchTypeNoteDao = SpringContextHolder.getBean(MatchTypeNoteDao.class);

	
    public static List<MatchTypeNote> getMatchTypeNote(String matchid,String type){
		if(StringUtils.isEmpty(matchid)) return new ArrayList<MatchTypeNote>();
		List<MatchTypeNote> list = null;//(List<MatchTypeNote>) CacheUtils.get(CACHE_SETTING_MAP+":mt:"+matchid+":"+type);
		if(list==null){
		    MatchTypeNote note = new MatchTypeNote();
		    Match match = new Match();
		    match.setId(matchid);
		    note.setBtype(type);
		    note.setMatch(match);
		    list = matchTypeNoteDao.findList(note);
		    //CacheUtils.put(CACHE_SETTING_MAP+":mt:"+matchid+":"+type,list);
		}
		return list;
	}
	 public static List<MatchTypeNote> getMatchTypes(String matchid){
			if(StringUtils.isEmpty(matchid)) return new ArrayList<MatchTypeNote>();
		    MatchTypeNote note = new MatchTypeNote();
		    Match match = new Match();
		    match.setId(matchid);
		    note.setMatch(match);
		    List<MatchTypeNote> list = matchTypeNoteDao.findList(note);
			return list;
		}
	public static int getMatchPeople(String matchid){
		try{
			return matchTypeNoteDao.getMatchPeopleCount(matchid);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	public static void clearCache(MatchTypeNote note){
    }
}
