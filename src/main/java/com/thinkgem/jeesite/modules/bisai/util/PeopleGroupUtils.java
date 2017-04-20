package com.thinkgem.jeesite.modules.bisai.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
//	public static final String MatchResult_MAP = "matchResultMap";

	public static List<MatchResult> getPeopleSort(String matchid, String btype, String type) {
		MatchResult matchResult = new MatchResult();
		matchResult.setMatchid(matchid);
		matchResult.setBtype(btype);
		matchResult.setType(type);
		List<MatchResult> resultList = matchResultDao.findList(matchResult);
		return resultList;
	}
	/**
	 * 保存人员排序
	 * @param matchid
	 * @param btype
	 * @param type
	 */
	public static void savePeopleSort(String matchid, String btype, String type){
		MatchResult matchResult = new MatchResult();
		matchResult.setMatchid(matchid);
		matchResult.setBtype(btype);
		matchResult.setType(type);
		if("2".equals(btype)){//团队赛
			//根据groupnum,chang,jushu排序查询出对应的比赛PK
			PeopleGroup peopleGroup = new PeopleGroup();
			peopleGroup.setMatchid(matchid);
			peopleGroup.setBtype(btype);
			peopleGroup.setType(type);
			List<PeopleGroup> peopleGroupList = peopleGroupDao.getTuanLastGroupScoreSort(peopleGroup);
			Map<String,MatchResult> resultMap = new HashMap<String, MatchResult>();
			int jushu = 3,changci=3;
			//根据PK结果计算出，部门获胜局数
			for(int i=0,j=peopleGroupList.size(),index=0;i<j;i+=(2*jushu*changci)){
				int orgNum1=0,orgNum2=0;
				for(int k=1;k<=changci;k++){//公司比较
					int jushus1 = 0,jushus2=0;
					for(int m=1;m<=jushu;m++){//局数比较
						PeopleGroup p1 = peopleGroupList.get(index);
						PeopleGroup p2 = peopleGroupList.get(index+1);
						if(p1.getScore1()>p2.getScore1()){
							jushus1++;
						}else if(p1.getScore1()<p2.getScore1()){
							jushus2++;
						}
						index+=2;
					}
					if(jushus1>jushus2){
						orgNum1++;
					}else if(jushus1<jushus2){
						orgNum2++;
					}
				}
				int lun = Integer.parseInt(peopleGroupList.get(i).getLun());
				String id1 = peopleGroupList.get(i).getPeopleNote().getId();
				MatchResult result1 = resultMap.get(id1);
				if(result1==null){
					result1 = new MatchResult();
					result1.setMatchid(matchid);
					result1.setBtype(btype);
					result1.setType(type);
					result1.setShengju(0);
					result1.setJushu(0);
					result1.setLun(lun);
					result1.setPeople(peopleGroupList.get(i).getPeopleNote());
					resultMap.put(id1, result1);
				}
				if(orgNum1>orgNum2)
					result1.setShengju(result1.getShengju()+1);
				result1.setJushu(result1.getJushu()+1);
				result1.setLun(lun);
				String id2 = peopleGroupList.get(i+1).getPeopleNote().getId();
				MatchResult result2 = resultMap.get(id2);
				if(result2==null){
					result2 = new MatchResult();
					result2.setMatchid(matchid);
					result2.setBtype(btype);
					result2.setType(type);
					result2.setShengju(0);
					result2.setJushu(0);
					result2.setLun(lun);
					result2.setPeople(peopleGroupList.get(i+1).getPeopleNote());
					resultMap.put(id2, result2);
				}
				if(orgNum1<=orgNum2)
					result2.setShengju(result2.getShengju()+1);
				result2.setJushu(result2.getJushu()+1);
				result2.setLun(lun);
			}
			Collection<MatchResult> collections = resultMap.values();
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
		}else{//单项赛
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
					pn.setOrgname(pp1.getPeopleNote().getOrgname());
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
					pn.setOrgname(pp2.getPeopleNote().getOrgname());
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
				if (pp1.getScore1() > pp2.getScore1()) {
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
		}
		matchResultDao.refashOrg();
	}
}
