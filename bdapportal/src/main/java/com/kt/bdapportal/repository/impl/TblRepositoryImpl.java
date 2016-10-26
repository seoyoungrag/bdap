package com.kt.bdapportal.repository.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.kt.bdapportal.domain.BdapTbl;
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
			Predicate tblNm = builder.equal(rTbl.get("tblEngNM"), tbl.getTblEngNM());
			predicates.add(tblNm);
		}
		if (!predicates.isEmpty()){
			criteria.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
		}
		List<BdapTbl> tblList = entityManager.createQuery(criteria).getResultList();
		return tblList;
	}

}
