package com.thinkgem.jeesite.modules.bisai.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.bisai.dao.MatchResultDao;
import com.thinkgem.jeesite.modules.bisai.dao.PeopleGroupDao;
import com.thinkgem.jeesite.modules.bisai.entity.MatchResult;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleGroup;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleNote;

/**
 * @author
 * @version 2013-5-29
 */
public class PeopleGroupUtils {

	private static PeopleGroupDao peopleGroupDao = SpringContextHolder.getBean(PeopleGroupDao.class);
	private static MatchResultDao matchResultDao = SpringContextHolder.getBean(MatchResultDao.class);
	public static final String MatchResult_MAP = "matchResultMap";

	@SuppressWarnings("unchecked")
	public static List<MatchResult> getPeopleSort(String matchid, String btype, String type) {
		MatchResult matchResult = new MatchResult();
		matchResult.setMatchid(matchid);
		matchResult.setBtype(btype);
		matchResult.setType(type);
		List<MatchResult> resultList = (List<MatchResult>) CacheUtils
				.get(MatchResult_MAP + ":" + matchid + btype + type);
		if (resultList == null ||resultList.size()==0) {
			PeopleGroup peopleGroup = new PeopleGroup();
			peopleGroup.setMatchid(matchid);
			peopleGroup.setBtype(btype);
			peopleGroup.setType(type);
			List<PeopleGroup> groupList = peopleGroupDao.getLastGroupScoreSort(peopleGroup);
			Map<String, MatchResult> peopleMap = new HashMap<String, MatchResult>();
			for (int i = 0, j = groupList.size(); i < j; i += 2) {
				PeopleGroup pp1 = groupList.get(i);
				PeopleGroup pp2 = groupList.get(i + 1);
				String key1 = pp1.getPeopleNote().getId();
				String key2 = pp2.getPeopleNote().getId();
				MatchResult p1 = peopleMap.get(key1);
				if (p1 == null) {
					p1 = new MatchResult();
					PeopleNote pn = new PeopleNote();
					pn.setId(key1);
					p1.setPeople(pn);
					p1.setMatchid(matchid);
					p1.setBtype(btype);
					p1.setType(type);
					peopleMap.put(key1, p1);
				}
				p1.setJushu(p1.getJushu() + 1);
				int p1lun = Integer.parseInt(pp1.getLun());
				if(p1.getLun()<p1lun){
					p1.setLun(p1lun);
				}
				MatchResult p2 = peopleMap.get(key2);
				if (p2 == null) {
					p2 = new MatchResult();
					PeopleNote pn = new PeopleNote();
					pn.setId(key2);
					p2.setPeople(pn);
					p2.setMatchid(matchid);
					p2.setBtype(btype);
					p2.setType(type);
					peopleMap.put(key2, p2);
				}
				p2.setJushu(p2.getJushu() + 1);
				int p2lun = Integer.parseInt(pp2.getLun());
				if(p2.getLun()<p2lun){
					p2.setLun(p2lun);
				}
				if (Integer.parseInt(pp1.getScore1()) > Integer.parseInt(pp2.getScore1())) {
					p1.setShengju(p1.getShengju() + 1);
				} else {
					p2.setShengju(p2.getShengju() + 1);
				}
			}
			Collection<MatchResult> collections = peopleMap.values();
			List<MatchResult> list = new ArrayList<MatchResult>();
			list.addAll(collections);
			Collections.sort(list, new Comparator<MatchResult>() {
				@Override
				public int compare(MatchResult o1, MatchResult o2) {
					return o2.getShengju() - o1.getShengju();
				}
			});
			for (MatchResult result : list) {
				matchResultDao.insert(result);
			}
			resultList = matchResultDao.findList(matchResult);
			CacheUtils.put(MatchResult_MAP + ":" + matchid + btype + type, resultList);
		}
		// 存储比赛的排名
		return resultList;
	}
}
