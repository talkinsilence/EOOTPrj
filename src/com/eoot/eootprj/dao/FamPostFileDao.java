package com.eoot.eootprj.dao;

import java.util.List;



import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.FamPostFile;
import com.eoot.eootprj.model.FamPostFileJoinFamPost;


public interface FamPostFileDao {
	

	public int insert(FamPostFile famPostFile );
	
	@Select("SELECT f.hit, f.likecnt, f.commentcnt, f.clipcnt, fpf.* "
			+ "FROM famposts f "
			+ "left outer join fampostfiles fpf "
			+ "on f.code = fpf.fampostcode ")
	public	List<FamPostFileJoinFamPost> getFamPostFiles();
	
	@Select("SELECT COUNT(*) FROM FAMPOSTFILES") 
	public int getSize();
	
}
