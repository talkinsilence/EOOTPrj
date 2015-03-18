package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.MemberDao;
import com.eoot.eootprj.model.Member;

public class MyBMemberDao implements MemberDao {

	@Override
	public int insert(Member member) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.insert(member);
	}

	@Override
	public Member getMember(String mid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.getMember(mid);
	}

/*	@Override
	public List<Member> getFamMembers(String famcode) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.getFamMembers(famcode);
	}*/

	@Override
	public List<Member> getFamMembers(String mid, String famcode) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.getFamMembers(mid, famcode);
	}
}
