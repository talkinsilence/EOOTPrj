package com.eoot.eootprj.model;

public class FamPostFileJoinFamPost extends FamPostFile{
	private int hit;
	private int likeCnt;
	private int clipCnt;
	private int commentCnt;
	
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
