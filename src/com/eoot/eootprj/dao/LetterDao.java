package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.Letter;

public interface LetterDao {

	@Select("SELECT * FROM LETTERS WHERE CODE=#{code}")
	public Letter getLetter(String code);
	
	public List<Letter> getLetters(String query, String field);
	
	public int insert(Letter letter);
	
	public int delete(String code);
	
	public String lastCode();
	
}
