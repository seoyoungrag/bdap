package com.kt.bdapportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapCryptoCol;

@Repository("bdapCryptoColRepository")
public interface BdapCryptoColRepository extends JpaRepository<BdapCryptoCol, String>{

	
	
	
	
}
