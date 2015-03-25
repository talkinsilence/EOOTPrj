package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.Neighbor;
import com.eoot.eootprj.model.NeighborJoinMember;

public interface NeighborDao {
	public int insertNei(Neighbor nei);
	public List<NeighborJoinMember> getNeighbors(String uid);
	public List<NeighborJoinMember> getNeiInvs(String uid);
	public List<NeighborJoinMember> getNeiInvsMe(String uid);
	public int deleteInvMe(String askmid, String acceptmid);
	public int updateNeiAccept(String askmid, String acceptmid);
}
