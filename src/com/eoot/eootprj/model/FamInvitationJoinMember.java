package com.eoot.eootprj.model;

import java.util.Date;

public class FamInvitationJoinMember extends FamInvitation {
	private String name;
	private String famcode;

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
	
}
