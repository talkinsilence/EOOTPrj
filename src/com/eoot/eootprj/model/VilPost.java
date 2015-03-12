package com.eoot.eootprj.model;

import java.sql.Date;

public class VilPost {
   private String Code;
   private String Sort;
   private String Title;
   private String Content;
   private String Writer;
   private Date Regdate;
   private int Hit;
   private int LikeCnt;
   private int ClipCnt;
   
   public String getCode() {
      return Code;
   }
   public void setCode(String code) {
      Code = code;
   }
   public String getSort() {
      return Sort;
   }
   public void setSort(String sort) {
      Sort = sort;
   }
   public String getTitle() {
      return Title;
   }
   public void setTitle(String title) {
      Title = title;
   }
   public String getContent() {
      return Content;
   }
   public void setContent(String content) {
      Content = content;
   }
   public String getWriter() {
      return Writer;
   }
   public void setWriter(String writer) {
      Writer = writer;
   }
   public Date getRegdate() {
      return Regdate;
   }
   public void setRegdate(Date regdate) {
      Regdate = regdate;
   }
   public int getHit() {
      return Hit;
   }
   public void setHit(int hit) {
      Hit = hit;
   }
   public int getLikeCnt() {
      return LikeCnt;
   }
   public void setLikeCnt(int likeCnt) {
	   LikeCnt = likeCnt;
   }
   public int getClipCnt() {
      return ClipCnt;
   }
   public void setClipCnt(int clipCnt) {
      ClipCnt = clipCnt;
   }
}