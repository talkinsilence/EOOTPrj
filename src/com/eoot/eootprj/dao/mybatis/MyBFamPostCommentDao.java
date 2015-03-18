package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.eoot.eootprj.dao.FamPostCommentDao;
import com.eoot.eootprj.model.FamPostComment;

public class MyBFamPostCommentDao implements FamPostCommentDao{

	@Override
	public int insert(FamPostComment famPostComment) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostCommentDao famPostCommentDao= sqlSession.getMapper(FamPostCommentDao.class);
		return famPostCommentDao.insert(famPostComment);
	}

	@Override
	public List<FamPostComment> getFamPostComments(String famPostCode) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostCommentDao famPostCommentDao= sqlSession.getMapper(FamPostCommentDao.class);
		return famPostCommentDao.getFamPostComments(famPostCode);
	}
	
}
