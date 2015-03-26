package com.eoot.eootprj.model;

public class NeighborJoinMember extends Neighbor {
	
	private String mid;
	private String address;
	private String name;
	private String famname;
	private String famcode;
	private String profilepic;
	
	public String getFamcode() {
		return famcode;
	}

	public void setFamcode(String famcode) {
		this.famcode = famcode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFamname() {
		return famname;
	}

	public void setFamname(String famname) {
		this.famname = famname;
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

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}
	
}
