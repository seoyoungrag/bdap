package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.MgmtTblStat;

@Repository("mgmtTblStatRepository")
public interface MgmtTblStatRepository extends JpaRepository<MgmtTblStat, String>,MgmtTblStatRepositoryCustom{
	
	@Deprecated
	@Query(value=
			"SELECT DASH.DASH_DB_NM AS DB_NAME, DASH.DASH_TBL_NM AS TBL_NAME, DASH.ETL_YMD,                                                                                 "
					+"IFNULL(A.TBL_STAT_ID,'') AS TBL_STAT_ID,                                                                                                                       "
					+"IFNULL(A.TBL_SIZE,0) AS TBL_SIZE,                                                                                                                              "
					+"IFNULL(A.TBL_CNT,0) AS TBL_CNT,                                                                                                                                "
					+"IFNULL(A.INSERT_DT,TIMESTAMP(NOW())) AS INSERT_DT,                                                                                                                           "
					+"IFNULL(A.DB_ID,'') AS DB_ID,                                                                                                                                   "
					+"IFNULL(A.TBL_ID,'') AS TBL_ID,                                                                                                                                 "
					+"IFNULL(A.TBL_TYPE,'') AS TBL_TYPE,                                                                                                                             "
					+"IFNULL(A.PART_NAME,'') AS PART_NAME,                                                                                                                           "
					+"IFNULL(A.SD_ID,'') AS SD_ID,                                                                                                                                   "
					+"IFNULL(A.PARAM_KEY,'') AS PARAM_KEY,                                                                                                                           "
					+"IFNULL(A.DAY_OF_WEEK,'') AS DAY_OF_WEEK                                                                                                                        "
					+"FROM (                                                                                                                                                         "
					+"	SELECT *                                                                                                                                                    "
					+"	FROM BDAP_DASHBOARD_TBL,                                                                                                                                    "
					+"    (                                                                                                                                                          "
					+"	select * from                                                                                                                                               "
					+"	(select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) ETL_YMD from                                                                         "
					+"	 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,   "
					+"	 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,   "
					+"	 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,   "
					+"	 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,   "
					+"	 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v "
					+"	where ETL_YMD between DATE_ADD(now() ,interval -7 day) AND DATE_ADD(now(),interval -1 day)                                                                  "
					+"	) ETL_VIEW                                                                                                                                                  "
					+"    ) DASH                                                                                                                                                     "
					+"LEFT JOIN (SELECT * FROM MGMT_TBL_STAT where ETL_YMD between DATE_ADD(now() ,interval -7 day) AND DATE_ADD(now(),interval -1 day) ) a                          "
					+"ON DASH.DASH_DB_NM=a.DB_NAME AND DASH.DASH_TBL_NM=a.TBL_NAME AND a.ETL_YMD = DASH.ETL_YMD                                                                      "
					+"ORDER BY A.ETL_YMD, DASH_NUM"
			, nativeQuery = true)
	public List<MgmtTblStat> getMgmtTblStat();
	
	@Deprecated
	@Query(value="SELECT "
			+ " '' as TBL_STAT_ID, '' as TBL_STAT_ID, '' as TBL_CNT, now() as ETL_YMD, '' as DB_NAME, '' as DB_ID, "
			+ " '' as TBL_NAME, '' as TBL_ID, '' as TBL_TYPE, '' as PART_NAME, '' as SD_ID, '' as PARAM_KEY, "
			+ " '' as DAY_OF_WEEK, CURRENT_TIMESTAMP as INSERT_DT, ifnull(sum(B.tbl_size),0) as TBL_SIZE "
			+ " FROM BDAP_TBL A, ( "
			+ " select innerone.db_name as db_name, innerone.tbl_name as tbl_name, innerone.tbl_size as tbl_size "
			+ " from MGMT_TBL_STAT innerone, (select "
			+ " max(etl_ymd) as etl_ymd,db_name,tbl_name  "
			+ " from MGMT_TBL_STAT "
			+ " group by db_name, tbl_name) innertwo "
			+ " where innerone.etl_ymd = innertwo.etl_ymd and innerone.db_name =innertwo.db_name and innerone.tbl_name = innertwo.tbl_name "
			+ " ) B  "
			+ " WHERE A.tbl_db_nm = B.db_name and A.TBL_ENG_NM=B.TBL_NAME  "
			+ " AND A.TBL_IS_MANAGED='Y' ", nativeQuery = true)
	public MgmtTblStat managedAreaUsage(); 

	@Query(value="SELECT SUM(TBL_CNT) FROM MGMT_TBL_STAT", nativeQuery = true)
	public Long dailyQueryLoadCount();
		
	
	
	@Query(value="SELECT * FROM MGMT_TBL_STAT GROUP BY DB_NAME ORDER BY DB_NAME ASC", nativeQuery = true)
	public List<MgmtTblStat> mgmtTblDbList();
	
