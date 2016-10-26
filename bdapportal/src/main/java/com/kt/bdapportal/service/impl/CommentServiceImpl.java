package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.domain.BdapComment;
import com.kt.bdapportal.repository.CommentRepository;
import com.kt.bdapportal.service.CommentService;


@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentRepository commentRepository;
	
	
	@Override
	public BdapComment commentInsert(BdapComment bdapComment){			//insert 와 update를 진행한다.
		
		commentRepository.save(bdapComment);
		commentRepository.flush();
		
		return bdapComment;
	}
	
	
	
	public List<BdapComment> getCommentList(String bbsParentId){
		
		List<BdapComment> bdapCommentList = commentRepository.findByCmtParentBbsIdOrderByCmtRegDtDesc(bbsParentId);
		
		return bdapCommentList;
	}
	
	public void commentDelete(BdapComment bdapComment){
		
		commentRepository.delete(bdapComment);
		commentRepository.flush();
		
	}
	
	public Long countByCmtParentBbsId(String bbsPostId){
		
		return commentRepository.countByCmtParentBbsId(bbsPostId);
		
	}

	
	
}
