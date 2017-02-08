/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.bisai.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户账号Entity
 * @author 小风
 * @version 2017-02-05
 */
public class TAccount extends DataEntity<TAccount> {
	
	private static final long serialVersionUID = 1L;
	private String phone;		// 手机号
	private String password;		// 密码
	private String wxname;		// 昵称
	private String wxcode;		// 微信号
	private String wxphoto;		// 头像
	private String sex;		// 性别
	private String area;		// 地区
	private String des;		// 个性签名
	private Date createtime;		// 创建时间
	private Date updatetime;		// 更新时间
	private String state;		// 状态
	private String openId;
	
	public TAccount() {
		super();
	}

	public TAccount(String id){
		super(id);
	}

	@Length(min=0, max=11, message="手机号长度必须介于 0 和 11 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=20, message="密码长度必须介于 0 和 20 之间")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Length(min=0, max=20, message="昵称长度必须介于 0 和 20 之间")
	public String getWxname() {
		return wxname;
	}

	public void setWxname(String wxname) {
		this.wxname = wxname;
	}
	
	@Length(min=0, max=20, message="微信号长度必须介于 0 和 20 之间")
	public String getWxcode() {
		return wxcode;
	}

	public void setWxcode(String wxcode) {
		this.wxcode = wxcode;
	}
	
	@Length(min=0, max=100, message="头像长度必须介于 0 和 100 之间")
	public String getWxphoto() {
		return wxphoto;
	}

	public void setWxphoto(String wxphoto) {
		this.wxphoto = wxphoto;
	}
	
	@Length(min=0, max=11, message="性别长度必须介于 0 和 11 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=0, max=20, message="地区长度必须介于 0 和 20 之间")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	@Length(min=0, max=100, message="个性签名长度必须介于 0 和 100 之间")
	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
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
	
	@Length(min=0, max=11, message="状态长度必须介于 0 和 11 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }
	
}