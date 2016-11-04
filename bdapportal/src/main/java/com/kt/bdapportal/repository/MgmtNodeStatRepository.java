package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtNodeStat;

@Repository("mgmtNodeStatRepository")
public interface MgmtNodeStatRepository extends JpaRepository<MgmtNodeStat, String>{

			
	@Query(value="SELECT NODE_STAT_ID,DATE_FORMAT(NODE_STAT_CREATE_DT,'%Y/%m/%d %H:%i:%s') as NODE_STAT_CREATE_DT,NODE_STAT_TYPE,NODE_STAT_AVAIL_VAL,NODE_NM,NODE_STAT_TOTAL_VAL  FROM MGMT_NODE_STAT WHERE NODE_STAT_TYPE = 'STO' ORDER BY NODE_STAT_CREATE_DT DESC LIMIT 0,1", nativeQuery = true)
	public MgmtNodeStat storageUsage();
	
	@Query(value="SELECT NODE_STAT_ID,DATE_FORMAT(NODE_STAT_CREATE_DT,'%Y/%m/%d %H:%i:%s') as NODE_STAT_CREATE_DT,NODE_STAT_TYPE,NODE_STAT_AVAIL_VAL,NODE_NM,NODE_STAT_TOTAL_VAL  FROM MGMT_NODE_STAT WHERE NODE_STAT_TYPE = 'COM' ORDER BY NODE_STAT_CREATE_DT DESC LIMIT 0,1", nativeQuery = true)
	public MgmtNodeStat computingUsage();
	
	@Query(value="SELECT NODE_STAT_ID,DATE_FORMAT(NODE_STAT_CREATE_DT,'%Y/%m/%d %H:%i:%s') as NODE_STAT_CREATE_DT,NODE_STAT_TYPE,NODE_STAT_AVAIL_VAL,NODE_NM,NODE_STAT_TOTAL_VAL  FROM MGMT_NODE_STAT WHERE NODE_STAT_TYPE = 'COM' AND DATE_FORMAT(NODE_STAT_CREATE_DT,'%Y/%m/%d') = :#{#searchVO.endDate} ORDER BY NODE_STAT_CREATE_DT DESC LIMIT :#{#searchVO.startNum}, :#{#searchVO.rows}", nativeQuery = true)
	public List<MgmtNodeStat> computingStat(@Param("searchVO") SearchVO searchVO);
	
	@Query(value="SELECT count(*)  FROM MGMT_NODE_STAT WHERE NODE_STAT_TYPE = 'COM' AND DATE_FORMAT(NODE_STAT_CREATE_DT,'%Y/%m/%d') = :#{#searchVO.endDate}", nativeQuery = true)
	public Long computingStatCount(@Param("searchVO") SearchVO searchVO);
	
	@Query(value="SELECT NODE_STAT_ID,DATE_FORMAT(NODE_STAT_CREATE_DT,'%Y/%m/%d %H:%i:%s') as NODE_STAT_CREATE_DT,NODE_STAT_TYPE,NODE_STAT_AVAIL_VAL,NODE_NM,NODE_STAT_TOTAL_VAL  FROM MGMT_NODE_STAT WHERE NODE_STAT_TYPE = 'COM' AND DATE_FORMAT(NODE_STAT_CREATE_DT,'%Y/%m/%d') = :#{#searchVO.endDate} ORDER BY NODE_STAT_CREATE_DT DESC", nativeQuery = true)
	public List<MgmtNodeStat> computingStatAllUser(@Param("searchVO") SearchVO searchVO);
}
