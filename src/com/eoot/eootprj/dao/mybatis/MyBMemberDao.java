package com.eoot.eootprj.dao.mybatis;

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
	public Member getMember(String uid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.getMember(uid);
	}

}
