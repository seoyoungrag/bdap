package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapAcl;

@Repository("bdapAclRepository")
public interface BdapAclRepository extends JpaRepository<BdapAcl, String>{

	@Query(value="SELECT * FROM BDAP_ACL WHERE ACL_PARENT_ID IS NULL ORDER BY ACL_ID ASC", nativeQuery = true)
	public List<BdapAcl> bdapAclList(); 
	
	@Query(value="SELECT * FROM BDAP_ACL ORDER BY ACL_ID ASC", nativeQuery = true)
	public List<BdapAcl> allAclList(); 
	
	
}
