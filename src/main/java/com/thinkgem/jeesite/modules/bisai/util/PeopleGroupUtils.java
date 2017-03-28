package com.thinkgem.jeesite.modules.bisai.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.bisai.dao.PeopleGroupDao;
import com.thinkgem.jeesite.modules.bisai.entity.People;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleGroup;

/**
 * 参赛人员记录工具类
 * @author 
 * @version 2013-5-29
 */
public class PeopleGroupUtils {
	
	private static PeopleGroupDao peopleGroupDao = SpringContextHolder.getBean(PeopleGroupDao.class);

    public static List<People> getPeopleSort(String matchid,String btype,String type){
		//List<People> peopleMap = new ArrayList<People>();
		PeopleGroup peopleGroup = new PeopleGroup();
		peopleGroup.setMatchid(matchid);
		peopleGroup.setBtype(btype);
		peopleGroup.setType(type);
		List<PeopleGroup> groupList = peopleGroupDao.findList(peopleGroup);
		Map<String,List<String>> zuMap = new HashMap<String,List<String>>();
		Map<String,People> peopleMap = new HashMap<String, People>();
		for(PeopleGroup group : groupList){
			String key = group.getLun()+group.getGroupnum()+group.getChang();
			List<String> list = zuMap.get(key);
			if(list==null){
				list = new ArrayList<String>();
			}
			String peopleId = group.getPeopleNote().getId();
			if(!list.contains(peopleId)){
				list.add(peopleId);
				zuMap.put(key, list);
			}
			People people = peopleMap.get(key+peopleId);
			if(people==null){
				people = new People();
				people.setId(peopleId);
				people.setName(group.getPeopleNote().getName());
				peopleMap.put(key+peopleId, people);
			}
			people.setScore(people.getScore()+Integer.parseInt(group.getScore1()));
			people.setJushu(people.getJushu()+1);
		}
		Set<Map.Entry<String,List<String>>> zuSet = zuMap.entrySet();
		Iterator<Map.Entry<String,List<String>>> zuIterator = zuSet.iterator();
		Map.Entry<String,List<String>> zuEntry = null;
		while(zuIterator.hasNext()){
			zuEntry = zuIterator.next();
			List<String> pList = zuEntry.getValue();//p1\p2
			
		}
		
		return new ArrayList<People>();
	}
}
