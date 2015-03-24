package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.eoot.eootprj.model.VilPost;
import com.eoot.eootprj.model.VilPostJoinMember;

public interface VilPostDao {
	/*@Select("SELECT * FROM VilPosts WHERE CODE = #{code}")
	public VilPost getVilPost(String code);*/

	@Select("SELECT * "
			+ "FROM (SELECT M.NAME, M.MID, M.PROFILEPIC, M.ADDRESS, V.* ,(ROW_NUMBER() OVER (ORDER BY V.REGDATE DESC)) NUM "
			+ "FROM MEMBERS M INNER JOIN VILPOSTS V ON M.MID=V.WRITER "
			+ "WHERE V.${field} LIKE '%${query}%') MJOINV "
			+ "WHERE MJOINV.NUM BETWEEN 1 AND 30;")
	public List<VilPostJoinMember> getVilPosts(@Param("query")String query, @Param("field")String field);

	
	@Select("SELECT TOP 1 * FROM VilPosts "
			+ "WHERE REGDATE &gt; (SELECT REGDATE FROM VilPosts "
			+ "WHERE CODE = #{code})ORDER BY REGDATE ASC")
	public int update(VilPost vilPost);

	@Delete("DELETE FROM VilPosts WHERE CODE = #{code}")
	public int delete(VilPost vilPost);

	/*@SelectKey(before = true
			, keyColumn = "code"
			, statement = "SELECT ISNULL(MAX(CAST(CODE AS INT)),0)+1 CODE FROM VilPosts"
			, resultType = java.lang.String.class
			, keyProperty = "String")
	@Insert("INSERT INTO VilPosts(CODE,SORT,TITLE,CONTENT,WRITER,REGDATE,HIT,LIKECNT,CLIPCNT,COMMENTCNT) "
			+ "VALUES(code,#{sort},#{title},#{content},#{writer},getDate(),0,0,0,0)")
	public int insert(VilPost vilPost);*/
}