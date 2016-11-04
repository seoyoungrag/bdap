package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtQryHist;
import com.kt.bdapportal.repository.MgmtQryHistRepository;
import com.kt.bdapportal.service.MgmtQryHistService;

@Service("mgmtQryHistService")
public class MgmtQryHistServiceImpl implements MgmtQryHistService{

	@Autowired
	private MgmtQryHistRepository mgmtQryHistRepository;
	
	public List<MgmtQryHist> getMgmtQryHistList(SearchVO searchVO){
		List<MgmtQryHist> mgmtQryHistList = new ArrayList<MgmtQryHist>();
		try{
			mgmtQryHistList = mgmtQryHistRepository.mgmtQryHistList(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mgmtQryHistList;
	}
	
	public Long getMgmtQryHistListCount(SearchVO searchVO){
		Long mgmtQryHistListCount = 0L;
		try{
			mgmtQryHistListCount = mgmtQryHistRepository.mgmtQryHistListCount(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mgmtQryHistListCount;
	}
	
	public List<MgmtQryHist> getMgmtPersonalQryHistList(SearchVO searchVO){
		List<MgmtQryHist> mgmtQryHistList = new ArrayList<MgmtQryHist>();
		try{
			mgmtQryHistList = mgmtQryHistRepository.mgmtPersonalQryHistList(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mgmtQryHistList;
	}
	
	public Long getMgmtPersonalQryHistListCount(SearchVO searchVO){
		Long mgmtQryHistListCount = 0L;
		try{
			mgmtQryHistListCount = mgmtQryHistRepository.mgmtPersonalQryHistListCount(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mgmtQryHistListCount;
	}
	
	public Long getAccumulateQueryCount(String userId){
		Long count = mgmtQryHistRepository.countByUserIdForAccumulateQuery(userId);
		return count;
	}
	
	public Long getWeekQueryCount(String userId){
		Long count = mgmtQryHistRepository.countByUserIdForWeekQuery(userId);
		return count;
	}
	
	public List<Map<String,String>> getQueryUsageList(SearchVO searchVO){
		List<Map<String,String>> queryUsageStat = new ArrayList<Map<String,String>>();
		try{
			// 날짜가 지정되지 않는 경우는 없다. 반드시 시작일은 존재한다.
			//String startDate = searchVO.getStartDate();
			//String endDate = searchVO.getEndDate();
			queryUsageStat = mgmtQryHistRepository.queryUsageStatistics(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return queryUsageStat;
	}

	@Override
	public Long getAccumulateQueryCountAll() {
		Long count = mgmtQryHistRepository.countAccumulateQuery();
		return count;
	}

	@Override
	public Long getWeekQueryCountAll() {
		Long count = mgmtQryHistRepository.countWeekQuery();
		return count;
	}

	@Override
	public Long getQueryUsageListCount() {
		Long mgmtQryHistListCount = 0L;
		try{
			mgmtQryHistListCount = mgmtQryHistRepository.queryUsageStatisticsCount();
		}catch(Exception e){
			e.printStackTrace();
		}
		return mgmtQryHistListCount;
	}

	@Override
	public List<Map<String, String>> getQueryUsageListAll(SearchVO searchVO) {
		List<Map<String,String>> queryUsageStat = new ArrayList<Map<String,String>>();
		try{
			// 날짜가 지정되지 않는 경우는 없다. 반드시 시작일은 존재한다.
			//String startDate = searchVO.getStartDate();
			//String endDate = searchVO.getEndDate();
			queryUsageStat = mgmtQryHistRepository.queryUsageStatisticsAll(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return queryUsageStat;
	}
}
