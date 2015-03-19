package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.LetterDao;
import com.eoot.eootprj.model.Letter;
import com.eoot.eootprj.model.LetterJoinMember;

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

	@Override
	public int getSize(String mid, String reader) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.getSize(mid, reader);
	}
}
