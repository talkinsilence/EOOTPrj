package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.LetterDao;
import com.eoot.eootprj.model.Letter;
import com.eoot.eootprj.model.LetterJoinMember;

public class MyBLetterDao implements LetterDao {

	@Override //편지내용 조회
	public Letter getLetter(String code) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.getLetter(code);
	}

	@Override //전체 편지목록 조회
	public List<LetterJoinMember> getLetters(String mid, String query) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.getLetters(mid, query);
	}
	
	@Override //새로운 편지목록 조회
	public List<LetterJoinMember> getNewLetters(String mid) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.getNewLetters(mid);
	}
	
	@Override //편지읽음 처리
	public int updateRead(String code) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.updateRead(code);
	}

	@Override //편지 작성
	public int insert(Letter letter) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.insert(letter);
	}

	@Override //편지 삭제
	public int delete(String code) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		LetterDao letterDao = sqlSession.getMapper(LetterDao.class);
		return letterDao.delete(code);
	}
}