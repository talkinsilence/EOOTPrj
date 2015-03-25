package com.eoot.eootprj.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eoot.eootprj.dao.FamCalendarDao;
import com.eoot.eootprj.model.FamCalendar;

public class MyBFamCalendarDao implements FamCalendarDao{

	@Override
	public List<FamCalendar> getCals(String famcode) {
		SqlSession sqlSession = MyBatisMain.getSqlSessionFactory().openSession(true);
		FamCalendarDao famCalendarDao = sqlSession.getMapper(FamCalendarDao.class);
		return famCalendarDao.getCals(famcode);
	}

}
