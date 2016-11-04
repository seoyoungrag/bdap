package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapBbs;


@Repository("bbsRepository")
public interface BbsRepository extends JpaRepository<BdapBbs,String>,BbsRepositoryCustom{

	@Query(value="SELECT * FROM BDAP_BBS WHERE BBS_TYPE=?1 AND BBS_PARENT_BBS_ID IS NULL AND BBS_DELETED_YN = 'N'  ORDER BY BBS_EMERGENCY_YN DESC, BBS_REG_DT DESC LIMIT ?2,?3", nativeQuery = true)
	List<BdapBbs> findByBbsType(String bbsType,int startnum,int size);
	
	@Query(value="SELECT COUNT(*) CNT FROM (SELECT * FROM BDAP_BBS WHERE BBS_TYPE=?1 AND BBS_DELETED_YN = 'N'  and BBS_PARENT_BBS_ID IS NULL) CNT", nativeQuery = true)
	Long qnaListCountForMainPage(String bbsType);
	
	
	@Query(value="SELECT BBS_ID,BBS_TYPE,BBS_REG_DT,BBS_MOD_DT,BBS_DELETED_YN,BBS_EMERGENCY_YN,BBS_CONTENT,BBS_HIT,BBS_PARENT_BBS_ID,BBS_WRITER_ID,BBS_WRITER_EMAIL,"
			+ "BBS_WRITER_NM,BBS_TITLE, "
			+ "(SELECT CATE_NAME FROM BDAP_BBS_CATEGORY WHERE CATE_ID = BBS_CATEGORY) AS BBS_CATEGORY, "
			+ "(SELECT CATE_NAME FROM BDAP_BBS_CATEGORY WHERE CATE_ID = BBS_CATEGORY_SUB) AS BBS_CATEGORY_SUB "
			+ " FROM BDAP_BBS WHERE BBS_ID=?1 AND BBS_DELETED_YN = 'N'   ", nativeQuery = true)
	BdapBbs getQnaBbsbyId (String bbsId);
}
