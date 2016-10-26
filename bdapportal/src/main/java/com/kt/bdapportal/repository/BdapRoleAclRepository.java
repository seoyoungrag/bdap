package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapRole;
import com.kt.bdapportal.domain.BdapRoleAcl;

@Repository("bdapRoleAclRepository")
public interface BdapRoleAclRepository extends JpaRepository<BdapRoleAcl, String>{

	List<BdapRoleAcl> getBdapRoleAclByRoleId(BdapRole br);
	
}
