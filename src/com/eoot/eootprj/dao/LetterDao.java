package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.Letter;

public interface LetterDao {

	@Select("SELECT * FROM LETTERS WHERE CODE =#{code}")
	public Letter getLetter(String code);
	
	@Select("SELECT * FROM LETTERS WHERE READER =#{mid} ORDER BY SENDDATE DESC")
	public List<Letter> getLetters(@Param("query")String query, @Param("field")String field);
	
	@Insert("INSERT INTO LETTERS(CODE, WRITER, SENDDATE, CONTENT, TITLE, READ, READER, LETTERTYPE) "
			+ "VALUES(#{code}, #{mid???}, GetDate(), #{content}, #{title}, #{read}, #{reader}, #{type})")
	public int insert(Letter letter);
	
	@Delete("DELETE LETTERS WHERE CODE =#{code}")
	public int delete(String code);
	
	/*@Select("SELECT ISNULL(MAX(CAST(CODE AS INT)),0) CODE FROM LETTERS")
	public String lastCode();*/
	
}

