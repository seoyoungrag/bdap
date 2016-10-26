package com.kt.bdapportal.repository.impl;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.transform.AliasToEntityMapResultTransformer;

import com.kt.bdapportal.repository.MgmtTblStatRepositoryCustom;

public class MgmtTblStatRepositoryImpl implements MgmtTblStatRepositoryCustom {
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Map<String,String>> getDailyLoadStatic(String dbName, String searchDate) {
		
		String qry = 
				"SELECT   c.tbl_db_nm                   AS db_name,                                                                                                                                                       "
				+"c.tbl_eng_nm                  AS tbl_name,                                                                                                                                                               "
				+"Max(c.monthlyavg)             AS 'monthlyAvg',                                                                                                                                                           "
				+"Max(c.7day)                   AS '7daysAgo',                                                                                                                                                             "
				+"Max(c.1day)                   AS '1daysAgo',                                                                                                                                                             "
				+"Max(c.0day)                   AS 'today',                                                                                                                                                                "
				+"ifnull(floor((Max(c.0day)-Max(c.monthlyavg))/c.monthlyavg)*100,0) AS 'monthlyDiff',                                                                                                                                                          "
				+"ifnull(floor((Max(c.0day)-Max(c.7day))/c.7day)*100,0)       AS '7daysAgoPerDiff',                                                                                                                                                          "
				+"ifnull(floor((Max(c.0day)-Max(c.1day))/c.1day)*100,0)       AS '1daysAgoPerDiff',                                                                                                                                                          "
				+"ifnull(c.null,'')                        AS 'nullCheck',                                                                                                                                                            "
				+"ifnull(c.type,'')                       AS 'typeCheck'                                                                                                                                                             "
				+"FROM     (                                                                                                                                                                                               "
				+"          SELECT    a.tbl_db_nm,                                                                                                                                                                         "
				+"                    a.tbl_eng_nm,                                                                                                                                                                        "
				+"                    0         AS 'monthlyAvg',                                                                                                                                                           "
				+"                    b.tbl_cnt AS '7day',                                                                                                                                                                 "
				+"                    0         AS '1day',                                                                                                                                                                 "
				+"                    0         AS '0day',                                                                                                                                                                 "
				+"                    NULL      AS 'null',                                                                                                                                                                 "
				+"                    NULL      AS 'type'                                                                                                                                                                  "
				+"          FROM      bdap_tbl a                                                                                                                                                                           "
				+"          LEFT JOIN mgmt_tbl_stat b                                                                                                                                                                      "
				+"          ON        a.tbl_db_nm=b.db_name                                                                                                                                                                "
				+"          AND       a.tbl_eng_nm=b.tbl_name                                                                                                                                                              "
				+"          WHERE     a.tbl_is_managed ='y'                              "
				+"			 AND       a.tbl_db_nm=:dbName                                                                                                                                 "
				+"          AND       b.etl_ymd=date_add(Str_to_date(:searchDate,'%Y-%m-%d'),interval -7 day)                                                                                                             "
				+"          UNION ALL                                                                                                                                                                                      "
				+"          SELECT    a.tbl_db_nm,                                                                                                                                                                         "
				+"                    a.tbl_eng_nm,                                                                                                                                                                        "
				+"                    0         AS 'monthlyAvg',                                                                                                                                                           "
				+"                    0         AS '7day',                                                                                                                                                                 "
				+"                    b.tbl_cnt AS '1day',                                                                                                                                                                 "
				+"                    0         AS '0day',                                                                                                                                                                 "
				+"                    NULL      AS 'null',                                                                                                                                                                 "
				+"                    NULL      AS 'type'                                                                                                                                                                  "
				+"          FROM      bdap_tbl a                                                                                                                                                                           "
				+"          LEFT JOIN mgmt_tbl_stat b                                                                                                                                                                      "
				+"          ON        a.tbl_db_nm=b.db_name                                                                                                                                                                "
				+"          AND       a.tbl_eng_nm=b.tbl_name                                                                                                                                                              "
				+"          WHERE     a.tbl_is_managed ='y'                                                                                                                                                                "
				+"			 AND       a.tbl_db_nm=:dbName                                                                                                                                 "
				+"          AND       b.etl_ymd=date_add(str_to_date(:searchDate,'%Y-%m-%d'),interval -1 day)                                                                                                             "
				+"          UNION ALL                                                                                                                                                                                      "
				+"          SELECT    a.tbl_db_nm,                                                                                                                                                                         "
				+"                    a.tbl_eng_nm,                                                                                                                                                                        "
				+"                    0         AS 'monthlyAvg',                                                                                                                                                           "
				+"                    0         AS '7day',                                                                                                                                                                 "
				+"                    0         AS '1day',                                                                                                                                                                 "
				+"                    b.tbl_cnt AS '0day',                                                                                                                                                                 "
				+"                    NULL      AS 'null',                                                                                                                                                                 "
				+"                    NULL      AS 'type'                                                                                                                                                                  "
				+"          FROM      bdap_tbl a                                                                                                                                                                           "
				+"          LEFT JOIN mgmt_tbl_stat b                                                                                                                                                                      "
				+"          ON        a.tbl_db_nm=b.db_name                                                                                                                                                                "
				+"          AND       a.tbl_eng_nm=b.tbl_name                                                                                                                                                              "
				+"          WHERE     a.tbl_is_managed ='y'                                                                                                                                 "
				+"			 AND       a.tbl_db_nm=:dbName                                                                                                                                 "
				+"          AND       b.etl_ymd=date_add(str_to_date(:searchDate,'%Y-%m-%d'),interval -0 day)                                                                                                             "
				+"          UNION ALL                                                                                                                                                                                      "
				+"          SELECT    a.tbl_db_nm,                                                                                                                                                                         "
				+"                    a.tbl_eng_nm,                                                                                                                                                                        "
				+"                    floor(avg(b.tbl_cnt)) AS 'monthlyAvg',                                                                                                                                               "
				+"                    0                     AS '7day',                                                                                                                                                     "
				+"                    0                     AS '1day',                                                                                                                                                     "
				+"                    0                     AS '0day',                                                                                                                                                     "
				+"                    NULL                  AS 'null',                                                                                                                                                     "
				+"                    NULL                  AS 'type'                                                                                                                                                      "
				+"          FROM      bdap_tbl a                                                                                                                                                                           "
				+"          LEFT JOIN mgmt_tbl_stat b                                                                                                                                                                      "
				+"          ON        a.tbl_db_nm=b.db_name                                                                                                                                                                "
				+"          AND       a.tbl_eng_nm=b.tbl_name                                                                                                                                                              "
				+"          WHERE     a.tbl_is_managed ='y'                                                                                                                                                                "
				+"			 AND       a.tbl_db_nm=:dbName                                                                                                                                 "
				+"          AND       str_to_date(b.etl_ymd,'%Y-%m-%d') BETWEEN date_add(str_to_date(:searchDate,'%Y-%m-%d'), interval -29 day) AND       date_add(str_to_date(:searchDate,'%Y-%m-%d'), interval -1 day) "
				+"          GROUP BY  a.tbl_db_nm,                                                                                                                                                                         "
				+"                    a.tbl_eng_nm                                                                                                                                                                         "
				+"          UNION ALL                                                                                                                                                                                      "
				+"          SELECT    a.tbl_db_nm,                                                                                                                                                                         "
				+"                    a.tbl_eng_nm,                                                                                                                                                                        "
				+"                    0           AS 'monthlyAvg',                                                                                                                                                         "
				+"                    0           AS '7day',                                                                                                                                                               "
				+"                    0           AS '1day',                                                                                                                                                               "
				+"                    0           AS '0day',                                                                                                                                                               "
				+"                    bc.qry_desc AS 'null',                                                                                                                                                               "
				+"                    NULL        AS 'type'                                                                                                                                                                "
				+"          FROM      bdap_tbl a                                                                                                                                                                           "
				+"          LEFT JOIN mgmt_tbl_chk_stat bc                                                                                                                                                                 "
				+"          ON        a.tbl_db_nm = bc.db_nm                                                                                                                                                               "
				+"          AND       a.tbl_eng_nm = bc.tbl_nm                                                                                                                                                             "
				+"          WHERE     a.tbl_is_managed='Y'                                                                                                                                  "
				+"			 AND       a.tbl_db_nm=:dbName                                                                                                                                 "
				+"          AND       bc.tbl_chk_type='NLL'                                                                                                                                                                "
				+"          AND       date_format(bc.chk_dt,'%Y-%m-%d') = date_format(:searchDate,'%Y-%m-%d')                                                                                                             "
				+"          UNION ALL                                                                                                                                                                                      "
				+"          SELECT    a.tbl_db_nm,                                                                                                                                                                         "
				+"                    a.tbl_eng_nm,                                                                                                                                                                        "
				+"                    0           AS 'monthlyAvg',                                                                                                                                                         "
				+"                    0           AS '7day',                                                                                                                                                               "
				+"                    0           AS '1day',                                                                                                                                                               "
				+"                    0           AS '0day',                                                                                                                                                               "
				+"                    NULL        AS 'null',                                                                                                                                                               "
				+"                    bc.qry_desc AS 'type'                                                                                                                                                                "
				+"          FROM      bdap_tbl a                                                                                                                                                                           "
				+"          LEFT JOIN mgmt_tbl_chk_stat bc                                                                                                                                                                 "
				+"          ON        a.tbl_db_nm = bc.db_nm                                                                                                                                                               "
				+"          AND       a.tbl_eng_nm = bc.tbl_nm                                                                                                                                                             "
				+"          WHERE     a.tbl_is_managed='Y'                                                                                                                                                                 "
				+"			 AND       a.tbl_db_nm=:dbName                                                                                                                                 "
				+"          AND       bc.tbl_chk_type='REGE'                                                                                                                                                               "
				+"          AND       date_format(bc.chk_dt,'%Y-%m-%d') = date_format(:searchDate,'%Y-%m-%d')                                                                                                             "
				+"          UNION ALL                                                                                                                                                                                      "
				+"          SELECT a.tbl_db_nm,                                                                                                                                                                            "
				+"                 a.tbl_eng_nm,                                                                                                                                                                           "
				+"                 0    AS 'monthlyAvg',                                                                                                                                                                   "
				+"                 0    AS '7day',                                                                                                                                                                         "
				+"                 0    AS '1day',                                                                                                                                                                         "
				+"                 0    AS '0day',                                                                                                                                                                         "
				+"                 NULL AS 'null',                                                                                                                                                                         "
				+"                 NULL AS 'type'                                                                                                                                                                          "
				+"          FROM   bdap_tbl a                                                                                                                                                                              "
				+"          WHERE  a.tbl_is_managed ='y' "
				+"			 AND       a.tbl_db_nm=:dbName                                                                                                                                 "
				+ ") c                                                                                                                                                               "
				+"GROUP BY tbl_db_nm,                                                                                                                                                                                      "
				+"tbl_eng_nm                                                                                                                                                                                         ";
		Query jpaQuery = entityManager.createNativeQuery(qry.toString());
		org.hibernate.Query query = ((org.hibernate.jpa.HibernateQuery)jpaQuery).getHibernateQuery();
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		query.setParameter("searchDate", searchDate);
		query.setParameter("dbName", dbName);
		List<Map<String,String>> map = query.list();
		
		return map;
	}

}

