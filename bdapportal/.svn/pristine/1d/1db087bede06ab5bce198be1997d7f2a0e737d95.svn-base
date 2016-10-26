package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.domain.BdapUserAcl;

@Repository("bdapUserAclRepository")
public interface BdapUserAclRepository extends JpaRepository<BdapUserAcl, String>{

	void deleteByBdapUserUserId(String userId);
	List<BdapUserAcl> getBdapUserAclByUserId(BdapUser userId);
	
}
