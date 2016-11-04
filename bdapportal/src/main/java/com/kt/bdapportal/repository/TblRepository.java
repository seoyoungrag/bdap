package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapTbl;

@Repository("tblRepository")
public interface TblRepository extends JpaRepository<BdapTbl, String>,TblRepositoryCustom{
	
	
	@Query(value="SELECT * FROM BDAP_TBL WHERE TBL_IS_MANAGED='n' and TBL_OWNER=?1 and TBL_VALIDATE_DATE >= DATE_ADD(now(),interval 7 day) order by TBL_VALIDATE_DATE desc limit 0,5", nativeQuery = true)
	public List<BdapTbl> expirationDateNearTable(String userId); 
	
	/*@Query(value="SELECT * FROM BDAP_TBL A WHERE TBL_OWNER=?1 A.TBL_DB_NM=?2 ORDER BY CAST(TBL_ID AS UNSIGNED INTEGER) ASC LIMIT ?2 , ?3", nativeQuery = true)*/
	@Query(value="SELECT * FROM BDAP_TBL WHERE TBL_OWNER=?1 ORDER BY CAST(TBL_ID AS UNSIGNED INTEGER) ASC LIMIT ?2 , ?3", nativeQuery = true)
	public List<BdapTbl> schemaList(String userId,int startNum,int rows);

	@Query(value="SELECT * FROM BDAP_TBL WHERE TBL_ID=?1 ORDER BY CAST(TBL_ID AS UNSIGNED INTEGER) ASC", nativeQuery = true)
	public BdapTbl schema(String tblId);
	
	@Query(value="SELECT COUNT(*) CNT FROM (SELECT * FROM BDAP_TBL WHERE TBL_OWNER=?1 ORDER BY CAST(TBL_ID AS UNSIGNED INTEGER) ASC) CNT", nativeQuery = true)
	public Long schemaCount(String userId);
	
	@Query(value="SELECT GROUP_CONCAT(TBL_ID SEPARATOR ',') AS TBL_ID,TBL_KOR_NM,GROUP_CONCAT(TBL_ENG_NM SEPARATOR ',') AS TBL_ENG_NM,TBL_IS_CHK_NULL,TBL_IS_CHK_TYPE,TBL_CREATE_DT,TBL_VALIDATE_DATE,TBL_IS_MANAGED,TBL_TYPE,TBL_DB_NM,TBL_DESC,TBL_RECENTLY_SYNC_DATE,TBL_OWNER,TBL_LOCATION FROM BDAP_TBL GROUP BY TBL_DB_NM ORDER BY TBL_ID, TBL_DB_NM", nativeQuery = true)
	public List<BdapTbl> tblTree();
	
	@Query(value="SELECT * FROM BDAP_TBL WHERE TBL_OWNER=?1 AND TBL_KOR_NM LIKE CONCAT('%',?2,'%') ORDER BY CAST(TBL_ID AS UNSIGNED INTEGER) ASC LIMIT 0 , 1", nativeQuery = true)
	public BdapTbl schemaByTblKorNm(String userId,String searchWord);
	
	@Query(value="SELECT * FROM BDAP_TBL WHERE TBL_OWNER=?1 AND TBL_ENG_NM LIKE CONCAT('%',?2,'%') ORDER BY CAST(TBL_ID AS UNSIGNED INTEGER) ASC LIMIT 0 , 1", nativeQuery = true)
	public BdapTbl schemaByTblEngNm(String userId,String searchWord);
	
	@Query(value="SELECT * FROM BDAP_TBL WHERE TBL_DB_NM=?1 ORDER BY CAST(TBL_ID AS UNSIGNED INTEGER) ASC ", nativeQuery = true)
	public List<BdapTbl> tblList(String schema);
	   	
	@Query(value="SELECT * FROM BDAP_TBL WHERE TBL_ID=?1", nativeQuery = true)
	public BdapTbl findByTblId(String tblId);
	
	@Query(value="SELECT DISTINCT TBL_DB_NM FROM BDAP_TBL", nativeQuery = true)
	public List<String> findDistinctByTblDbNm();

	@Query(value="SELECT * FROM BDAP_TBL WHERE TBL_ID=?1 ORDER BY CAST(TBL_ID AS UNSIGNED INTEGER) ASC", nativeQuery = true)
	public BdapTbl getSchemaListByTblId(String tblId);
	
	@Query(value="SELECT TBL_DB_NM FROM BDAP_TBL GROUP BY TBL_DB_NM ORDER BY TBL_DB_NM ASC", nativeQuery = true)
	public List<String> getSchemaListForAdmin();
	
	@Query(value="SELECT TBL_DB_NM FROM BDAP_TBL WHERE TBL_OWNER=?1 GROUP BY TBL_DB_NM ORDER BY TBL_DB_NM ASC;", nativeQuery = true)
	public List<String> getSchemaListForUser(String userId);

	public List<BdapTbl> getBdapTblByTblKorNmIgnoreCaseContaining(String searchWord);

	public List<BdapTbl> getBdapTblByTblEngNmIgnoreCaseContaining(String searchWord);
}
