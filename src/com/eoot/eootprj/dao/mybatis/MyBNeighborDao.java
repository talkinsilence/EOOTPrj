package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.NeighborDao;
import com.eoot.eootprj.model.Neighbor;
import com.eoot.eootprj.model.NeighborJoinMember;

public class MyBNeighborDao implements NeighborDao{

	@Override
	public int insertNei(Neighbor neighbor) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.insertNei(neighbor);
	}

	@Override
	public List<NeighborJoinMember> getNeiInvs(String acceptmid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.getNeiInvs(acceptmid);
	}

	@Override
	public List<NeighborJoinMember> getNeighbors(String uid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.getNeighbors(uid);
	}

	@Override
	public List<NeighborJoinMember> getNeiInvsMe(String uid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.getNeiInvsMe(uid);
	}

	@Override
	public int deleteInvMe(String uid, String acceptmid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.deleteInvMe(uid, acceptmid);
	}

	@Override
	public int updateNeiAccept(String askmid, String acceptmid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.updateNeiAccept(askmid, acceptmid);
	}

	@Override
	public Neighbor getInv(String askmid, String acceptmid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.getInv(askmid, acceptmid);
	}

}
