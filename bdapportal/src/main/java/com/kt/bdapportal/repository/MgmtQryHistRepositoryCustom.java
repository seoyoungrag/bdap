package com.kt.bdapportal.repository;

import java.util.List;
import java.util.Map;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtQryHist;

public interface MgmtQryHistRepositoryCustom {

	List<MgmtQryHist> mgmtQryHistList(SearchVO searchVO);
	Long mgmtQryHistListCount(SearchVO searchVO);
	
	List<MgmtQryHist> mgmtPersonalQryHistList(SearchVO searchVO);
	Long mgmtPersonalQryHistListCount(SearchVO searchVO);
	
	List<Map<String,String>> queryUsageStatistics(SearchVO searchVO);
	List<Map<String,String>> queryUsageStatisticsAll(SearchVO searchVO);
	
}
