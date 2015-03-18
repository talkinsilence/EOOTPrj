package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.FamPostComment;

public interface FamPostCommentDao {
	public int insert(FamPostComment famPostComment);
	public	List<FamPostComment> getFamPostComments(String famPostCode);
}
