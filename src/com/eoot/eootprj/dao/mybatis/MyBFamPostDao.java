package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.FamPostDao;
import com.eoot.eootprj.model.FamPost;

public class MyBFamPostDao implements FamPostDao{

	@Override
	public FamPost getFamPost(String code) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostDao famPostDao = sqlSession.getMapper(FamPostDao.class);
		return famPostDao.getFamPost(code);
	}

	@Override
	public List<FamPost> getFamPosts() {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostDao famPostDao = sqlSession.getMapper(FamPostDao.class);
		return famPostDao.getFamPosts();
	}

	@Override
	public int update(FamPost famPost) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(FamPost famPost) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(FamPost fampost) {
		// TODO Auto-generated method stub
		return 0;
	}
}

