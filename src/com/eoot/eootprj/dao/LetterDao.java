package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.Letter;

public interface LetterDao {

	public Letter getLetter(String code);
	public List<Letter> getLetters(String query, String field);
	public int insert(Letter letter);
	public int delete(String code);
	public String lastCode();
	
}
