package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.FMJoinFamPostFile;
import com.eoot.eootprj.model.FamPost;
import com.eoot.eootprj.model.FamPostJoinMember;

public interface FamPostDao {
	
	@Select("SELECT "
			+ "F.*, M.NAME, M.PROFILEPIC, (ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM "
			+ "FROM FAMPOSTS F "
			+ "INNER JOIN MEMBERS M "
			+ "ON F.WRITER = M.MID "
			+ "WHERE F.CODE = #{code}")
	public FamPostJoinMember getFamPost(String code);
	
	@Select("SELECT * "
			+ "FROM (SELECT M.NAME, M.PROFILEPIC, F.* ,(ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM "
			+ "FROM MEMBERS M INNER JOIN FAMPOSTS F ON M.MID=F.WRITER "
			+ "WHERE (F.TITLE LIKE '%${query}%') OR (F.CONTENT LIKE '%${query}%')) MJOINF "
			+ "WHERE MJOINF.NUM BETWEEN 1 AND 30;")
	public List<FamPostJoinMember> getFamPosts(@Param("query")String query);

	public int update(FamPost famPost);

	@Delete("DELETE FROM FamPosts WHERE CODE = #{code}")
	public int delete(String code);

	@Insert("INSERT INTO FAMPOSTS(CODE, TITLE, CONTENT, WRITER, REGDATE, SHARENEI, SHAREVIL, HIT, LIKECNT, CLIPCNT, COMMENTCNT)"
			+ "VALUES((SELECT ISNULL(MAX(CAST(CODE AS INT)),0)+1 CODE FROM FamPosts), #{title}, #{content}, #{writer}, getDate(), 0, 0, 0, 0, 0, 0)")
	public int insert(FamPost fampost);
	
	@Select("SELECT M.NAME, M.PROFILEPIC, F.*, FPF.SRC, (ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM "
			+ "FROM MEMBERS M INNER JOIN FAMPOSTS F "
			+ "ON F.WRITER = M.MID "
			+ "LEFT OUTER JOIN FAMPOSTFILES FPF "
			+ "ON F.CODE = FPF.FAMPOSTCODE "
			+ "WHERE F.CODE = "
			+ "(SELECT TOP 1 code FROM FAMPOSTS WHERE REGDATE < (SELECT REGDATE FROM FAMPOSTS WHERE CODE = '5') "
			+ "ORDER BY REGDATE DESC)")
	public FMJoinFamPostFile prevFamPost(String curCode);
	
	@Select("SELECT M.NAME, M.PROFILEPIC, F.*, FPF.SRC, (ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM "
			+ "FROM MEMBERS M INNER JOIN FAMPOSTS F "
			+ "ON F.WRITER = M.MID "
			+ "LEFT OUTER JOIN FAMPOSTFILES FPF "
			+ "ON F.CODE = FPF.FAMPOSTCODE "
			+ "WHERE F.CODE = "
			+ "(SELECT TOP 1 code FROM FAMPOSTS WHERE REGDATE > (SELECT REGDATE FROM FAMPOSTS WHERE CODE = '5') "
			+ "ORDER BY REGDATE ASC)")
	public FMJoinFamPostFile nextFamPost(String curCode);
	
}
