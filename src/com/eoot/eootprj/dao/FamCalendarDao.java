package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.FamCalendar;

public interface FamCalendarDao {
	public int insertCal(FamCalendar famcalendar);
	public List<FamCalendar> getCals(String famcode);
}
