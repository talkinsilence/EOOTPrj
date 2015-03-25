package com.eoot.eootprj.model;

import java.util.Date;

public class Neighbor {
	private String askmid;
	private String acceptmid;
	private Date askregdate;
	private Date acceptregdate;
	private String askmsg;
	private int state;
	
	
	public String getAskmid() {
		return askmid;
	}
	public void setAskmid(String askmid) {
		this.askmid = askmid;
	}
	public String getAskmsg() {
		return askmsg;
	}
	public void setAskmsg(String askmsg) {
		this.askmsg = askmsg;
	}
	public String getAcceptmid() {
		return acceptmid;
	}
	public void setAcceptmid(String acceptmid) {
		this.acceptmid = acceptmid;
	}
	public Date getAskregdate() {
		return askregdate;
	}
	public void setAskregdate(Date askregdate) {
		this.askregdate = askregdate;
	}
	public Date getAcceptregdate() {
		return acceptregdate;
	}
	public void setAcceptregdate(Date acceptregdate) {
		this.acceptregdate = acceptregdate;
	}

	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
