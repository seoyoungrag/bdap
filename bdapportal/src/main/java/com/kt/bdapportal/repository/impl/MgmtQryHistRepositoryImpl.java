package com.kt.bdapportal.repository.impl;

import java.math.BigInteger;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.PersistenceContext;


import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtQryHist;
import com.kt.bdapportal.repository.MgmtQryHistRepositoryCustom;

public class MgmtQryHistRepositoryImpl implements MgmtQryHistRepositoryCustom {

	
	@PersistenceContext
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<MgmtQryHist> mgmtQryHistList(SearchVO searchVO){

		String query = "SELECT QRY_HIVE_ID,QRY_USER,QRY_STATEMENT,DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y-%m-%d %h:%i:%s') AS QRY_START_DT,DATE_FORMAT(FROM_UNIXTIME(QRY_END_DT/1000),'%Y-%m-%d %h:%i:%s') AS QRY_END_DT,QRY_STATUS,QRY_INVOKER_SYSTEM,QRY_DURATION FROM MGMT_QRY_HIST ";
		String where = "WHERE FROM_UNIXTIME(QRY_START_DT/1000) BETWEEN STR_TO_DATE(:startDate,'%Y/%m/%d') and STR_TO_DATE(:endDate,'%Y/%m/%d')";
		
		Long durationStart = 0L;
		Long durationEnd = 0L;
		
		if(searchVO.getSearchType().equals("longterm")){
			durationStart = (long) (searchVO.getTerm()*60*60*1000);
			
			if(searchVO.getTerm() == 9){
				durationEnd = (long) ((searchVO.getTerm()+1)*60*60*1000);
				where += " AND QRY_DURATION BETWEEN :durationStart AND :durationEnd";
			}else{
				where += " AND QRY_DURATION >= :durationStart";
			}
		}
		
		String order = " ORDER BY QRY_START_DT DESC LIMIT :startNum, :rows";
		query+=where+order;
		
		Query queryObj = entityManager.createNativeQuery(query,MgmtQryHist.class);
		queryObj.setParameter("startDate", searchVO.getStartDate());
		queryObj.setParameter("endDate", searchVO.getEndDate());
		
		if(searchVO.getSearchType().equals("longterm")){
			queryObj.setParameter("durationStart", durationStart);
			if(searchVO.getTerm() == 9){
				queryObj.setParameter("durationEnd", durationEnd);
			}
		}
		
		queryObj.setParameter("startNum", searchVO.getStartNum());
		queryObj.setParameter("rows", searchVO.getRows());
		
		return queryObj.getResultList();
	}
	
	public Long mgmtQryHistListCount(SearchVO searchVO){
		String query = "SELECT COUNT(*) CNT FROM (SELECT * FROM MGMT_QRY_HIST ";
		String where = "WHERE FROM_UNIXTIME(QRY_START_DT/1000) BETWEEN STR_TO_DATE(:startDate,'%Y/%m/%d') and STR_TO_DATE(:endDate,'%Y/%m/%d')";
		
		Long durationStart = 0L;
		Long durationEnd = 0L;
		
		if(searchVO.getSearchType().equals("longterm")){
			durationStart = (long) (searchVO.getTerm()*60*60*1000);
			
			if(searchVO.getTerm() == 9){
				durationEnd = (long) ((searchVO.getTerm()+1)*60*60*1000);
				where += " AND QRY_DURATION BETWEEN :durationStart AND :durationEnd";
			}else{
				where += " AND QRY_DURATION >= :durationStart";
			}
		}
		
		query += where + " ) CNT";
		
		Query queryObj = entityManager.createNativeQuery(query);
		queryObj.setParameter("startDate", searchVO.getStartDate());
		queryObj.setParameter("endDate", searchVO.getEndDate());
		
		if(searchVO.getSearchType().equals("longterm")){
			queryObj.setParameter("durationStart", durationStart);
			if(searchVO.getTerm() == 9){
				queryObj.setParameter("durationEnd", durationEnd);
			}
		}
		
		BigInteger count =  (BigInteger)queryObj.getSingleResult();
		
		return count.longValue();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MgmtQryHist> mgmtPersonalQryHistList(SearchVO searchVO){
		String query = "SELECT DEC_QRY_ID as QRY_HIVE_ID,DEC_QRY_USER as QRY_USER,DEC_QRY_STATEMENT as QRY_STATEMENT,DATE_FORMAT(FROM_UNIXTIME(DEC_QRY_ACCESS_DT/1000),'%Y-%m-%d %h:%i:%s') AS QRY_START_DT,"
				+ "'' AS QRY_END_DT,'' as QRY_INVOKER_SYSTEM,DEC_QRY_SCH_INFO as QRY_STATUS,'' as QRY_DURATION FROM MGMT_DEC_QRY_HIST ";
		String where = "WHERE 1=1";
		String order = " ORDER BY DEC_QRY_ACCESS_DT DESC LIMIT :startNum, :rows";
		query+=where+order;
		
		Query queryObj = entityManager.createNativeQuery(query,MgmtQryHist.class);
		
		queryObj.setParameter("startNum", searchVO.getStartNum());
		queryObj.setParameter("rows", searchVO.getRows());
		
		return queryObj.getResultList();
	}
	
	public Long mgmtPersonalQryHistListCount(SearchVO searchVO){
		String query = "SELECT COUNT(*) CNT FROM (SELECT * FROM MGMT_DEC_QRY_HIST) CNT";
		BigInteger count =  (BigInteger)entityManager.createNativeQuery(query).getSingleResult();
		return count.longValue();
	}
}
