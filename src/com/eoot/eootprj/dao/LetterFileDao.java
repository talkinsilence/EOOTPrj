package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.LetterFile;

public interface LetterFileDao {
	
	public List<LetterFile> getLetterFiles(String letterCode); 
	
	public int insert(LetterFile letterFile); 
	
}
