package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.FamPostDao;
import com.eoot.eootprj.model.FMJoinFamPostFile;
import com.eoot.eootprj.model.FamPost;
import com.eoot.eootprj.model.FamPostJoinMember;

public class MyBFamPostDao implements FamPostDao{

	@Override
	public FamPostJoinMember getFamPost(String code) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostDao famPostDao = sqlSession.getMapper(FamPostDao.class);
		return famPostDao.getFamPost(code);
	}

	@Override
	public List<FamPostJoinMember> getFamPosts(String query) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostDao famPostDao = sqlSession.getMapper(FamPostDao.class);
		return famPostDao.getFamPosts(query);
	}

	@Override
	public int update(FamPost famPost) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostDao famPostDao = sqlSession.getMapper(FamPostDao.class);
		return famPostDao.update(famPost);
	}

	@Override
	public int delete(String code) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostDao famPostDao = sqlSession.getMapper(FamPostDao.class);
		return famPostDao.delete(code);
	}

	@Override
	public int insert(FamPost fampost) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostDao famPostDao = sqlSession.getMapper(FamPostDao.class);
		return famPostDao.insert(fampost);
	}

	@Override
	public FMJoinFamPostFile prevFamPost(String curCode) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostDao famPostDao = sqlSession.getMapper(FamPostDao.class);
		return famPostDao.prevFamPost(curCode);
	}

	@Override
	public FMJoinFamPostFile nextFamPost(String curCode) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostDao famPostDao = sqlSession.getMapper(FamPostDao.class);
		return famPostDao.nextFamPost(curCode);
		
	}
}

