/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 比赛信息Entity
 * @author 小风
 * @version 2017-02-09
 */
public class Match extends DataEntity<Match> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 比赛名称
	private String orgs;		// 主办单位
	private String contractor;		// 承办方
	private String sponsors;		// 赞助商
	private String des;		// 简介
	private Date starttime;		// 比赛开始时间
	private Date endtime;		// 比赛结束时间
	private Date regstarttime;		// 报名开始时间
	private Date regendtime;		// 报名结束时间
	private Date createtime;		// 创建时间
	private Date updatetime;		// 更新时间
	private String address;		// 举办地
	private String contacts;		// 联系人
	private String phone;		// 联系电话
	private String state;		// 0：发起中，1报名中，2：进行中，已关闭
	
	public Match() {
		super();
	}

	public Match(String id){
		super(id);
	}

	@Length(min=0, max=50, message="比赛名称长度必须介于 0 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=100, message="主办单位长度必须介于 0 和 100 之间")
	public String getOrgs() {
		return orgs;
	}

	public void setOrgs(String orgs) {
		this.orgs = orgs;
	}
	
	@Length(min=0, max=100, message="承办方长度必须介于 0 和 100 之间")
	public String getContractor() {
		return contractor;
	}

	public void setContractor(String contractor) {
		this.contractor = contractor;
	}
	
	@Length(min=0, max=100, message="赞助商长度必须介于 0 和 100 之间")
	public String getSponsors() {
		return sponsors;
	}

	public void setSponsors(String sponsors) {
		this.sponsors = sponsors;
	}
	
	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRegstarttime() {
		return regstarttime;
	}

	public void setRegstarttime(Date regstarttime) {
		this.regstarttime = regstarttime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRegendtime() {
		return regendtime;
	}

	public void setRegendtime(Date regendtime) {
		this.regendtime = regendtime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	
	@Length(min=0, max=100, message="举办地长度必须介于 0 和 100 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=10, message="联系人长度必须介于 0 和 10 之间")
	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	
	@Length(min=0, max=11, message="联系电话长度必须介于 0 和 11 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=11, message="0：发起中，1报名中，2：进行中，已关闭长度必须介于 0 和 11 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}