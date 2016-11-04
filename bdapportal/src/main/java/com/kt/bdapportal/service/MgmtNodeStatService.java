package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtNodeStat;

public interface MgmtNodeStatService {
	public MgmtNodeStat getStorageNode();
	public MgmtNodeStat getComputingNode();
	public List<MgmtNodeStat> computingStat(SearchVO searchVO);
	public Long computingStatCount(SearchVO searchVO);
	public List<MgmtNodeStat> computingStatAllUser(SearchVO searchVO);
}
