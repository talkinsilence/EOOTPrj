package com.eoot.eootprj.model;

import java.util.Date;

public class FamPost {
	private String code;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int shareNei;
	private int shareVil;
	private int hit;
	private int likeCnt;
	private int clipCnt;
	private int commentCnt;
	private String name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getShareNei() {
		return shareNei;
	}
	public void setShareNei(int shareNei) {
		this.shareNei = shareNei;
	}
	public int getShareVil() {
		return shareVil;
	}
	public void setShareVil(int shareVil) {
		this.shareVil = shareVil;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getClipCnt() {
		return clipCnt;
	}
	public void setClipCnt(int clipCnt) {
		this.clipCnt = clipCnt;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
}
