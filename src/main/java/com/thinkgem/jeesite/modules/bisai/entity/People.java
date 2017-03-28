package com.thinkgem.jeesite.modules.bisai.entity;

public class People {
	private String id;
	private String name;
	private int jushu=0;
	private int shengju=0;
	private int score=0;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getJushu() {
		return jushu;
	}
	public void setJushu(int jushu) {
		this.jushu = jushu;
	}
	public int getShengju() {
		return shengju;
	}
	public void setShengju(int shengju) {
		this.shengju = shengju;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString(){
		return this.id;
	}
}
