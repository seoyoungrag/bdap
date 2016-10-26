package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapFile;

@Repository("fileRepository")
public interface FileRepository extends JpaRepository<BdapFile,String>{

	
	
	//@Query(value ="select * from BDAP_FILE where FLE_PARENT_ID = ?1", nativeQuery = true)
	List<BdapFile> findByfleParentId (String fleParentId);
	
	
	@Query(value ="select * from BDAP_FILE where FLE_PARENT_ID IN (?1) ", nativeQuery = true)
	List<BdapFile> findByfleParentIdArr (String fleParentId);
	
	
	void removeByfleParentId(String fleParentId);
	
	
}
