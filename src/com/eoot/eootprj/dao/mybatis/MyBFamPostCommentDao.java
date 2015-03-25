package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.FamPostCommentDao;
import com.eoot.eootprj.model.FamPostComment;
import com.eoot.eootprj.model.FamPostCommentJoinMember;

public class MyBFamPostCommentDao implements FamPostCommentDao{

	@Override
	public int insert(FamPostComment famPostComment) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostCommentDao famPostCommentDao= sqlSession.getMapper(FamPostCommentDao.class);
		return famPostCommentDao.insert(famPostComment);
	}

	@Override
	public List<FamPostCommentJoinMember> getFamPostComments(String famPostCode) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostCommentDao famPostCommentDao= sqlSession.getMapper(FamPostCommentDao.class);
		return famPostCommentDao.getFamPostComments(famPostCode);
	}

	@Override
	public List<FamPostCommentJoinMember> getFamPostComments2() {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostCommentDao famPostCommentDao= sqlSession.getMapper(FamPostCommentDao.class);
		return famPostCommentDao.getFamPostComments2();
	}
	
}
