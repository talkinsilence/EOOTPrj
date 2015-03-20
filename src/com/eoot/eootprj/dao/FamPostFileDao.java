package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.FamPostFile;

public interface FamPostFileDao {
	
	public int insert(FamPostFile famPostFile );
	
	@Select("SELECT * FROM FamPostfiles order by code desc;")
	public	List<FamPostFile> getFamPostFiles();
	
}
