package com.eoot.eootprj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.eoot.eootprj.model.VilPostJoinMember;

public interface VilPostFileDao {
	@Select("SELECT VilPosts.*, Members.* "
			+ "FROM VilPosts "
			+ "INNER JOIN Members "
			+ "ON Members.Mid = VilPosts.writer;")
	public List<VilPostFileJoinMember> getVilPosts();
}
