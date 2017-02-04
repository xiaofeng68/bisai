/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 系统参数Entity
 * @author ThinkGem
 * @version 2013-05-15
 */
public class Setting extends DataEntity<Setting> {

	private static final long serialVersionUID = 1L;
	private String code;
	private String content;
	private String name;

	public Setting() {
		super();
	}
	
	public Setting(String id){
		super(id);
	}
	
	public Setting(String code, String content,String name){
		this.code = code;
		this.content = content;
		this.name = name;
	}

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}