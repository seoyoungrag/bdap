package com.kt.bdapportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapRole;

@Repository("bdapRoleRepository")
public interface BdapRoleRepository extends JpaRepository<BdapRole, String>{
	
	public BdapRole findByRoleId(String roleId);

}
