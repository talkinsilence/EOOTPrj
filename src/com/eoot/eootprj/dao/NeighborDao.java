package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.Neighbor;
import com.eoot.eootprj.model.NeighborJoinMember;

public interface NeighborDao {
	public int insertNei(Neighbor nei);
	public List<NeighborJoinMember> getNeighbors(String uid);
	public List<NeighborJoinMember> getNeiInvsMe(String uid);
	public List<NeighborJoinMember> getNeiInvs(String acceptmid);
	public int deleteInvMe(String uid, String acceptmid);
}
