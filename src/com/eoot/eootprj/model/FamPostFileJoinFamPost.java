package com.eoot.eootprj.model;

import java.sql.Date;

public class FamPostFileJoinFamPost extends FamPostFile{
	private int hit;
	private int likeCnt;
	private int clipCnt;
	private int commentCnt;
	private String title;
	private Date regdate;
	private String writer;
	
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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
