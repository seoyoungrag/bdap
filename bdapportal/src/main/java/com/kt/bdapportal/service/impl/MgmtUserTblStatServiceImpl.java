package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtUserTblStat;
import com.kt.bdapportal.repository.MgmtUserTblStatRepository;
import com.kt.bdapportal.service.MgmtUserTblStatService;

@Service("mgmtUserTblStatService")
public class MgmtUserTblStatServiceImpl implements MgmtUserTblStatService {

	@Autowired
	private MgmtUserTblStatRepository mgmtUserTblStatRepository; 
	
	public Long getManagedAreaUsage(){
		
		Long usage  = 0L;
		
		MgmtUserTblStat mgmtTbl = mgmtUserTblStatRepository.managedAreaUsage();
		
		if(mgmtTbl != null){
			usage = mgmtTbl.getTblSize();	
		}
		return usage;
	}
	
	public Long getUserAreaUsage(){
		
		Long usage  = 0L;
		
		MgmtUserTblStat mgmtTbl = mgmtUserTblStatRepository.userAreaUsage();
		if(mgmtTbl != null){
			usage = mgmtTbl.getTblSize();
		}
		
		return usage;
		
	}

	public Long getUsage(String userId){
		Long usage  = 0L;
		
		usage  = mgmtUserTblStatRepository.usage(userId);

		return usage;
	}
	
	
	public List<MgmtUserTblStat> getUserUsage(SearchVO searchVO){
		List<MgmtUserTblStat> mtmtUserTblStatList = new ArrayList<MgmtUserTblStat>();
		try{
			mtmtUserTblStatList = mgmtUserTblStatRepository.userUsageSearch(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mtmtUserTblStatList;
	}

	@Override
	public Long getUserUsageCount() {
		Long mgmtQryHistListCount = 0L;
		try{
			mgmtQryHistListCount = mgmtUserTblStatRepository.userUsageSearchCount();
		}catch(Exception e){
			e.printStackTrace();
		}
		return mgmtQryHistListCount;
	}

	@Override
	public List<MgmtUserTblStat> getUserUsageAlluser(SearchVO searchVO) {
		List<MgmtUserTblStat> mtmtUserTblStatList = new ArrayList<MgmtUserTblStat>();
		try{
			mtmtUserTblStatList = mgmtUserTblStatRepository.userUsageSearchAll(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mtmtUserTblStatList;
	}
}
