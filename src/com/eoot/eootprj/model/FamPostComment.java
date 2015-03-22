package com.eoot.eootprj.model;

import java.sql.Date;

public class FamPostComment{
	private String code;
	private String content;
	private String writer;
	private String famPostCode;
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
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getFamPostCode() {
		return famPostCode;
	}
	
	public void setFamPostCode(String famPostCode) {
		this.famPostCode = famPostCode;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
