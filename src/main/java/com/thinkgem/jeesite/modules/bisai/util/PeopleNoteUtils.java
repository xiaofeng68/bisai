package com.thinkgem.jeesite.modules.bisai.util;

import java.util.ArrayList;
import java.util.List;

import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.bisai.dao.PeopleNoteDao;
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleNote;

/**
 * 参赛人员记录工具类
 * @author 
 * @version 2013-5-29
 */
public class PeopleNoteUtils {
	
	private static PeopleNoteDao peopleNoteDao = SpringContextHolder.getBean(PeopleNoteDao.class);

	public static final String CACHE_SETTING_MAP = "peopleNoteMap";
	
	@SuppressWarnings("unchecked")
    public static List<PeopleNote> getPeopleByType(String typeid){
		List<PeopleNote> list = (List<PeopleNote>) CacheUtils.get(CACHE_SETTING_MAP+":type:"+typeid);
		if(list==null){
		    PeopleNote note = new PeopleNote();
		    MatchTypeNote type = new MatchTypeNote();
		    type.setId(typeid);
		    note.setNote(type);
		    list = peopleNoteDao.findList(note);
		    CacheUtils.put(CACHE_SETTING_MAP+":type:"+typeid,list);
		}
		return list;
	}
	public static List<Integer> getChuXianPeople(Integer sum){
		List<Integer> list = new ArrayList<Integer>();
		if(sum!=null) {
			for(int i=0,index=1,j=sum/2;index<=j;i++){
				list.add(Double.valueOf(Math.pow(2, i)).intValue());
				index*=2;
			}
		}
		return list;
	}
	public static void clearCache(PeopleNote note){
	    CacheUtils.remove(CACHE_SETTING_MAP+":type:"+note.getNote().getId());
	}
}
