package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.VilPostCommentJoinMember;

public interface VilPostCommentDao {

	@Select("SELECT M.NAME, M.PROFILEPIC, V.* ,"
			+ "(ROW_NUMBER() OVER (ORDER BY V.REGDATE DESC)) NUM "
			+ "FROM MEMBERS M INNER JOIN VILPOSTcomments V "
			+ "ON M.MID=V.WRITER;")
	public List<VilPostCommentJoinMember> getVilPostComments();
	
}
