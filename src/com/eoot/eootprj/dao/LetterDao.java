package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.Letter;
import com.eoot.eootprj.model.LetterJoinMember;

public interface LetterDao {

	public Letter getLetter(String code);
	//public List<Letter> getLetters(String mid, String query);
	public List<LetterJoinMember> getLetters(String mid, String query);
	public int insert(Letter letter);
	public int delete(String code);
	public int getSize(String mid, String reader);
	
	/*@Select("SELECT ISNULL(MAX(CAST(CODE AS INT)),0) CODE FROM LETTERS")
	public String lastCode();*/
}

