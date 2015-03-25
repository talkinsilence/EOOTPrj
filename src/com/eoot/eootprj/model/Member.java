package com.eoot.eootprj.model;

import java.util.Date;

public class Member {
	private String mid;
	private String pwd;
	private String name;
	private String birthday;
	private String address;
	private String profilepic;
	private String phone;
	private Date regdate;
	private String famcode;
	private String famname;
	private String profilebg;
	
	public String getProfilebg() {
		return profilebg;
	}
	public void setProfilebg(String profilebg) {
		this.profilebg = profilebg;
	}
	public String getFamname() {
		return famname;
	}
	public void setFamname(String famname) {
		this.famname = famname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProfilepic() {
		return profilepic;
	}
	public void setProfilepic(String profilepic) {
		this.profilepic = profilepic;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getFamcode() {
		return famcode;
	}
	public void setFamcode(String famcode) {
		this.famcode = famcode;
	}
	
}
