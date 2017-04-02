package com.thinkgem.jeesite.modules.bisai.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 人员分组Entity
 * @author 小风
 * @version 2017-03-18
 */
public class PeopleGroup extends DataEntity<PeopleGroup> {
	
	private static final long serialVersionUID = 1L;
	private String groupnum;		// 组
	private String chang;		// 场
	private PeopleNote peopleNote;		// 比赛人
	private Integer score1;		// 得分
	private String matchid;
	private String btype;
	private String type;
	private String lun;
	private String jushu;//局数
	
	public PeopleGroup() {
		super();
	}

	public PeopleGroup(String id){
		super(id);
	}

	@Length(min=0, max=11, message="组长度必须介于 0 和 11 之间")
	public String getGroupnum() {
		return groupnum;
	}

	public void setGroupnum(String groupnum) {
		this.groupnum = groupnum;
	}
	
	@Length(min=0, max=11, message="场长度必须介于 0 和 11 之间")
	public String getChang() {
		return chang;
	}

	public void setChang(String chang) {
		this.chang = chang;
	}
	
	@Length(min=0, max=11, message="得分长度必须介于 0 和 11 之间")
	public Integer getScore1() {
		return score1;
	}

	public void setScore1(Integer score1) {
		this.score1 = score1;
	}

    public PeopleNote getPeopleNote() {
        return peopleNote;
    }

    public void setPeopleNote(PeopleNote peopleNote) {
        this.peopleNote = peopleNote;
    }

    public String getMatchid() {
        return matchid;
    }

    public void setMatchid(String matchid) {
        this.matchid = matchid;
    }

    public String getBtype() {
        return btype;
    }

    public void setBtype(String btype) {
        this.btype = btype;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

	public String getLun() {
		return lun;
	}

	public void setLun(String lun) {
		this.lun = lun;
	}

	public String getJushu() {
		return jushu;
	}

	public void setJushu(String jushu) {
		this.jushu = jushu;
	}
	
}