package com.kt.bdapportal.service;

import java.util.List;
import java.util.Map;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtTblStat;

public interface MgmtTblStatService {

	public List<MgmtTblStat> getMgmtTblList();	
	public Long getManagedAreaUsage();
	public Long getDailyQureyLoadCount();
	public List<MgmtTblStat> getMgmtTblDbList();
	public List<MgmtTblStat> getMgmtTblLoadStatusList(String dbName,SearchVO searchVO);
	public List<MgmtTblStat> getMgmtTblDailyLoadStatusList(String dbName,SearchVO searchVO);
	public List<MgmtTblStat> getMgmtTblMonthAvgLoadList(String dbName,SearchVO searchVO);
	public List<Map<String,String>> getDailyMgmtTblStatList(String dbName, String searchDate);
	
	
}
