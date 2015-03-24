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
	public List<NeighborJoinMember> getNeis(String acceptmid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		NeighborDao neighborDao = sqlSession.getMapper(NeighborDao.class);
		return neighborDao.getNeis(acceptmid);
	}

}
