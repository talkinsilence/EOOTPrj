package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.Neighbor;
import com.eoot.eootprj.model.NeighborJoinMember;

public interface NeighborDao {
	public int insertNei(Neighbor nei);
	/*public List<NeighborJoinMember> getNeisMe(String uid);*/
	public List<NeighborJoinMember> getNeis(String acceptmid);
}
