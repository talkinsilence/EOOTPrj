package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.eoot.eootprj.dao.FamPostFileDao;
import com.eoot.eootprj.model.FamPostFile;

public class MyBFamPostFileDao implements FamPostFileDao{

	@Override
	public int insert(FamPostFile famPostFile) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostFileDao famPostFileDao= sqlSession.getMapper(FamPostFileDao.class);
		return famPostFileDao.insert(famPostFile);
	}

	@Override
	public List<FamPostFile> getFamPostFiles(String famPostCode) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamPostFileDao famPosFiletDao= sqlSession.getMapper(FamPostFileDao.class);
		return famPosFiletDao.getFamPostFiles(famPostCode);
	}
}
