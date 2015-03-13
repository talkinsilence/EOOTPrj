package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.VilPostDao;
import com.eoot.eootprj.model.VilPost;

public class MyBVilPostDao implements VilPostDao{

	@Override
	public VilPost getVilPost(String code) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		VilPostDao vilPostDao = sqlSession.getMapper(VilPostDao.class);
		return vilPostDao.getVilPost(code);
	}

	@Override
	public List<VilPost> getVilPosts(String query, String field) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		VilPostDao vilPostDao = sqlSession.getMapper(VilPostDao.class);
		return vilPostDao.getVilPosts(query, field);
	}

	@Override
	public int update(VilPost vilPost) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		VilPostDao vilPostDao = sqlSession.getMapper(VilPostDao.class);
		return vilPostDao.update(vilPost);
	}

	@Override
	public int delete(VilPost vilPost) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		VilPostDao vilPostDao = sqlSession.getMapper(VilPostDao.class);
		return vilPostDao.delete(vilPost);
	}

	@Override
	public int insert(VilPost vilPost) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		VilPostDao vilPostDao = sqlSession.getMapper(VilPostDao.class);
		return vilPostDao.insert(vilPost);
	}

}
