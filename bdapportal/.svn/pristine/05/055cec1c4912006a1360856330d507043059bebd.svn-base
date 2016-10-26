package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtNodeStat;
import com.kt.bdapportal.domain.MgmtUserTblStat;
import com.kt.bdapportal.repository.MgmtNodeStatRepository;
import com.kt.bdapportal.service.MgmtNodeStatService;



@Service("mgmtNodeStatService")
public class MgmtNodeStatServiceImpl implements MgmtNodeStatService{


	@Autowired
	private MgmtNodeStatRepository mgmtNodeStatRepository;
	
	
	public MgmtNodeStat getStorageNode(){
		MgmtNodeStat mgmtNodeStat = mgmtNodeStatRepository.storageUsage();
		return mgmtNodeStat;
	}
	
	public MgmtNodeStat getComputingNode(){
		MgmtNodeStat mgmtNodeStat = mgmtNodeStatRepository.computingUsage();
		return mgmtNodeStat;
	}	
	
	
	
	public List<MgmtNodeStat> computingStat(SearchVO searchVO){
		List<MgmtNodeStat> list = new ArrayList<MgmtNodeStat>(); 
		try{
			list = mgmtNodeStatRepository.computingStat(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
}
