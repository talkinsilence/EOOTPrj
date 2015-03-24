package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.NeighborDao;
import com.eoot.eootprj.model.Neighbor;
import com.eoot.eootprj.model.NeighborJoinMember;

public class MyBNeighborDao implements NeighborDao{

	@Override
	public int insertNei(Neighbor nei) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.insertNei(nei);
	}

	@Override
	public List<NeighborJoinMember> getNeiInvs(String acceptmid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.getNeiInvs(acceptmid);
	}

	@Override
	public List<NeighborJoinMember> getNeiInvsMe(String uid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.getNeiInvsMe(uid);
	}

	@Override
	public List<NeighborJoinMember> getNeighbors(String uid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.getNeighbors(uid);
	}

	@Override
	public int deleteInvMe(String uid, String acceptmid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.deleteInvMe(uid, acceptmid);
	}

}
