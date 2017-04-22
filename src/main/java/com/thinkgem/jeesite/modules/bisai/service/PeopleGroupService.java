package com.thinkgem.jeesite.modules.bisai.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bisai.dao.PeopleGroupDao;
import com.thinkgem.jeesite.modules.bisai.dao.PeopleNoteDao;
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleGroup;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleNote;
/**
 * 分组Service
 * 
 * @author 小风
 * @version 2017-02-09
 */
@Service
@Transactional(readOnly = true)
public class PeopleGroupService extends CrudService<PeopleGroupDao, PeopleGroup> {
	@Autowired
	PeopleNoteDao peopleNoteDao;
	public PeopleGroup get(String id) {
		return super.get(id);
	}

	public List<PeopleGroup> findList(PeopleGroup match) {
		return super.findList(match);
	}

	public Page<PeopleGroup> findPage(Page<PeopleGroup> page, PeopleGroup match) {
		return super.findPage(page, match);
	}

	@Transactional(readOnly = false)
	public void save(PeopleGroup match) {
		super.save(match);
	}

	@Transactional(readOnly = false)
	public void delete(PeopleGroup match) {
		super.delete(match);
	}

	@Transactional(readOnly = false)
	public void deleteByTypeNote(PeopleGroup peopleGroup) {
		dao.deleteByTypeNote(peopleGroup);
	}

	public int checkGroupEnd(String matchid) {
		return dao.checkGroupEnd(matchid);
	}

	public List<String> getInitSelectList(MatchTypeNote matchTypeNote) {
		return dao.getGroupSelectList(matchTypeNote);
	}
	public int getLastZu(MatchTypeNote matchTypeNote){
		Integer lastZu = dao.getLastZu(matchTypeNote);
		if(lastZu==null){
			return 0;
		}
		return lastZu;
	}
	public List<String> getInitZuSelectList(MatchTypeNote matchTypeNote) {
		return dao.getLunSelectList(matchTypeNote);
	}

