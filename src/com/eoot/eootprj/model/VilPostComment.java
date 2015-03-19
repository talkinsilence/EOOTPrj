package com.eoot.eootprj.model;

import java.util.Date;

public class VilPostComment {
	private String code;
	private String content;
	private String Writer;
	private String vilPostCode;
	private Date regdate;
	
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
	public String getWriter() {
		return Writer;
	}
	public void setWriter(String writer) {
		Writer = writer;
	}
	public String getVilPostCode() {
		return vilPostCode;
	}
	public void setVilPostCode(String vilPostCode) {
		this.vilPostCode = vilPostCode;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
