package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapUser;

@Repository("bdapUserRepository")
public interface BdapUserRepository extends JpaRepository<BdapUser, String>,BdapUserRepositoryCustom {

	@Query(value="SELECT * FROM BDAP_USER ORDER BY USER_NM ASC", nativeQuery = true)
	public List<BdapUser> findAllOrderByUserNm();
	
	@Query(value="SELECT * FROM BDAP_USER ORDER BY USER_NM ASC LIMIT 0,1", nativeQuery = true)
	public BdapUser findOneLimit();
	
	@Query(value="SELECT * FROM BDAP_USER WHERE USER_ID=?1", nativeQuery = true)
	public BdapUser findByUserId(String userId);
	
}