	public Map<String, Object> initScoreTable(MatchTypeNote matchTypeNote, PeopleGroup peopleGroup) {
		//是否进入
		Integer maxLun = dao.getMaxLun(peopleGroup.getMatchid());
		boolean isNexted = false;
		if(maxLun!=null){
			isNexted = maxLun>Integer.parseInt(peopleGroup.getLun());
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		StringBuffer tableStr = new StringBuffer();
		tableStr.append("<table width='100%'>");
		List<PeopleGroup> groupList = dao.findList(peopleGroup);
		List<Map<PeopleNote, List<PeopleGroup>>> list = changeList2Table(groupList);
		boolean notovered = false;
		boolean readOnly = matchTypeNote.isReadOnly();
		for (int i = 0, j = list.size(); i < j; i++) {
			tableStr.append("<tr>");
			tableStr.append("<td><img src='/static/modules/bisai/images/img31.png'></td>");
			int jushu = matchTypeNote.getJushu();
			for (int m = 1; m <= jushu; m++) {
				tableStr.append("<td>第" + m + "局</td>");
			}
			tableStr.append("</tr>");
			Map<PeopleNote, List<PeopleGroup>> peopleMap = list.get(i);
			Set<Map.Entry<PeopleNote, List<PeopleGroup>>> set = peopleMap.entrySet();
			Iterator<Map.Entry<PeopleNote, List<PeopleGroup>>> iterator = set.iterator();
			Map.Entry<PeopleNote, List<PeopleGroup>> entry;
			while (iterator.hasNext()) {
				entry = iterator.next();
				PeopleNote people = entry.getKey();
				List<PeopleGroup> scores = entry.getValue();
				tableStr.append("<tr>");
				tableStr.append("<td><p>" + people.getName() + "</p></td>");
				for (int m = 0; m < jushu; m++) {
					if(isNexted)
						isNexted = scores.get(m).getScore1()!=null;
					int defaultScore = m>1?0:21;
					int score = scores.get(m).getScore1()!=null?scores.get(m).getScore1():defaultScore;
					tableStr.append("<td>");
					if(readOnly||isNexted){// || !notovered
						tableStr.append(score);
					}else{
						tableStr.append("<select id='people_"+scores.get(m).getId()+"' name='people_"+scores.get(m).getId()+"' class='textll'>");
						for(int k=0;k<=30;k++){
							String selected = score==k?"selected='selected'":"";
							tableStr.append("<option "+selected+">"+k+"</option>");
						}
						tableStr.append("</select>");
					}
				}
				tableStr.append("</tr>");
			}
		}
		tableStr.append("</table>");
		data.put("tableHtml", tableStr);
		data.put("notovered", checkLunOver(peopleGroup.getMatchid(),peopleGroup.getLun()));
		data.put("isNexted", isNexted);
		return data;
	}

	private List<Map<PeopleNote, List<PeopleGroup>>> changeList2Table(List<PeopleGroup> groupList) {
		List<Map<PeopleNote, List<PeopleGroup>>> list = new ArrayList<Map<PeopleNote, List<PeopleGroup>>>();
		Map<String, Map<PeopleNote, List<PeopleGroup>>> changMap = new HashMap<String, Map<PeopleNote, List<PeopleGroup>>>();
		for (PeopleGroup peopleGroup : groupList) {
			String changci = peopleGroup.getChang();
			PeopleNote peopleNote = peopleGroup.getPeopleNote();
			Map<PeopleNote, List<PeopleGroup>> map = changMap.get(changci);
			if (map == null) {
				map = new TreeMap<PeopleNote, List<PeopleGroup>>(new Comparator<PeopleNote>() {
					public int compare(PeopleNote o1, PeopleNote o2) {
						return Integer.parseInt(o2.getId())-Integer.parseInt(o1.getId());
					}
				});
				list.add(map);
				changMap.put(changci, map);
			}
			List<PeopleGroup> groups = map.get(peopleNote);
			if(groups==null){
				groups = new ArrayList<PeopleGroup>();
				map.put(peopleNote, groups);
			}
			groups.add(peopleGroup);
		}
		return list;
	}
	@Transactional(readOnly = false)
	public void saveScores(List<PeopleGroup> list){
		dao.batchUpdate(list);
	}
	public int countScoreIsNull(PeopleGroup peopleGroup){
		return dao.countTypeScoreIsNull(peopleGroup);
	}
	public List<PeopleNote> getTuanNextGroupPeople(PeopleGroup peopleGroup,MatchTypeNote matchTypeNote,boolean asc){
		//根据groupnum,chang,jushu排序查询出对应的比赛PK
		List<PeopleGroup> list = dao.getTuanGroupScoreSort(peopleGroup);
		List<PeopleNote> peopleList = new ArrayList<PeopleNote>();
		int jushu = matchTypeNote.getJushu(),changci=matchTypeNote.getNum();
		//根据PK结果计算出，部门获胜局数
		for(int i=0,j=list.size(),index=0;i<j;i+=(2*jushu*changci)){
			int orgNum1=0,orgNum2=0;
			for(int k=1;k<=changci;k++){//公司比较
				int jushus1 = 0,jushus2=0;
				for(int m=1;m<=jushu;m++){//局数比较
					PeopleGroup p1 = list.get(index);
					PeopleGroup p2 = list.get(index+1);
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
			if(asc){
				if(orgNum1>orgNum2){
					peopleList.add(list.get(i).getPeopleNote());
				}else{
					peopleList.add(list.get(i+1).getPeopleNote());
				}
			}else{
				if(orgNum1<orgNum2){
					peopleList.add(list.get(i).getPeopleNote());
				}else{
					peopleList.add(list.get(i+1).getPeopleNote());
				}
			}
		}
		return peopleList;
	}
	public List<PeopleNote> getNextGroupPeople(PeopleGroup peopleGroup,int zuchuxian){
		List<PeopleGroup> list = dao.getGroupScoreSort(peopleGroup);
		Map<String,List<PeopleGroup>> map = new HashMap<String, List<PeopleGroup>>();
		for(PeopleGroup group : list){
			String key = group.getGroupnum();
			List<PeopleGroup> cList = map.get(key);
			if(cList==null){//存放组下的所有人员
				cList = new ArrayList<PeopleGroup>();
				map.put(key, cList);
			}
			cList.add(group);
		}
		List<PeopleGroup> cacheList = new ArrayList<PeopleGroup>();
		Collection<List<PeopleGroup>> collections = map.values();
		for(List<PeopleGroup> cl : collections){
			Collections.sort(cl, new Comparator<PeopleGroup>(){
				@Override
				public int compare(PeopleGroup o1, PeopleGroup o2) {
					return o2.getScore1()-o1.getScore1();
				}
			});
			int size = cl.size();
			for(int i=0;i<zuchuxian&&i<size;i++){//取出下一局晋级人员
				cacheList.add(cl.get(i));
			}
		}
		Collections.sort(cacheList, new Comparator<PeopleGroup>(){//根据临近的组在分组
			@Override
			public int compare(PeopleGroup o1, PeopleGroup o2) {
				int chang1 = Integer.parseInt(o1.getChang());
				int chang2 = Integer.parseInt(o2.getChang());
				int zc1 = Integer.parseInt(o1.getGroupnum()+String.format("%03d", chang1));
				int zc2 = Integer.parseInt(o2.getGroupnum()+String.format("%03d", chang2));
				return zc2-zc1;
			}
		});
		List<PeopleNote> peopleList = new ArrayList<PeopleNote>();
		for(int i=0,j=cacheList.size();i<j;i++){
			peopleList.add(cacheList.get(i).getPeopleNote());
		}
		return peopleList;
	}
	public List<PeopleNote> get34GroupPeople(PeopleGroup peopleGroup){
		List<PeopleGroup> list = dao.getGroupScoreSort(peopleGroup);
		Map<String,List<PeopleGroup>> map = new HashMap<String, List<PeopleGroup>>();
		for(PeopleGroup group : list){
			String key = group.getGroupnum()+"-"+group.getChang();
			List<PeopleGroup> cList = map.get(key);
			if(cList==null){
				cList = new ArrayList<PeopleGroup>();
				map.put(key, cList);
			}
			cList.add(group);
		}
		List<PeopleGroup> cacheList = new ArrayList<PeopleGroup>();
		Collection<List<PeopleGroup>> collections = map.values();
		for(List<PeopleGroup> cl : collections){
			Collections.sort(cl, new Comparator<PeopleGroup>(){
				@Override
				public int compare(PeopleGroup o1, PeopleGroup o2) {
					return -o2.getScore1()+o1.getScore1();
				}
			});
			int size = cl.size();
			for(int i=0;i<1&&i<size;i++){
				cacheList.add(cl.get(i));
			}
		}
		List<PeopleNote> peopleList = new ArrayList<PeopleNote>();
		for(int i=0,j=cacheList.size();i<j;i++){
			peopleList.add(cacheList.get(i).getPeopleNote());
		}
		return peopleList;
	}
	public boolean checkMatchOver(String id){
		List<Integer> list = dao.getMatchGroupnumList(id);
		return dao.countMatchScoreIsNull(id)==0 && list.size()==1;
	}
	public boolean checkLunOver(String id,String lun){
		PeopleGroup group = new PeopleGroup();
		group.setMatchid(id);
		group.setLun(lun);
		int num = dao.countLunResult(group);
		return num==0;
	}
}