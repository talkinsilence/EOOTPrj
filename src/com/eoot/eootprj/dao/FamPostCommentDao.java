package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.eoot.eootprj.model.FamPostComment;
import com.eoot.eootprj.model.FamPostCommentJoinMember;

public interface FamPostCommentDao {
	
	@SelectKey(before = true
			, keyColumn = "code"
			, statement = "SELECT ISNULL(MAX(CAST(CODE AS INT)),0)+1 CODE FROM FAMPOSTCOMMENTS"
			, resultType = java.lang.String.class
			, keyProperty = "String")
	@Insert("INSERT INTO FAMPOSTCOMMENTS(CODE, TITLE, CONTENT, WRITER, REGDATE, SHARENEI, SHAREVIL, HIT, LIKECNT, CLIPCNT, COMMENTCNT)"
			+ "VALUES(#{CODE}, #{CONTENT}, #{WRITER}, #{FAMPOSTCODE}, GETDATE())")
	public int insert(FamPostComment famPostComment);
	
	@Select("SELECT "
			+ "FC.*, M.NAME, M.PROFILEPIC, (ROW_NUMBER() OVER (ORDER BY FC.REGDATE DESC)) NUM "
			+ "FROM FAMPOSTCOMMENTS FC "
			+ "INNER JOIN MEMBERS M "
			+ "ON FC.WRITER = M.MID "
			+ "WHERE FC.FAMPOSTCODE = #{FAMPOSTCODE}")
	public	List<FamPostCommentJoinMember> getFamPostComments(String famPostCode);
	
}
