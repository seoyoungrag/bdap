package com.kt.bdapportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.domain.BdapTbl;


@Repository("ndapSyncRepository")
public interface NdapSyncRepository extends JpaRepository<BdapTbl,String>{
	
}
