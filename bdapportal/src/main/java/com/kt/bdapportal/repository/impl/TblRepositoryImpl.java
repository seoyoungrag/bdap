package com.kt.bdapportal.repository.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapTbl;
import com.kt.bdapportal.domain.MgmtTblStat;
import com.kt.bdapportal.repository.TblRepositoryCustom;

public class TblRepositoryImpl implements TblRepositoryCustom {
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<BdapTbl> getBdapTbl(BdapTbl tbl) {
		CriteriaBuilder builder = entityManager.getCriteriaBuilder();
		CriteriaQuery<BdapTbl> criteria = builder.createQuery(BdapTbl.class);
		Root<BdapTbl> rTbl = criteria.from(BdapTbl.class);
		
		List<Predicate> predicates = new ArrayList<Predicate>();
		if (tbl.getTblDbNm() != null && !tbl.getTblDbNm().equals("")){
			//metamodel을 만드는 구조는 아님..
			//Predicate dbNm = criteria.equals(rTbl.get(BdapTbl_.tblDbNm), 1000);
			Predicate dbNm = builder.equal(rTbl.get("tblDbNm"), tbl.getTblDbNm());
			predicates.add(dbNm);
		}
		if(tbl.getTblEngNM() != null && !tbl.getTblEngNM().equals("")){
			Predicate tblNm = builder.equal(rTbl.get("tblEngNm"), tbl.getTblEngNM());
			predicates.add(tblNm);
		}
		if (!predicates.isEmpty()){
			criteria.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
		}
		List<BdapTbl> tblList = entityManager.createQuery(criteria).getResultList();
		return tblList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BdapTbl> userTblList(SearchVO searchVO) {
 
		StringBuffer query = new StringBuffer("SELECT TBL_ID,TBL_KOR_NM, TBL_ENG_NM,TBL_IS_CHK_NULL,TBL_IS_CHK_TYPE,DATE_FORMAT(FROM_UNIXTIME(TBL_CREATE_DT/1000),'%Y-%m-%d %h:%i:%s') AS TBL_CREATE_DT,TBL_VALIDATE_DATE,TBL_IS_MANAGED,TBL_TYPE,TBL_DB_NM,TBL_DESC,TBL_RECENTLY_SYNC_DATE,"
			+ "(select sum(TBL_CNT) from MGMT_TBL_STAT where DB_NAME = TBL_DB_NM and TBL_NAME = TBL_ENG_NM) as TBL_OWNER, "
			+ "(select sum(tbl_size) from MGMT_TBL_STAT where DB_NAME = TBL_DB_NM and TBL_NAME = TBL_ENG_NM) as TBL_LOCATION FROM BDAP_TBL ");
		StringBuffer where = new StringBuffer(
				"WHERE 1=1");

		//searchVO의 userId가 ""이면 관리자로 판단한다.
		if(!searchVO.getUserId().equals("")){
			where.append(" AND TBL_OWNER = :userId");
		}
		if(!searchVO.getSearchWord().equals("")){
			where.append(" AND TBL_DB_NM = :tblDbNm");
		}

		String order = " ORDER BY CAST(TBL_ID AS UNSIGNED INTEGER) ASC";
		query.append(where).append(order);

		Query queryObj = entityManager.createNativeQuery(query.toString(), BdapTbl.class);
		
		if(!searchVO.getUserId().equals("")){
			queryObj.setParameter("userId", searchVO.getUserId());
		}
		if(!searchVO.getSearchWord().equals("")){
			queryObj.setParameter("tblDbNm", searchVO.getSearchWord());
		}
		
		return queryObj.getResultList();
	}
}
