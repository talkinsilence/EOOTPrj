package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.Member;

public interface MemberDao {
	public int insert(Member member);
	public Member getMember(String mid);
	public List<Member> getFamMembers(String mid, String famcode);
	public int updateName(String mid);
	//public int delete(String uid);
}
