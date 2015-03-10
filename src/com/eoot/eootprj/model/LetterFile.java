package com.eoot.eootprj.model;

import java.util.Date;

public class LetterFile {
	private String code; 
	private String src;
	private Date regdate;
	private String letterCode;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getLetterCode() {
		return letterCode;
	}
	public void setLetterCode(String letterCode) {
		this.letterCode = letterCode;
	}
}
