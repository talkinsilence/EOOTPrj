package com.eoot.eootprj.model;

public class NeighborJoinMember extends Neighbor {
	private String address;
	private String name;
	private String famname;
	 
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
	
}
