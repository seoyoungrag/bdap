package com.kt.bdapportal.repository.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapRole;
import com.kt.bdapportal.domain.BdapRoleUser;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.repository.BdapUserRepositoryCustom;

public class BdapUserRepositoryImpl implements BdapUserRepositoryCustom {
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<BdapRoleUser> getBdapUserListBySearchVO(SearchVO searchVO) {
		String userId = searchVO.nullTrim(searchVO.getUserId());
		String userNm = searchVO.nullTrim(searchVO.getUserNm());
		String roleId = searchVO.nullTrim(searchVO.getRoleId());
		
		CriteriaBuilder builder = entityManager.getCriteriaBuilder();
		CriteriaQuery<BdapRoleUser> criteria = builder.createQuery(BdapRoleUser.class);
		Root<BdapRoleUser> rRoleUser = criteria.from(BdapRoleUser.class);
		Join<BdapUser, BdapRoleUser> user = rRoleUser.join("userId"); 
		Join<BdapRole, BdapRoleUser> role = rRoleUser.join("roleId");
		
		List<Predicate> predicates = new ArrayList<Predicate>();
		if(!userId.equals("")){
			Predicate pUserId = builder.like(user.<String>get("userId"),"%"+userId+"%");
			predicates.add(pUserId);
		}
		if(!userNm.equals("")){
			Predicate pUserNm = builder.like(user.<String>get("userNm"),"%"+userNm+"%");
			predicates.add(pUserNm);
		}
		if(!roleId.equals("")){
			Predicate pRoleId = builder.like(role.<String>get("roleId"),"%"+roleId+"%");
			predicates.add(pRoleId);
		}
		if(!predicates.isEmpty()){
			criteria.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
		}
		List<BdapRoleUser> bdapRoleUser = entityManager.createQuery(criteria).getResultList();
		return bdapRoleUser;
	}

}