	@Query(value="SELECT TBL_STAT_ID,TBL_SIZE,GROUP_CONCAT(TBL_SIZE SEPARATOR ',') AS PARAM_KEY, TBL_CNT,max(str_to_date(ETL_YMD,'%Y-%m-%d')) AS ETL_YMD,INSERT_DT,DB_NAME,DB_ID,TBL_NAME,TBL_ID,TBL_TYPE,PART_NAME,SD_ID,DAY_OF_WEEK "
			+ "FROM MGMT_TBL_STAT "
			+ "where DB_NAME=?1  AND DATE_FORMAT(ETL_YMD,'%Y-%m-%d')=DATE_FORMAT(now(),'%Y-%m-%d') "
			+ "OR DB_NAME=?1  AND DATE_FORMAT(ETL_YMD,'%Y-%m-%d')=DATE_FORMAT(DATE_ADD(now(),interval -1 day),'%Y-%m-%d') "
			+ "OR DB_NAME=?1  AND DATE_FORMAT(ETL_YMD,'%Y-%m-%d')=DATE_FORMAT(DATE_ADD(now(),interval -7 day),'%Y-%m-%d') GROUP BY DB_NAME, TBL_NAME ORDER BY TBL_ID, ETL_YMD DESC", nativeQuery = true)
	public List<MgmtTblStat> mgmtTblDailyLoadStatusList(String dbName);
	
	@Query(value="SELECT TBL_STAT_ID,TBL_SIZE,GROUP_CONCAT(TBL_SIZE SEPARATOR ',') AS PARAM_KEY, TBL_CNT,max(str_to_date(ETL_YMD,'%Y-%m-%d')) AS ETL_YMD,INSERT_DT,DB_NAME,DB_ID,TBL_NAME,TBL_ID,TBL_TYPE,PART_NAME,SD_ID,DAY_OF_WEEK "
			+ "FROM MGMT_TBL_STAT "
			+ "where DB_NAME=?1  AND DATE_FORMAT(ETL_YMD,'%Y-%m-%d')=str_to_date(?2,'%Y-%m-%d') "
			+ "OR DB_NAME=?1  AND DATE_FORMAT(ETL_YMD,'%Y-%m-%d')=DATE_ADD(str_to_date(?2,'%Y-%m-%d'),interval -1 day) "
			+ "OR DB_NAME=?1  AND DATE_FORMAT(ETL_YMD,'%Y-%m-%d')=DATE_ADD(str_to_date(?2,'%Y-%m-%d'),interval -7 day) GROUP BY DB_NAME, TBL_NAME ORDER BY TBL_ID, ETL_YMD DESC", nativeQuery = true)
	public List<MgmtTblStat> mgmtTblDailyLoadStatusListSearch(String dbName,java.util.Date searchStartDate);
	
	
	@Query(value="SELECT SUM(A.TBL_SIZE) AS TBL_SIZE, A.TBL_STAT_ID , A.TBL_CNT,max(str_to_date(A.ETL_YMD,'%Y-%m-%d'))  AS ETL_YMD,A.INSERT_DT,A.DB_NAME,A.DB_ID,A.TBL_NAME,A.TBL_ID,A.TBL_TYPE,A.PART_NAME,A.SD_ID,A.PARAM_KEY,A.DAY_OF_WEEK	"
			+ "FROM MGMT_TBL_STAT A,MGMT_TBL_STAT B	"
			+ "WHERE A.DB_NAME=?1	AND A.TBL_ID = B.TBL_ID	AND A.ETL_YMD BETWEEN DATE_ADD(now(),interval -30 day) and now() GROUP BY A.DB_NAME, A.TBL_NAME", nativeQuery = true)
	public List<MgmtTblStat> mgmtTblMonthAvgStatusList(String dbName);
	
	
	@Query(value="SELECT SUM(A.TBL_SIZE) AS TBL_SIZE, A.TBL_STAT_ID , A.TBL_CNT,max(str_to_date(A.ETL_YMD,'%Y-%m-%d')) AS ETL_YMD,A.INSERT_DT,A.DB_NAME,A.DB_ID,A.TBL_NAME,A.TBL_ID,A.TBL_TYPE,A.PART_NAME,A.SD_ID,A.PARAM_KEY,A.DAY_OF_WEEK	"
			+ "FROM MGMT_TBL_STAT A,MGMT_TBL_STAT B	"
			+ "WHERE A.DB_NAME=?1	AND A.TBL_ID = B.TBL_ID	AND A.ETL_YMD BETWEEN DATE_ADD(?2,interval -30 day) and str_to_date(?2,'%Y-%m-%d') GROUP BY A.DB_NAME, A.TBL_NAME", nativeQuery = true)
	public List<MgmtTblStat> mgmtTblMonthAvgStatusListSearch(String dbName,java.util.Date searchStartDate);
	
}
