package com.kt.bdapportal.repository.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.kt.bdapportal.domain.BdapCol;
import com.kt.bdapportal.repository.BdapColRepositoryCustom;

public class BdapColRepositoryImpl implements BdapColRepositoryCustom {
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<BdapCol> getBdapCol(BdapCol col) {
		CriteriaBuilder builder = entityManager.getCriteriaBuilder();
		CriteriaQuery<BdapCol> criteria = builder.createQuery(BdapCol.class);
		Root<BdapCol> rCol = criteria.from(BdapCol.class);
		
		List<Predicate> predicates = new ArrayList<Predicate>();
		if(col.getColTblId() != null){
			Predicate dbNm = builder.equal(rCol.get("colTblId"), col.getColTblId());
			predicates.add(dbNm);
		}
		if (!predicates.isEmpty()){
			criteria.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
		}
		List<BdapCol> colList = entityManager.createQuery(criteria).getResultList();
		return colList;
	}

}
