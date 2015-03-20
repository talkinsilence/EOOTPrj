package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.VilPostFile;

public interface VilPostFileDao {
	@Select("SELECT * FROM VilPostFiles")
	public List<VilPostFile> getVilPostFiles();
}
