package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapComment;

@Repository("commentRepository")
public interface CommentRepository extends JpaRepository<BdapComment,String> {

	
	
	List<BdapComment> findByCmtParentBbsIdOrderByCmtRegDtDesc (String fleParentId);
	Long countByCmtParentBbsId(String parentBbsId);
	
	
}
