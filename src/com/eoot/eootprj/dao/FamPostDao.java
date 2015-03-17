package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.eoot.eootprj.model.FamPost;
import com.eoot.eootprj.model.FamPostJoinMember;

public interface FamPostDao {
	@Select("SELECT * FROM FamPosts WHERE CODE = #{code}")
	public FamPost getFamPost(String code);
	
	@Select("SELECT * FROM MEMBERS INNER JOIN FAMPOSTS ON MEMBERS.MID=FAMPOSTS.WRITER ORDER BY FAMPOSTS.REGDATE DESC;")
	public List<FamPostJoinMember> getFamPosts();
	
	@Select("SELECT TOP 1 * FROM FamPosts "
			+ "WHERE REGDATE &gt; (SELECT REGDATE FROM FamPosts "
			+ "WHERE CODE = #{code})ORDER BY REGDATE ASC")
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