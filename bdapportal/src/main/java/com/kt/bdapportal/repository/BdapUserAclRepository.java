package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.domain.BdapUserAcl;
import com.kt.bdapportal.domain.MgmtTblStat;

@Repository("bdapUserAclRepository")
public interface BdapUserAclRepository extends JpaRepository<BdapUserAcl, String>{

	void deleteByBdapUserUserId(String userId);
	List<BdapUserAcl> getBdapUserAclByUserId(BdapUser userId);
	
	@Query(value="SELECT "
		+ "C.ACL_URI "
		+ "FROM BDAP_ROLE_USER A, BDAP_ROLE_ACL  B, BDAP_ACL C "
		+ "WHERE A.ROLE_ID = B.ROLE_ID AND B.ACL_ID = C.ACL_ID AND A.USER_ID=?1 "
		+ "UNION "
		+ "SELECT  "
		+ "B.ACL_URI "
		+ "FROM BDAP_USER_ACL  A, BDAP_ACL B "
		+ "WHERE A.ACL_ID = B.ACL_ID AND A.USER_ID=?1", nativeQuery = true)
	public List<String> aclListByUserId(String userId);
}
