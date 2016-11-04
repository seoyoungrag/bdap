package com.kt.bdapportal.service;

import java.util.List;
import java.util.Map;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtQryHist;

public interface MgmtQryHistService {

	public List<MgmtQryHist> getMgmtQryHistList(SearchVO searchVO);
	public Long getMgmtQryHistListCount(SearchVO searchVO);
	
	public List<MgmtQryHist> getMgmtPersonalQryHistList(SearchVO searchVO);
	public Long getMgmtPersonalQryHistListCount(SearchVO searchVO);
	
	public Long getAccumulateQueryCount(String userId);
	public Long getWeekQueryCount(String userId);
	
	public List<Map<String, String>> getQueryUsageList(SearchVO searchVO);
	public Long getAccumulateQueryCountAll();
	public Long getWeekQueryCountAll();
	public Long getQueryUsageListCount();
	public List<Map<String, String>> getQueryUsageListAll(SearchVO searchVO);
}
