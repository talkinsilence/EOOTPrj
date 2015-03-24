package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.eoot.eootprj.model.FamPost;
import com.eoot.eootprj.model.FamPostJoinMember;

public interface FamPostDao {
	
	@Select("SELECT "
			+ "F.*, M.NAME, M.PROFILEPIC, (ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM "
			+ "FROM FAMPOSTS F "
			+ "INNER JOIN MEMBERS M "
			+ "ON F.WRITER = M.MID "
			+ "WHERE F.CODE = #{CODE}")
	public FamPostJoinMember getFamPost(String code);
	
	@Select("SELECT * "
			+ "FROM (SELECT M.NAME, M.PROFILEPIC, F.* ,(ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM "
			+ "FROM MEMBERS M INNER JOIN FAMPOSTS F ON M.MID=F.WRITER "
			+ "WHERE (F.TITLE LIKE '%${query}%') AND (F.CONTENT LIKE '%${query}%')) MJOINF "
			+ "WHERE MJOINF.NUM BETWEEN 1 AND 30;")
	public List<FamPostJoinMember> getFamPosts(@Param("query")String query);

	/*@Select("SELECT * "
         + "FROM (SELECT M.NAME, M.PROFILEPIC, F.* ,(ROW_NUMBER() OVER (ORDER BY F.REGDATE DESC)) NUM "
         + "FROM MEMBERS M INNER JOIN FAMPOSTS F ON M.MID=F.WRITER "
         + "WHERE F.${param2} LIKE '%${param1}%') MJOINF "
         + "WHERE MJOINF.NUM BETWEEN 1 AND 30;")*/
	
	public int update(FamPost famPost);

	@Delete("DELETE FROM FamPosts WHERE CODE = #{code}")
	public int delete(FamPost famPost);

	@SelectKey(before = true
			, keyColumn = "code"
			, statement = "SELECT ISNULL(MAX(CAST(CODE AS INT)),0)+1 CODE FROM FamPosts"
			, resultType = java.lang.String.class
			, keyProperty = "String")
	@Insert("INSERT INTO FamPosts(CODE, TITLE, CONTENT, WRITER, REGDATE, SHARENEI, SHAREVIL, HIT, LIKECNT, CLIPCNT, COMMENTCNT)"
			+ "VALUES(#{code}, #{title}, #{content}, #{writer}, getDate(), 0, 0, 0, 0, 0, 0)")
	public int insert(FamPost fampost);
	
}
