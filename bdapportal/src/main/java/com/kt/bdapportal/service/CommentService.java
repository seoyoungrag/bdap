package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.domain.BdapComment;

public interface CommentService {

	
	public BdapComment commentInsert(BdapComment bdapComment);			
	
	public List<BdapComment> getCommentList(String bbsParentId);
	
	public void commentDelete(BdapComment bdapComment);
	
	public Long countByCmtParentBbsId(String bbsParentId);
	
	
}
