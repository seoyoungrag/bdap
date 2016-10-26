package com.kt.bdapportal.repository;

import java.util.List;
import java.util.Map;

public interface MgmtTblStatRepositoryCustom{

	public List<Map<String, String>> getDailyLoadStatic(String dbName, String searchDate);
	
}
