package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.VilPostFileDao;
import com.eoot.eootprj.model.VilPostFile;

public class MyBVilPostFileDao implements VilPostFileDao{

	@Override
	public List<VilPostFile> getVilPostFiles() {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		VilPostFileDao vilPostFileDao = sqlSession.getMapper(VilPostFileDao.class);
		return vilPostFileDao.getVilPostFiles();
	}
}
