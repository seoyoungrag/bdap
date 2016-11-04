package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapRole;
import com.kt.bdapportal.domain.BdapRoleUser;
import com.kt.bdapportal.domain.BdapUser;

@Repository("bdapRoleUserRepository")
public interface BdapRoleUserRepository extends JpaRepository<BdapRoleUser, String>{

	List<BdapRoleUser> getUserListByRoleId(BdapRole br);
	BdapRoleUser getRoleIdByUserId(BdapUser bu);
	List<BdapRoleUser> getUserListByUserIdIn(List<BdapUser> bu);
	
}
