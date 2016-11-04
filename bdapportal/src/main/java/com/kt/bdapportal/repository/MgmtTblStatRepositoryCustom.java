package com.kt.bdapportal.repository;

import java.util.List;
import java.util.Map;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtTblStat;

public interface MgmtTblStatRepositoryCustom{

	public List<Map<String, String>> getDailyLoadStatic(String dbName, String searchDate);
	public List<Map<String, String>> getDashTblStatList();
	List<MgmtTblStat> mgmtTblLoadStatusList(SearchVO searchVO);
}
