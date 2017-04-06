package com.thinkgem.jeesite.modules.bisai.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 比赛类型记录Entity
 * @author 小风
 * @version 2017-03-07
 */
public class MatchTypeNote extends DataEntity<MatchTypeNote> {
	
	private static final long serialVersionUID = 1L;
	private Match match;		// 比赛id
	private String btype;		// 比赛大类
	private String type;		// 比赛小类
	private Integer num;		// 团队赛人数
	private Integer counts;		// 统计参赛人数
	private Integer peoples;//人数
	private Integer saizhi;//赛制:0循环，1淘汰
	private Integer jushu;//局数
	private Integer zuchuxian;//组出线
	private boolean readOnly;
	
	public MatchTypeNote() {
		super();
	}

	public MatchTypeNote(String id){
		super(id);
	}

	@Length(min=0, max=1, message="比赛大类长度必须介于 0 和 1 之间")
	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}
	
	@Length(min=0, max=11, message="比赛小类长度必须介于 0 和 11 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
	
	public Integer getCounts() {
		return counts;
	}

	public void setCounts(Integer counts) {
		this.counts = counts;
	}

    public Match getMatch() {
        return match;
    }

    public void setMatch(Match match) {
        this.match = match;
    }

    public Integer getPeoples() {
        return peoples;
    }

    public void setPeoples(Integer peoples) {
        this.peoples = peoples;
    }

    public Integer getSaizhi() {
        return saizhi;
    }

    public void setSaizhi(Integer saizhi) {
        this.saizhi = saizhi;
    }

    public Integer getJushu() {
        return jushu;
    }

    public void setJushu(Integer jushu) {
        this.jushu = jushu;
    }

    public Integer getZuchuxian() {
        return zuchuxian;
    }

    public void setZuchuxian(Integer zuchuxian) {
        this.zuchuxian = zuchuxian;
    }

	public boolean isReadOnly() {
		return readOnly;
	}

	public void setReadOnly(boolean readOnly) {
		this.readOnly = readOnly;
	}
}