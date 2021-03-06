package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.FamPostFileDao;
import com.eoot.eootprj.model.FamPostFile;
import com.eoot.eootprj.model.FamPostFileJoinFamPost;

public class MyBFamPostFileDao implements FamPostFileDao{

	@Override
	public int insert(FamPostFile famPostFile) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostFileDao famPostFileDao= sqlSession.getMapper(FamPostFileDao.class);
		return famPostFileDao.insert(famPostFile);
	}

	@Override
	public List<FamPostFileJoinFamPost> getFamPostFiles() {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostFileDao famPosFiletDao= sqlSession.getMapper(FamPostFileDao.class);
		return famPosFiletDao.getFamPostFiles();
	}

	@Override
	public int getSize() {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostFileDao famPosFiletDao= sqlSession.getMapper(FamPostFileDao.class);
		return famPosFiletDao.getSize();
	}

	@Override
	public List<FamPostFile> getFamPostFiles2() {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostFileDao famPosFiletDao= sqlSession.getMapper(FamPostFileDao.class);
		return famPosFiletDao.getFamPostFiles2();
	}
	public List<FamPostFile> getMainFamPostFiles() {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostFileDao famPosFiletDao= sqlSession.getMapper(FamPostFileDao.class);
		return famPosFiletDao.getMainFamPostFiles();
	}
	
}
