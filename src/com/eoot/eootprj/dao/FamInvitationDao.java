package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.FamInvitation;
import com.eoot.eootprj.model.FamInvitationJoinMember;

public interface FamInvitationDao {
	public int insertInv(FamInvitation famInvitation);
	public int deleteInv(String askmid, String uid);
	public FamInvitation getInv(String askmid, String acceptmid);
	public List<FamInvitationJoinMember> getInvsMe(String uid);
	public List<FamInvitationJoinMember> getInvs(String askmid);
	public int updateFamAccept(String askmid, String acceptmid);
}
