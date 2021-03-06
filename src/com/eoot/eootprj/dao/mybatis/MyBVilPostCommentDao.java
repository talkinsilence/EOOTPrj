package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.VilPostCommentDao;
import com.eoot.eootprj.model.FamPostComment;
import com.eoot.eootprj.model.VilPostComment;
import com.eoot.eootprj.model.VilPostCommentJoinMember;

public class MyBVilPostCommentDao implements VilPostCommentDao{

	@Override
	public List<VilPostCommentJoinMember> getVilPostComments() {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		VilPostCommentDao vilPostCommentDao = sqlSession.getMapper(VilPostCommentDao.class);
		return vilPostCommentDao.getVilPostComments();
	}

	@Override
	public int insert(VilPostComment vilPostComment) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		VilPostCommentDao vilPostCommentDao = sqlSession.getMapper(VilPostCommentDao.class);
		return vilPostCommentDao.insert(vilPostComment);
	}
}
