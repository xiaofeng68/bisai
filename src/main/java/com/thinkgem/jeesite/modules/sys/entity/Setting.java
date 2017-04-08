package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 参数配置Entity
 * @author 小风
 * @version 2017-04-08
 */
public class Setting extends DataEntity<Setting> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 名称
	private String content;		// 描述
	private String name;		// name
	private String site;		// 所属站点
	
	public Setting() {
		super();
	}

	public Setting(String id){
		super(id);
	}

	@Length(min=0, max=20, message="名称长度必须介于 0 和 20 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=200, message="name长度必须介于 0 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=10, message="所属站点长度必须介于 0 和 10 之间")
	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}
	
}