package com.kt.bdapportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapQna;

@Repository("qnaRepository")
public interface QnaRepository  extends JpaRepository<BdapQna,String> {

	Long countByqnaStatus(char qnaStatus);
	
	
	
	
	
}
