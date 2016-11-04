package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapCol;


@Repository("colRepository")
public interface BdapColRepository extends JpaRepository<BdapCol, String>,BdapColRepositoryCustom {

	
	@Query(value="SELECT * FROM BDAP_COL WHERE COL_TBL_ID=?1 ORDER BY CAST(COL_ORDER_NUM AS UNSIGNED INTEGER) ASC LIMIT ?2 , ?3", nativeQuery = true)
	public List<BdapCol> colList(String tblId,int startNum,int rows);
	
	
	@Query(value="SELECT COUNT(*) CNT FROM (SELECT * FROM BDAP_COL WHERE COL_TBL_ID=?1) CNT", nativeQuery = true)
	public Long colCount(String tblId);
	
	
	@Query(value="SELECT * FROM BDAP_COL WHERE COL_KOR_NM LIKE CONCAT('%',?1,'%') ORDER BY CAST(COL_ORDER_NUM AS UNSIGNED INTEGER) ASC LIMIT ?2,?3", nativeQuery = true)
	public List<BdapCol> colByColKorNm(String searchWord,int startNum,int rows);
	
	@Query(value="SELECT * FROM BDAP_COL WHERE COL_ENG_NM LIKE CONCAT('%',?1,'%') ORDER BY CAST(COL_ORDER_NUM AS UNSIGNED INTEGER) ASC LIMIT ?2,?3", nativeQuery = true)
	public List<BdapCol> colByColEngNm(String searchWord,int startNum,int rows);
	
	@Query(value="SELECT * FROM BDAP_COL WHERE COL_DESC LIKE CONCAT('%',?1,'%') ORDER BY CAST(COL_ORDER_NUM AS UNSIGNED INTEGER) ASC LIMIT ?2,?3", nativeQuery = true)
	public List<BdapCol> colByColDesc(String searchWord,int startNum,int rows);

	@Query(value="SELECT COUNT(*) CNT FROM (SELECT * FROM BDAP_COL WHERE COL_KOR_NM LIKE CONCAT('%',?1,'%')) CNT ", nativeQuery = true)
	public Long countColByColKorNm(String searchWord);
	
	@Query(value="SELECT COUNT(*) CNT FROM (SELECT * FROM BDAP_COL WHERE COL_ENG_NM LIKE CONCAT('%',?1,'%') ) CNT", nativeQuery = true)
	public Long countColByColEngNm(String searchWord);
	
	@Query(value="SELECT COUNT(*) CNT FROM (SELECT * FROM BDAP_COL WHERE COL_DESC LIKE CONCAT('%',?1,'%') ) CNT", nativeQuery = true)
	public Long countColByColDesc(String searchWord);

	@Query(value="SELECT * FROM BDAP_COL WHERE COL_TBL_ID=?1 ORDER BY CAST(COL_ORDER_NUM AS UNSIGNED INTEGER) ASC ", nativeQuery = true)
	public List<BdapCol> colListByTblId(String tblId);
	
	
	
	@Query(value="SELECT * FROM BDAP_COL WHERE COL_TBL_ID=?1 AND COL_KOR_NM LIKE CONCAT('%',?2,'%') ORDER BY CAST(COL_ORDER_NUM AS UNSIGNED INTEGER) ASC", nativeQuery = true)
	public List<BdapCol> colByColKorNm(String tblId,String searchWord);
	
	@Query(value="SELECT * FROM BDAP_COL WHERE COL_TBL_ID=?1 AND COL_ENG_NM LIKE CONCAT('%',?2,'%') ORDER BY CAST(COL_ORDER_NUM AS UNSIGNED INTEGER) ASC", nativeQuery = true)
	public List<BdapCol> colByColEngNm(String tblId,String searchWord);
	
	@Query(value="SELECT * FROM BDAP_COL WHERE COL_TBL_ID=?1 AND COL_DESC LIKE CONCAT('%',?2,'%') ORDER BY CAST(COL_ORDER_NUM AS UNSIGNED INTEGER) ASC", nativeQuery = true)
	public List<BdapCol> colByColDesc(String tblId,String searchWord);

	@Query(value="SELECT * FROM BDAP_COL WHERE COL_TBL_ID=?1 AND COL_IS_ENC ='Y' ORDER BY CAST(COL_ORDER_NUM AS UNSIGNED INTEGER) ASC ", nativeQuery = true)
	public List<BdapCol> getBdapColListByTblIdAndIsPrivate(String colTblId);
	
	
}
