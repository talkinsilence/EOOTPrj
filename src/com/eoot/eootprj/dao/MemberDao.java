package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.Member;

public interface MemberDao {
	public int insert(Member member);
	public Member getMember(String mid);
	public List<Member> getFamMembers(String famcode);
	/*public int update(Member member);
	public int delete(String uid);*/
}
