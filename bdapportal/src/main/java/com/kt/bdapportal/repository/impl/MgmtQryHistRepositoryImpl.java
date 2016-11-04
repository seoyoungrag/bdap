package com.kt.bdapportal.repository.impl;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.transform.AliasToEntityMapResultTransformer;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtQryHist;
import com.kt.bdapportal.repository.MgmtQryHistRepositoryCustom;

public class MgmtQryHistRepositoryImpl implements MgmtQryHistRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<MgmtQryHist> mgmtQryHistList(SearchVO searchVO) {

		StringBuffer query = new StringBuffer(
				"SELECT QRY_HIVE_ID,QRY_USER,QRY_STATEMENT,DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y-%m-%d %H:%i:%s') AS QRY_START_DT,DATE_FORMAT(FROM_UNIXTIME(QRY_END_DT/1000),'%Y-%m-%d %H:%i:%s') AS QRY_END_DT,QRY_STATUS,QRY_INVOKER_SYSTEM,QRY_DURATION FROM MGMT_QRY_HIST ");
		StringBuffer where = new StringBuffer(
				"WHERE FROM_UNIXTIME(QRY_START_DT/1000) BETWEEN STR_TO_DATE(:startDate,'%Y/%m/%d') and DATE_ADD(STR_TO_DATE(:endDate,'%Y/%m/%d'), INTERVAL 1 DAY)");

		Long durationStart = 0L;
		Long durationEnd = 0L;

		if (searchVO.getSearchType().equals("longterm")) {
			durationStart = (long) (searchVO.getTermTime() * 60 * 60 * 1000);
				where.append(" AND QRY_STATUS = 'SUCCEEDED' ");
			if (searchVO.getTermTime() == 0) {
				where.append(" AND QRY_DURATION <= :durationStart");
			}else if (searchVO.getTermTime() == 9) {
				where.append(" AND QRY_DURATION >= :durationStart");
			} else {
				durationEnd = (long) ((searchVO.getTermTime() + 1) * 60 * 60 * 1000);
				where.append(" AND QRY_DURATION BETWEEN :durationStart AND :durationEnd");
			}
		}
		if (!searchVO.getTermStatus().equals("")) {
			where.append(" AND QRY_STATUS = :qryStatus");
		}

		String order = " ORDER BY QRY_START_DT DESC LIMIT :startNum, :rows";
		query.append(where).append(order);

		Query queryObj = entityManager.createNativeQuery(query.toString(), MgmtQryHist.class);
		queryObj.setParameter("startDate", searchVO.getStartDate());
		queryObj.setParameter("endDate", searchVO.getEndDate());

		if (!searchVO.getTermStatus().equals("")) {
			queryObj.setParameter("qryStatus", searchVO.getTermStatus());
		}

		if (searchVO.getSearchType().equals("longterm")) {
			if (searchVO.getTermTime() == 0) {
				queryObj.setParameter("durationStart", durationStart);
			}else if (searchVO.getTermTime() == 9) {
				queryObj.setParameter("durationStart", durationStart);
			} else {
				queryObj.setParameter("durationStart", durationStart);
				queryObj.setParameter("durationEnd", durationEnd);
			}
		}

		queryObj.setParameter("startNum", searchVO.getStartNum());
		queryObj.setParameter("rows", searchVO.getRows());

