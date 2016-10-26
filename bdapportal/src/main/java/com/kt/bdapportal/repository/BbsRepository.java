package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapBbs;


@Repository("bbsRepository")
public interface BbsRepository extends JpaRepository<BdapBbs,String>,BbsRepositoryCustom{

	@Query(value="SELECT * FROM BDAP_BBS WHERE BBS_TYPE=?1 AND BBS_PARENT_BBS_ID IS NULL ORDER BY BBS_REG_DT DESC LIMIT ?2,?3", nativeQuery = true)
	List<BdapBbs> findByBbsType(String bbsType,int startnum,int size);
	
	@Query(value="SELECT COUNT(*) CNT FROM (SELECT * FROM BDAP_BBS WHERE BBS_TYPE=?1 and BBS_PARENT_BBS_ID IS NULL) CNT", nativeQuery = true)
	Long qnaListCountForMainPage(String bbsType);
}
