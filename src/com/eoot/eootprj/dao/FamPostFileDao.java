package com.eoot.eootprj.dao;

import java.util.List;

public interface FamPostFileDao {
	
	public int insert(FamPostFile famPostFile);
	public List<FamPostFile> getFamPostFiles(String famPostCode);
	
}
