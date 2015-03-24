package com.eoot.eootprj.dao;

import java.util.List;

import com.eoot.eootprj.model.FamInvitation;
import com.eoot.eootprj.model.FamInvitationJoinMember;

public interface FamInvitationDao {
	public int insertInv(FamInvitation famInvitation);
	public int deleteInv(String uid, String acceptmid);
	public FamInvitation getInv(String acceptmid, String askmid);
	public List<FamInvitationJoinMember> getInvsMe(String uid);
	public List<FamInvitationJoinMember> getInvs(String acceptmid);
}
