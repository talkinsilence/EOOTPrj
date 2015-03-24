package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.FamPostComment;
import com.eoot.eootprj.model.FamPostCommentJoinMember;

public interface FamPostCommentDao {
	
	public int insert(FamPostComment famPostComment);
	
	@Select("SELECT "
			+ "FC.*, M.NAME, M.PROFILEPIC, (ROW_NUMBER() OVER (ORDER BY FC.REGDATE DESC)) NUM "
			+ "FROM FAMPOSTCOMMENTS FC "
			+ "INNER JOIN MEMBERS M "
			+ "ON FC.WRITER = M.MID "
			+ "WHERE FC.FAMPOSTCODE = #{FAMPOSTCODE}")
	public	List<FamPostCommentJoinMember> getFamPostComments(String famPostCode);
	
}
