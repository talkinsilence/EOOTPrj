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

	@Override
	public int updateName(Member member) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.updateName(member);
	}

	@Override
	public int updateFamname(Member member) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.updateFamname(member);
	}

	@Override
	public int updateAddress(Member member) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.updateAddress(member);
	}

	@Override
	public int updateProfilePic(String fileName, String mid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.updateProfilePic(fileName, mid);
	}

	@Override
	public int updateFamAccept(Member member) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.updateFamAccept(member);
	}

	@Override
	public int updateProfileBg(String fileName, String famcode) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.updateProfileBg(fileName, famcode);
	}

}
