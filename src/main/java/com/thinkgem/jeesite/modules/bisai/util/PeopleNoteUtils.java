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

	
	@SuppressWarnings("unchecked")
    public static List<PeopleNote> getPeopleByType(String typeid){
	    PeopleNote note = new PeopleNote();
	    MatchTypeNote type = new MatchTypeNote();
	    type.setId(typeid);
	    note.setNote(type);
	    List<PeopleNote> list = peopleNoteDao.findList(note);
		return list;
	}
	public static boolean checkHasBaoming(String typeid,String openid){
		PeopleNote note = new PeopleNote();
	    MatchTypeNote type = new MatchTypeNote();
	    type.setId(typeid);
	    note.setNote(type);
	    note.setOpenid(openid);
		List<PeopleNote> list = peopleNoteDao.findList(note);
		if(list!=null){
			return list.size()>0;
		}
		return false;
	}
	public static List<PeopleNote> peopleHasBaoming(String typeid,String openid){
		PeopleNote note = new PeopleNote();
	    MatchTypeNote type = new MatchTypeNote();
	    type.setId(typeid);
	    note.setNote(type);
	    note.setOpenid(openid);
		List<PeopleNote> list = peopleNoteDao.findList(note);
		if(list!=null&&list.size()>0){
			List<PeopleNote> cList = new ArrayList<PeopleNote>();
			for(PeopleNote p : list){
				String []names = p.getName().split(";");
				String []phones = p.getPhone().split(";");
				PeopleNote p1 = new PeopleNote();
				p1.setId(p.getId());
				p1.setName(names[0]);
				p1.setPhone(phones[0]);
				p1.setOpenid(openid);
				cList.add(p1);
				p1 = new PeopleNote();
				p1.setId(p.getId());
				p1.setName(names[1]);
				p1.setPhone(phones[1]);
				p1.setOpenid(openid);
				cList.add(p1);
			}
			return cList;
		}else{
			list = new ArrayList<PeopleNote>();
			list.add(note);
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
	}
}
