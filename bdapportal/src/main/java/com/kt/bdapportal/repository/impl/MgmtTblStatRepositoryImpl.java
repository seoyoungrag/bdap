package com.kt.bdapportal.repository.impl;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.transform.AliasToEntityMapResultTransformer;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtTblStat;
import com.kt.bdapportal.repository.MgmtTblStatRepositoryCustom;

public class MgmtTblStatRepositoryImpl implements MgmtTblStatRepositoryCustom {
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Map<String, String>> getDailyLoadStatic(String dbName, String searchDate) {
		StringBuffer qry = new StringBuffer();
		qry.append("SELECT   C.TBL_DB_NM                   AS db_name,");
		qry.append("C.TBL_ENG_NM                  AS tbl_name,                                                                                                                                                               ");
		qry.append("MAX(C.MONTHLYAVG)             AS 'monthlyAvg',                                                                                                                                                           ");
		qry.append("MAX(C.7DAY)                   AS '7daysAgo',                                                                                                                                                             ");
		qry.append("MAX(C.1DAY)                   AS '1daysAgo',                                                                                                                                                             ");
		qry.append("MAX(C.0DAY)                   AS 'today',					");
		qry.append("IFNULL(FLOOR((MAX(C.0DAY)-MAX(C.MONTHLYAVG))/(IF(MAX(C.MONTHLYAVG)=0,MAX(C.0DAY),MAX(C.MONTHLYAVG)))*100),0) AS 'monthlyDiff',                                                                     ");                                                                                      
		qry.append("IFNULL(FLOOR((MAX(C.0DAY)-MAX(C.7DAY))/(IF(MAX(C.7DAY)=0,MAX(C.0DAY),MAX(C.7DAY)))*100),0)       AS '7daysAgoPerDiff',                                                                            ");                                                                               
		qry.append("IFNULL(FLOOR((MAX(C.0DAY)-MAX(C.1DAY))/(IF(MAX(C.1DAY)=0,MAX(C.0DAY),MAX(C.1DAY)))*100),0)       AS '1daysAgoPerDiff',                                                                           ");                                                                 
		qry.append("IFNULL(CONCAT(LEFT(MAX(C.NULL),20),'...'),'미실행')                        AS 'nullCheck',                                                                                                       ");
		qry.append("IFNULL(CONCAT(LEFT(MAX(C.TYPE),20),'...'),'미실행')                       AS 'typeCheck'                                                                                                         ");
		qry.append("FROM     (                                                                                                                                                                                       ");
		qry.append("          SELECT    A.TBL_DB_NM,                                                                                                                                                                 ");
		qry.append("                    A.TBL_ENG_NM,                                                                                                                                                                ");
		qry.append("                    0         AS 'MONTHLYAVG',                                                                                                                                                   ");
		qry.append("                    B.TBL_CNT AS '7DAY',                                                                                                                                                         ");
		qry.append("                    0         AS '1DAY',                                                                                                                                                         ");
		qry.append("                    0         AS '0DAY',                                                                                                                                                         ");
		qry.append("                    NULL      AS 'NULL',                                                                                                                                                         ");
		qry.append("                    NULL      AS 'TYPE'                                                                                                                                                          ");
		qry.append("          FROM      BDAP_TBL A                                                                                                                                                                   ");
		qry.append("          LEFT JOIN MGMT_TBL_STAT B                                                                                                                                                              ");
		qry.append("          ON        A.TBL_DB_NM=B.DB_NAME                                                                                                                                                        ");
		qry.append("          AND       A.TBL_ENG_NM=B.TBL_NAME                                                                                                                                                      ");
		qry.append("          WHERE     A.TBL_IS_MANAGED ='y' ");
		if(!dbName.equals("")){
			qry.append("          AND       A.TBL_DB_NM=:dbName ");
		}
				qry.append("          AND       B.ETL_YMD=DATE_ADD(STR_TO_DATE(:searchDate,'%Y-%m-%d'),INTERVAL -7 DAY)                                                                                ");
				qry.append("          UNION ALL                                                                                                                                                        ");
				qry.append("          SELECT    A.TBL_DB_NM,                                                                                                                                           ");
				qry.append("                    A.TBL_ENG_NM,                                                                                                                                          ");
				qry.append("                    0         AS 'MONTHLYAVG',                                                                                                                             ");
				qry.append("                    0         AS '7DAY',                                                                                                                                   ");
				qry.append("                    B.TBL_CNT AS '1DAY',                                                                                                                                   ");
				qry.append("                    0         AS '0DAY',                                                                                                                                   ");
				qry.append("                    NULL      AS 'NULL',                                                                                                                                   ");
				qry.append("                    NULL      AS 'TYPE'                                                                                                                                    ");
				qry.append("          FROM      BDAP_TBL A                                                                                                                                             ");
				qry.append("          LEFT JOIN MGMT_TBL_STAT B                                                                                                                                        ");
				qry.append("          ON        A.TBL_DB_NM=B.DB_NAME                                                                                                                                  ");
				qry.append("          AND       A.TBL_ENG_NM=B.TBL_NAME                                                                                                                                ");
				qry.append("          WHERE     A.TBL_IS_MANAGED ='y'                                                                                                                                  ");
				if(!dbName.equals("")){
					qry.append("          AND       A.TBL_DB_NM=:dbName ");
				}
				qry.append("          AND       B.ETL_YMD=DATE_ADD(STR_TO_DATE(:searchDate,'%Y-%m-%d'),INTERVAL -1 DAY)                                                                                ");
				qry.append("          UNION ALL                                                                                                                                                        ");
				qry.append("          SELECT    A.TBL_DB_NM,                                                                                                                                           ");
				qry.append("                    A.TBL_ENG_NM,                                                                                                                                          ");
				qry.append("                    0         AS 'MONTHLYAVG',                                                                                                                             ");
				qry.append("                    0         AS '7DAY',                                                                                                                                   ");
				qry.append("                    0         AS '1DAY',                                                                                                                                   ");
				qry.append("                    B.TBL_CNT AS '0DAY',                                                                                                                                   ");
				qry.append("                    NULL      AS 'NULL',                                                                                                                                   ");
				qry.append("                    NULL      AS 'TYPE'                                                                                                                                    ");
				qry.append("          FROM      BDAP_TBL A                                                                                                                                             ");
				qry.append("          LEFT JOIN MGMT_TBL_STAT B                                                                                                                                        ");
				qry.append("          ON        A.TBL_DB_NM=B.DB_NAME                                                                                                                                  ");
				qry.append("          AND       A.TBL_ENG_NM=B.TBL_NAME                                                                                                                                ");
				qry.append("          WHERE     A.TBL_IS_MANAGED ='y'                                                                                                                                  ");
				if(!dbName.equals("")){
					qry.append("          AND       A.TBL_DB_NM=:dbName ");
				}
				qry.append("          AND       B.ETL_YMD=DATE_ADD(STR_TO_DATE(:searchDate,'%Y-%m-%d'),INTERVAL -0 DAY)                                                                                ");
				qry.append("          UNION ALL                                                                                                                                                        ");
				qry.append("          SELECT    A.TBL_DB_NM,                                                                                                                                           ");
				qry.append("                    A.TBL_ENG_NM,                                                                                                                                          ");
				qry.append("                    FLOOR(AVG(B.TBL_CNT)) AS 'MONTHLYAVG',                                                                                                                 ");
				qry.append("                    0                     AS '7DAY',                                                                                                                       ");
				qry.append("                    0                     AS '1DAY',                                                                                                                       ");
				qry.append("                    0                     AS '0DAY',                                                                                                                       ");
				qry.append("                    NULL                  AS 'NULL',                                                                                                                       ");
				qry.append("                    NULL                  AS 'TYPE'                                                                                                                        ");
				qry.append("          FROM      BDAP_TBL A                                                                                                                                             ");
				qry.append("          LEFT JOIN MGMT_TBL_STAT B                                                                                                                                        ");
				qry.append("          ON        A.TBL_DB_NM=B.DB_NAME                                                                                                                                  ");
				qry.append("          AND       A.TBL_ENG_NM=B.TBL_NAME                                                                                                                                ");
				qry.append("          WHERE     A.TBL_IS_MANAGED ='y'                                                                                                                                  ");
				if(!dbName.equals("")){
					qry.append("          AND       A.TBL_DB_NM=:dbName ");
				}
				qry.append("          AND       STR_TO_DATE(B.ETL_YMD,'%Y-%m-%d') BETWEEN DATE_ADD(STR_TO_DATE(:searchDate,'%Y-%m-%d'), INTERVAL -29 DAY) AND       DATE_ADD(STR_TO_DATE(:searchDate,'%Y-%m-%d'), INTERVAL -1 DAY) ");
				qry.append("          GROUP BY  A.TBL_DB_NM,                                                                                                                                                                       ");
				qry.append("                    A.TBL_ENG_NM                                                                                                                                                                       ");
				qry.append("          UNION ALL                                                                                                                                                                                    ");
				qry.append("          SELECT    A.TBL_DB_NM,                                                                                                                                                                       ");
				qry.append("                    A.TBL_ENG_NM,                                                                                                                                                                      ");
				qry.append("                    0           AS 'MONTHLYAVG',                                                                                                                                                       ");
				qry.append("                    0           AS '7DAY',                                                                                                                                                             ");
				qry.append("                    0           AS '1DAY',                                                                                                                                                             ");
				qry.append("                    0           AS '0DAY',                                                                                                                                                             ");
				qry.append("                    BC.QRY_DESC AS 'NULL',                                                                                                                                                             ");
				qry.append("                    NULL        AS 'TYPE'                                                                                                                                                              ");
				qry.append("          FROM      BDAP_TBL A                                                                                                                                                                         ");
				qry.append("          LEFT JOIN MGMT_TBL_CHK_STAT BC                                                                                                                                                               ");
				qry.append("          ON        A.TBL_DB_NM = BC.DB_NM                                                                                                                                                             ");
				qry.append("          AND       A.TBL_ENG_NM = BC.TBL_NM                                                                                                                                                           ");
				qry.append("          WHERE     A.TBL_IS_MANAGED='y'                                                                                                                                                              ");
				if(!dbName.equals("")){
					qry.append("          AND       A.TBL_DB_NM=:dbName ");
				}
				qry.append("          AND       BC.TBL_CHK_TYPE='NLL'                                                                                                                                                              ");
				qry.append("          AND       DATE_FORMAT(BC.CHK_DT,'%Y-%m-%d') = DATE_FORMAT(:searchDate,'%Y-%m-%d')                                                                                                            ");
				qry.append("          UNION ALL                                                                                                                                                                                    ");
				qry.append("          SELECT    A.TBL_DB_NM,                                                                                                                                                                       ");
				qry.append("                    A.TBL_ENG_NM,                                                                                                                                                                      ");
				qry.append("                    0           AS 'MONTHLYAVG',                                                                                                                                                       ");
				qry.append("                    0           AS '7DAY',                                                                                                                                                             ");
				qry.append("                    0           AS '1DAY',                                                                                                                                                             ");
				qry.append("                    0           AS '0DAY',                                                                                                                                                             ");
				qry.append("                    NULL        AS 'NULL',                                                                                                                                                             ");
				qry.append("                    BC.QRY_DESC AS 'TYPE'                                                                                                                                                              ");
				qry.append("          FROM      BDAP_TBL A                                                                                                                                                                         ");
				qry.append("          LEFT JOIN MGMT_TBL_CHK_STAT BC                                                                                                                                                               ");
				qry.append("          ON        A.TBL_DB_NM = BC.DB_NM                                                                                                                                                             ");
				qry.append("          AND       A.TBL_ENG_NM = BC.TBL_NM                                                                                                                                                           ");
				qry.append("          WHERE     A.TBL_IS_MANAGED='y'                                                                                                                                                               ");
				if(!dbName.equals("")){
					qry.append("          AND       A.TBL_DB_NM=:dbName ");
				}
				qry.append("          AND       BC.TBL_CHK_TYPE='REGE'                                                                                                                                                             ");
				qry.append("          AND       DATE_FORMAT(BC.CHK_DT,'%Y-%m-%d') = DATE_FORMAT(:searchDate,'%Y-%m-%d')                                                                                                            ");
				qry.append("          UNION ALL                                                                                                                                                                                    ");
				qry.append("          SELECT A.TBL_DB_NM,                                                                                                                                                                          ");
				qry.append("                 A.TBL_ENG_NM,                                                                                                                                                                         ");
				qry.append("                 0    AS 'MONTHLYAVG',                                                                                                                                                                 ");
				qry.append("                 0    AS '7DAY',                                                                                                                                                                       ");
				qry.append("                 0    AS '1DAY',                                                                                                                                                                       ");
				qry.append("                 0    AS '0DAY',                                                                                                                                                                       ");
				qry.append("                 NULL AS 'NULL',                                                                                                                                                                       ");
				qry.append("                 NULL AS 'TYPE'                                                                                                                                                                        ");
				qry.append("          FROM   BDAP_TBL A                                                                                                                                                                            ");
				qry.append("          WHERE  A.TBL_IS_MANAGED ='y'  ");
				if(!dbName.equals("")){
					qry.append("          AND       A.TBL_DB_NM=:dbName ");
				}
				qry.append(") C                                                                                                                                                              ");
				qry.append("GROUP BY TBL_DB_NM,                                                                                                                                              ");
				qry.append("TBL_ENG_NM                                                                                                                                                       ");
		Query jpaQuery = entityManager.createNativeQuery(qry.toString());
		org.hibernate.Query query = ((org.hibernate.jpa.HibernateQuery) jpaQuery).getHibernateQuery();
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		query.setParameter("searchDate", searchDate);
		if(!dbName.equals("")){
			query.setParameter("dbName", dbName);
		}
		@SuppressWarnings("unchecked")
		List<Map<String, String>> map = query.list();

		return map;
	}

