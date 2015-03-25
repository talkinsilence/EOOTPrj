package com.eoot.eootprj.dao;

import java.util.List;



import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.FamPostFile;
import com.eoot.eootprj.model.FamPostFileJoinFamPost;


public interface FamPostFileDao {
	

	public int insert(FamPostFile famPostFile );
	
	@Select("SELECT F.HIT, F.LIKECNT, F.COMMENTCNT, F.CLIPCNT, FPF.* "
			+ "FROM FAMPOSTS F "
			+ "LEFT OUTER JOIN FAMPOSTFILES FPF "
			+ "ON F.CODE = FPF.FAMPOSTCODE ")
	public	List<FamPostFileJoinFamPost> getFamPostFiles();
	
	@Select("SELECT * FROM FAMPOSTFILES")
	public	List<FamPostFile> getFamPostFiles2();
	
	@Select("SELECT COUNT(*) FROM FAMPOSTFILES") 
	public int getSize();
	
}
