package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.FamPostFile;

public interface FamPostFileDao {
	
	public int insert(FamPostFile famPostFile );
	public	List<FamPostFile> getFamPostFiles(String famPostCode);
	
}
