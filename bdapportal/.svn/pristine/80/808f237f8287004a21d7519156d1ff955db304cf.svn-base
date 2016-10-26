package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.MgmtQryHist;

@Repository("mgmtQryHistRepository")
public interface MgmtQryHistRepository extends JpaRepository<MgmtQryHist, String>,MgmtQryHistRepositoryCustom{

	
	@Query(value ="SELECT COUNT(*) CNT FROM (select * from MGMT_QRY_HIST where QRY_USER=?1) CNT", nativeQuery = true)
	Long countByUserIdForAccumulateQuery(String userId);
	
	
	@Query(value ="SELECT COUNT(*) CNT FROM (SELECT * FROM MGMT_QRY_HIST WHERE QRY_USER=?1 AND FROM_UNIXTIME(QRY_START_DT/1000) BETWEEN (now() - interval 8 day)  and (now() - interval 1 day)) CNT", nativeQuery = true)
	Long countByUserIdForWeekQuery(String userId);
	
	
	@Query(value ="SELECT QRY_HIVE_ID,QRY_USER,QRY_STATEMENT,QRY_STATUS,(SELECT USER_NM FROM BDAP_USER C WHERE C.USER_ID=B.QRY_USER) AS QRY_INVOKER_SYSTEM,QRY_END_DT, DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y-%m-%d %h:%i:%s') AS QRY_START_DT,QRY_USER,(SELECT COUNT(*) FROM MGMT_QRY_HIST A WHERE DATE_FORMAT(FROM_UNIXTIME(A.QRY_START_DT/1000),'%Y%m%d')=DATE_FORMAT(FROM_UNIXTIME(B.QRY_START_DT/1000),'%Y%m%d')) AS QRY_DURATION FROM MGMT_QRY_HIST B WHERE DATE_FORMAT(FROM_UNIXTIME(B.QRY_START_DT/1000),'%Y%m%d') BETWEEN  (now() - interval 3 day)  and (now() - interval 1 day) GROUP BY  DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y%m%d') ORDER BY QRY_START_DT DESC", nativeQuery = true)
	List<MgmtQryHist> queryUsageList();

	@Query(value ="SELECT QRY_HIVE_ID,QRY_USER,QRY_STATEMENT,QRY_STATUS,(SELECT USER_NM FROM BDAP_USER C WHERE C.USER_ID=B.QRY_USER) AS QRY_INVOKER_SYSTEM,QRY_END_DT, DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y-%m-%d %h:%i:%s') AS QRY_START_DT,QRY_USER,(SELECT COUNT(*) FROM MGMT_QRY_HIST A WHERE DATE_FORMAT(FROM_UNIXTIME(A.QRY_START_DT/1000),'%Y%m%d')=DATE_FORMAT(FROM_UNIXTIME(B.QRY_START_DT/1000),'%Y%m%d')) AS QRY_DURATION"
			+ " FROM MGMT_QRY_HIST B WHERE DATE_FORMAT(FROM_UNIXTIME(B.QRY_START_DT/1000),'%Y/%m/%d %h:%i:%s')  BETWEEN DATE_FORMAT(?1,'%Y/%m/%d %h:%i:%s')  and DATE_FORMAT(?2,'%Y/%m/%d %h:%i:%s')  GROUP BY  DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y%m%d') , QRY_USER ORDER BY QRY_USER, QRY_START_DT DESC", nativeQuery = true)
	List<MgmtQryHist> queryUsageListSearch(java.util.Date searchStartDate,java.util.Date searchEndDate);
	
	@Query(value ="SELECT "
			+" '' as QRY_DURATION, QRY_USER,(SELECT USER_NM FROM BDAP_USER C WHERE C.USER_ID=B.QRY_USER) as QRY_STATEMENT, '' as QRY_INVOKER_SYSTEM, "
			+" (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(B.seleted_date,'%Y/%m/%d')) as QRY_HIVE_ID, "
			+" (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(date_SUB(B.seleted_date, INTERVAL 1 DAY),'%Y/%m/%d'))as QRY_END_DT,  "
			+" (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(date_SUB(B.seleted_date, INTERVAL 2 DAY),'%Y/%m/%d')) as QRY_START_DT,   "
			+" (select count(*) from bdapportal.MGMT_QRY_HIST where QRY_USER = B.QRY_USER and DATE_FORMAT(FROM_UNIXTIME(QRY_START_DT/1000),'%Y/%m/%d') = DATE_FORMAT(date_SUB(B.seleted_date, INTERVAL 3 DAY),'%Y/%m/%d')) as QRY_STATUS  "
			+" from( "
			+"   select QRY_USER,  STR_TO_DATE(?2,'%Y/%m/%d') as seleted_date from  "
			+"   MGMT_QRY_HIST     "
			+"   WHERE FROM_UNIXTIME(QRY_START_DT/1000) BETWEEN STR_TO_DATE(?1,'%Y/%m/%d') and STR_TO_DATE(?2,'%Y/%m/%d') "
			+"   GROUP BY QRY_USER "
			+" ) B", nativeQuery = true)
	List<MgmtQryHist> queryUsageStatistics(String searchStartDate, String searchEndDate);
	
	
}
