package com.thinkgem.jeesite.modules.bisai.entity;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 参赛人员记录Entity
 * @author 小风
 * @version 2017-03-07
 */
public class PeopleNote extends DataEntity<PeopleNote> {
	
	private static final long serialVersionUID = 1L;
	private MatchTypeNote note;		// 比赛类型记录
	private String name;		// 人员名称
	private String phone;		// 手机号
	private String orgname;		// 单位
	private String state;		// 状态
	private BaomingOrg org;
	private List<PeopleNote> cList = new ArrayList<PeopleNote>();
	
	public PeopleNote() {
		super();
	}

	public PeopleNote(String id){
		super(id);
	}

	@Length(min=0, max=20, message="人员名称长度必须介于 0 和 20 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=11, message="手机号长度必须介于 0 和 11 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=20, message="单位长度必须介于 0 和 20 之间")
	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	
	@Length(min=0, max=10, message="状态长度必须介于 0 和 10 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

    public MatchTypeNote getNote() {
        return note;
    }

    public void setNote(MatchTypeNote note) {
        this.note = note;
    }
    public void add(PeopleNote note){
    	this.cList.add(note);
    }

	public BaomingOrg getOrg() {
		return org;
	}

	public void setOrg(BaomingOrg org) {
		this.org = org;
	}
}