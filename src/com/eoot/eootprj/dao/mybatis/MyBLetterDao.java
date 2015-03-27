package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.LetterDao;
import com.eoot.eootprj.dao.MemberDao;
import com.eoot.eootprj.model.Letter;
import com.eoot.eootprj.model.LetterJoinMember;
import com.eoot.eootprj.model.Member;

public class MyBLetterDao implements LetterDao {

	@Override
	public Letter getLetter(String code) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.getLetter(code);
	}

	@Override
	public List<LetterJoinMember> getLetters(String mid, String query) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.getLetters(mid, query);
	}
	
	@Override
	public List<LetterJoinMember> getNewLetters(String mid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.getNewLetters(mid);
	}
	
	@Override
	public int updateRead(String code) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.updateRead(code);
	}

	@Override
	public int insert(Letter letter) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.insert(letter);
	}

	@Override
	public int delete(String code) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.delete(code);
	}
}