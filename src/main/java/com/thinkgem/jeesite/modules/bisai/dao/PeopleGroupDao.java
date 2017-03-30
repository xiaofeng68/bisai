package com.thinkgem.jeesite.modules.bisai.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.bisai.entity.MatchTypeNote;
import com.thinkgem.jeesite.modules.bisai.entity.PeopleGroup;

/**
 * 人员分组DAO接口
 * @author 小风
 * @version 2017-03-18
 */
@MyBatisDao
public interface PeopleGroupDao extends CrudDao<PeopleGroup> {
    public void deleteByTypeNote(PeopleGroup peopleGroup);
    public int checkGroupEnd(String matchid);
    /**
     * 获取typeNode下的分组列表
     * @param matchTypeNote
     * @return
     */
    List<String> getGroupSelectList(MatchTypeNote matchTypeNote);
    /**
     * 获取typeNode下的轮列表
     * @param matchTypeNote
     * @return
     */
    List<String> getLunSelectList(MatchTypeNote matchTypeNote);
    /**
     * 批量保存成绩
     * @param list
     */
    void batchUpdate(List<PeopleGroup> list);
    /**
     * 获取未录分的数量
     * @param peopleGroup
     * @return
     */
    int countTypeScoreIsNull(PeopleGroup peopleGroup);
    /**获取成绩分组排序
     * @param peopleGroup
     * @return
     */
    List<PeopleGroup> getGroupScoreSort(PeopleGroup peopleGroup);
    List<PeopleGroup> getLastGroupScoreSort(PeopleGroup peopleGroup);
    /**
     * 获取比赛下未录分的数量
     * @param matchid
     * @return
     */
    int countMatchScoreIsNull(String matchid);
    /**
     * @param matchid
     * @return
     */
    List<Integer> getMatchGroupnumList(String matchid);
    void deleteByMatch(String matchid);
}