	@Override
	public List<Map<String, String>> getDashTblStatList() {

		String qry = "SELECT DASH.DASH_DB_NM AS db_name, DASH.DASH_TBL_NM AS tbl_name, DATE_FORMAT(DASH.ETL_YMD,'%Y-%m-%d') AS etl_ymd,                                                                                 "
				+ "IFNULL(a.TBL_SIZE,0) AS tbl_size,                                                                                                                              "
				+ "IFNULL(a.TBL_CNT,0) AS tbl_cnt                                                                                                                            "
				+ "FROM (                                                                                                                                                         "
				+ "	SELECT *                                                                                                                                                    "
				+ "	FROM BDAP_DASHBOARD_TBL,                                                                                                                                    "
				+ "    (                                                                                                                                                          "
				+ "	select * from                                                                                                                                               "
				+ "	(select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) ETL_YMD from                                                                         "
				+ "	 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,   "
				+ "	 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,   "
				+ "	 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,   "
				+ "	 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,   "
				+ "	 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v "
				+ "	where ETL_YMD between DATE_ADD(now() ,interval -8 day) AND DATE_ADD(now(),interval -1 day)                                                                  "
				+ "	) ETL_VIEW                                                                                                                                                  "
				+ "    ) DASH                                                                                                                                                     "
				+ "LEFT JOIN (SELECT * FROM MGMT_TBL_STAT where ETL_YMD between DATE_ADD(now() ,interval -8 day) AND DATE_ADD(now(),interval -1 day) ) a                          "
				+ "ON DASH.DASH_DB_NM=a.DB_NAME AND DASH.DASH_TBL_NM=a.TBL_NAME AND a.ETL_YMD = DASH.ETL_YMD                                                                      "
				+ "ORDER BY a.ETL_YMD, DASH_NUM";
		Query jpaQuery = entityManager.createNativeQuery(qry.toString());
		org.hibernate.Query query = ((org.hibernate.jpa.HibernateQuery) jpaQuery).getHibernateQuery();
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		@SuppressWarnings("unchecked")
		List<Map<String, String>> map = query.list();

		return map;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MgmtTblStat> mgmtTblLoadStatusList(SearchVO searchVO) {
 
		StringBuffer query = new StringBuffer("SELECT * FROM MGMT_TBL_STAT ");
		StringBuffer where = new StringBuffer(
				"WHERE 1=1");

		if(!searchVO.getStartDate().equals("") && !searchVO.getEndDate().equals("")){
			where.append(" AND DATE_FORMAT(etl_ymd,'%Y-%m-%d') between :startDate and :endDate");
		}
		if(!searchVO.getSearchWord().equals("")){
			where.append(" AND DB_NAME LIKE CONCAT('%',:dbName,'%')");
		}

		String order = " ORDER BY TBL_ID ASC, ETL_YMD DESC";
		query.append(where).append(order);

		Query queryObj = entityManager.createNativeQuery(query.toString(), MgmtTblStat.class);
		
		if(!searchVO.getStartDate().equals("") && !searchVO.getEndDate().equals("")){
			queryObj.setParameter("startDate", searchVO.getStartDate());
			queryObj.setParameter("endDate", searchVO.getEndDate());
		}
		if(!searchVO.getSearchWord().equals("")){
			queryObj.setParameter("dbName", searchVO.getSearchWord());
		}
		
		return queryObj.getResultList();
	}
}