		return queryObj.getResultList();
	}

	public Long mgmtQryHistListCount(SearchVO searchVO) {
		StringBuffer query = new StringBuffer("SELECT COUNT(*) CNT FROM (SELECT * FROM MGMT_QRY_HIST ");
		StringBuffer where = new StringBuffer(
				" WHERE FROM_UNIXTIME(QRY_START_DT/1000) BETWEEN STR_TO_DATE(:startDate,'%Y/%m/%d') and DATE_ADD(STR_TO_DATE(:endDate,'%Y/%m/%d'), INTERVAL 1 DAY)");

		Long durationStart = 0L;
		Long durationEnd = 0L;

		if (searchVO.getSearchType().equals("longterm")) {
			where.append(" AND QRY_STATUS = 'SUCCEEDED' ");
			durationStart = (long) (searchVO.getTermTime() * 60 * 60 * 1000);

			if (searchVO.getTermTime() == 0) {
				where.append(" AND QRY_DURATION <= :durationStart");
			}else if (searchVO.getTermTime() == 9) {
				where.append(" AND QRY_DURATION >= :durationStart");
			} else {
				durationEnd = (long) ((searchVO.getTermTime() + 1) * 60 * 60 * 1000);
				where.append(" AND QRY_DURATION BETWEEN :durationStart AND :durationEnd");
			}
		}

		if (!searchVO.getTermStatus().equals("")) {
			where.append(" AND QRY_STATUS = :qryStatus");
		}

		query.append(where).append(" ) CNT");

		Query queryObj = entityManager.createNativeQuery(query.toString());
		queryObj.setParameter("startDate", searchVO.getStartDate());
		queryObj.setParameter("endDate", searchVO.getEndDate());

		if (searchVO.getSearchType().equals("longterm")) {
			if (searchVO.getTermTime() == 0) {
				queryObj.setParameter("durationStart", durationStart);
			}else if (searchVO.getTermTime() == 9) {
				queryObj.setParameter("durationStart", durationStart);
			} else {
				queryObj.setParameter("durationStart", durationStart);
				queryObj.setParameter("durationEnd", durationEnd);
			}
		}

		if (!searchVO.getTermStatus().equals("")) {
			queryObj.setParameter("qryStatus", searchVO.getTermStatus());
		}

		BigInteger count = (BigInteger) queryObj.getSingleResult();

		return count.longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MgmtQryHist> mgmtPersonalQryHistList(SearchVO searchVO) {
		StringBuffer query = new StringBuffer();
		query.append(
				"SELECT DEC_QRY_ID as QRY_HIVE_ID,DEC_QRY_USER as QRY_USER,DEC_QRY_STATEMENT as QRY_STATEMENT,DATE_FORMAT(FROM_UNIXTIME(DEC_QRY_ACCESS_DT/1000),'%Y-%m-%d %H:%i:%s') AS QRY_START_DT,"
						+ "'' AS QRY_END_DT,'' as QRY_INVOKER_SYSTEM,DEC_QRY_SCH_INFO as QRY_STATUS,'' as QRY_DURATION FROM MGMT_DEC_QRY_HIST ");
		String where = "WHERE FROM_UNIXTIME(DEC_QRY_ACCESS_DT/1000) BETWEEN STR_TO_DATE(:startDate,'%Y/%m/%d') and DATE_ADD(STR_TO_DATE(:endDate,'%Y/%m/%d'), INTERVAL 1 DAY) ";
		String order = " ORDER BY DEC_QRY_ACCESS_DT DESC LIMIT :startNum, :rows";

		query.append(where).append(order);
		Query queryObj = entityManager.createNativeQuery(query.toString(), MgmtQryHist.class);

		queryObj.setParameter("startDate", searchVO.getStartDate());
		queryObj.setParameter("endDate", searchVO.getEndDate());

		queryObj.setParameter("startNum", searchVO.getStartNum());
		queryObj.setParameter("rows", searchVO.getRows());

		return queryObj.getResultList();
	}

	public Long mgmtPersonalQryHistListCount(SearchVO searchVO) {
		String query = "SELECT COUNT(*) CNT FROM (SELECT * FROM MGMT_DEC_QRY_HIST) CNT";
		BigInteger count = (BigInteger) entityManager.createNativeQuery(query).getSingleResult();
		return count.longValue();
	}

	public List<Map<String, String>> queryUsageStatistics(SearchVO searchVO) {

		String qry = "SELECT " 
				+ "QRY_USER AS userId," 
				+ "QRY_USER AS userName, "
				+ " (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(B.seleted_date,'%Y/%m/%d')) as statToday, "
				+ " (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(date_SUB(B.seleted_date, INTERVAL 1 DAY),'%Y/%m/%d'))as statMinusOne,  "
				+ " (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(date_SUB(B.seleted_date, INTERVAL 2 DAY),'%Y/%m/%d')) as statMinusTwo,   "
				+ " (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(date_SUB(B.seleted_date, INTERVAL 3 DAY),'%Y/%m/%d')) as statMinusThree  "
				+ " from( " + "   select USER_ID AS QRY_USER,  STR_TO_DATE(:endDate,'%Y/%m/%d') as seleted_date from  "
				+ "   BDAP_USER     " + " ) B " 
				+ " ORDER BY userId DESC LIMIT :startNum, :rows";
		Query jpaQuery = entityManager.createNativeQuery(qry.toString());
		org.hibernate.Query query = ((org.hibernate.jpa.HibernateQuery) jpaQuery).getHibernateQuery();
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		query.setParameter("endDate", searchVO.getEndDate());
		query.setParameter("startNum", searchVO.getStartNum());
		query.setParameter("rows", searchVO.getRows());
		@SuppressWarnings("unchecked")
		List<Map<String, String>> map = query.list();

		return map;
	}
	public List<Map<String, String>> queryUsageStatisticsAll(SearchVO searchVO) {

		String qry = "SELECT " 
				+ "QRY_USER AS userId," 
				+ "QRY_USER AS userName, "
				+ " (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(B.seleted_date,'%Y/%m/%d')) as statToday, "
				+ " (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(date_SUB(B.seleted_date, INTERVAL 1 DAY),'%Y/%m/%d'))as statMinusOne,  "
				+ " (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(date_SUB(B.seleted_date, INTERVAL 2 DAY),'%Y/%m/%d')) as statMinusTwo,   "
				+ " (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(date_SUB(B.seleted_date, INTERVAL 3 DAY),'%Y/%m/%d')) as statMinusThree  "
				+ " from( " + "   select USER_ID AS QRY_USER,  STR_TO_DATE(:endDate,'%Y/%m/%d') as seleted_date from  "
				+ "   BDAP_USER     " + " ) B " 
				+ " ORDER BY userId DESC";
		Query jpaQuery = entityManager.createNativeQuery(qry.toString());
		org.hibernate.Query query = ((org.hibernate.jpa.HibernateQuery) jpaQuery).getHibernateQuery();
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		query.setParameter("endDate", searchVO.getEndDate());
		@SuppressWarnings("unchecked")
		List<Map<String, String>> map = query.list();
		
		return map;
	}
}
