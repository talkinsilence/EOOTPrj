package com.eoot.eootprj.dao;

import java.util.List;



import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.FamPostFile;
import com.eoot.eootprj.model.FamPostFileJoinFamPost;


public interface FamPostFileDao {
	

	public int insert(FamPostFile famPostFile );
	
	@Select("SELECT F.TITLE, F.REGDATE, F.WRITER, F.HIT, F.LIKECNT, F.COMMENTCNT, F.CLIPCNT, FPF.* "
			+ "FROM FAMPOSTS F "
			+ "RIGHT OUTER JOIN FAMPOSTFILES FPF "
			+ "ON F.CODE = FPF.FAMPOSTCODE ")
	public	List<FamPostFileJoinFamPost> getFamPostFiles();
	
	@Select("select top 5 * from famposts order by likecnt desc")
	public	List<FamPostFile> getMainFamPostFiles();
	
	@Select("SELECT * FROM FAMPOSTFILES")
	public	List<FamPostFile> getFamPostFiles2();
	
	@Select("SELECT COUNT(*) FROM FAMPOSTFILES") 
	public int getSize();
	
}
