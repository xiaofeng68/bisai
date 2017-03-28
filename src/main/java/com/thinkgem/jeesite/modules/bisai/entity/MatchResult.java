package com.thinkgem.jeesite.modules.bisai.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 比赛结果Entity
 * @author 小风
 * @version 2017-03-28
 */
public class MatchResult extends DataEntity<MatchResult> {
	
	private static final long serialVersionUID = 1L;
	private String matchid;		// matchid
	private String btype;		// btype
	private String type;		// type
	private PeopleNote people;		// peopleid
	private int shengju=0;		// shengju
	private int jushu=0;		// jushu
	private int lun=0;
	
	public MatchResult() {
		super();
	}

	public MatchResult(String id){
		super(id);
	}

	@Length(min=0, max=11, message="matchid长度必须介于 0 和 11 之间")
	public String getMatchid() {
		return matchid;
	}

	public void setMatchid(String matchid) {
		this.matchid = matchid;
	}
	
	@Length(min=0, max=11, message="btype长度必须介于 0 和 11 之间")
	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}
	
	@Length(min=0, max=11, message="type长度必须介于 0 和 11 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=11, message="shengju长度必须介于 0 和 11 之间")
	public int getShengju() {
		return shengju;
	}

	public void setShengju(int shengju) {
		this.shengju = shengju;
	}
	
	@Length(min=0, max=11, message="jushu长度必须介于 0 和 11 之间")
	public int getJushu() {
		return jushu;
	}

	public void setJushu(int jushu) {
		this.jushu = jushu;
	}

	public PeopleNote getPeople() {
		return people;
	}

	public void setPeople(PeopleNote people) {
		this.people = people;
	}

	public int getLun() {
		return lun;
	}

	public void setLun(int lun) {
		this.lun = lun;
	}
	
}