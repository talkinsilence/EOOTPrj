package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.FamInvitationDao;
import com.eoot.eootprj.model.FamInvitation;
import com.eoot.eootprj.model.FamInvitationJoinMember;

public class MyBFamInvitationDao implements FamInvitationDao{

	@Override
	public List<FamInvitationJoinMember> getInvs(String acceptmid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamInvitationDao famInvDao = sqlSession.getMapper(FamInvitationDao.class);
		return famInvDao.getInvs(acceptmid);
	}

	@Override
	public int insertInv(FamInvitation famInvitation) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamInvitationDao famInvDao = sqlSession.getMapper(FamInvitationDao.class);
		return famInvDao.insertInv(famInvitation);
	}

	@Override
	public List<FamInvitationJoinMember> getInvsMe(String uid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamInvitationDao famInvDao = sqlSession.getMapper(FamInvitationDao.class);
		return famInvDao.getInvsMe(uid);
	}

	@Override
	public FamInvitation getInv(String acceptmid, String askmid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamInvitationDao famInvDao = sqlSession.getMapper(FamInvitationDao.class);
		return famInvDao.getInv(acceptmid, askmid);
	}

}
