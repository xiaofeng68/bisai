package com.thinkgem.jeesite.modules.bisai.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 单位Entity
 * @author 小风
 * @version 2017-03-26
 */
public class BaomingOrg extends DataEntity<BaomingOrg> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 参赛单位名称
	private String user;		// 联系人
	private String phone;		// 联系电话
	private Match match;		// matchid
	private String state;		// 状态
	
	public BaomingOrg() {
		super();
	}

	public BaomingOrg(String id){
		super(id);
	}

	@Length(min=0, max=50, message="参赛单位名称长度必须介于 0 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=20, message="联系人长度必须介于 0 和 20 之间")
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}
	
	@Length(min=0, max=11, message="联系电话长度必须介于 0 和 11 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=10, message="状态长度必须介于 0 和 10 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Match getMatch() {
		return match;
	}

	public void setMatch(Match match) {
		this.match = match;
	}
	
}