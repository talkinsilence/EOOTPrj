package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.eoot.eootprj.model.FamPostCommentJoinMember;
import com.eoot.eootprj.model.VilPostComment;
import com.eoot.eootprj.model.VilPostCommentJoinMember;

public interface VilPostCommentDao {

	@Select("SELECT M.NAME, M.PROFILEPIC, V.* ,"
			+ "(ROW_NUMBER() OVER (ORDER BY V.REGDATE DESC)) NUM "
			+ "FROM MEMBERS M INNER JOIN VILPOSTcomments V "
			+ "ON M.MID=V.WRITER;")
	public List<VilPostCommentJoinMember> getVilPostComments();
	
	/*@Select("SELECT M.NAME, M.PROFILEPIC, V.* ,"
			+ "(ROW_NUMBER() OVER (ORDER BY V.REGDATE DESC)) NUM "
			+ "FROM MEMBERS M INNER JOIN VILPOSTcomments V "
			+ "ON M.MID=V.WRITER "
			+ "WHERE V.ViLPOSTCODE = #{VILPOSTCODE}")
	public List<VilPostCommentJoinMember> getVilPostComments(String vilPostCode);*/
	
	/*@SelectKey(before = true
			, keyColumn = "code"
			, statement = "SELECT ISNULL(MAX(CAST(CODE AS INT)),0)+1 CODE FROM VilPostComments"
			, resultType = java.lang.String.class
			, keyProperty = "String")
	@Insert("INSERT INTO VilPostComments(CODE, content, writer, VilPostCode, Regdate) "
			+ "VALUES(code, #{content}, #{writer}, #{VilPostCode}, getDate()")
	public int insert(VilPostCommentJoinMember vilPostCommentJoinMember);*/
	
	/*@SelectKey(before = true
			, keyColumn = "code"
			, statement = "SELECT ISNULL(MAX(CAST(CODE AS INT)),0)+1 CODE FROM VilPostComments"
			, resultType = java.lang.String.class
			, keyProperty = "String")
	@Insert("INSERT INTO VilPostComments(CODE, content, writer, VilPostCode, Regdate) "
			+ "VALUES(code, #{content}, #{writer}, #{VilPostCode}, getDate()")
	public int insert(VilPostComment vilPostComment);*/
	
	@Insert("INSERT INTO VILPOSTCOMMENTS(CODE, CONTENT, WRITER, VILPOSTCODE, REGDATE) "
			+ "VALUES((SELECT ISNULL(MAX(CAST(CODE AS INT)),0)+1 CODE "
			+ "FROM VIlPOSTCOMMENTS), #{content}, #{writer}, #{vilPostCode}, getDate())")
	public int insert(VilPostComment vilPostComment);

}
