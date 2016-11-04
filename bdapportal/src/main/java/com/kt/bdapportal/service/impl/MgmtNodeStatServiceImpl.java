package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtNodeStat;
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
	
	@Deprecated(/*
	 * computing 수치 가져오는 항목이 변경됨에 따라 테이블을 새로 생성하였음.
	 */
)	
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

	@Override
	public Long computingStatCount(SearchVO searchVO) {
		Long mgmtQryHistListCount = 0L;
		try{
			mgmtQryHistListCount = mgmtNodeStatRepository.computingStatCount(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mgmtQryHistListCount;
	}

	@Override
	public List<MgmtNodeStat> computingStatAllUser(SearchVO searchVO) {
		List<MgmtNodeStat> list = new ArrayList<MgmtNodeStat>(); 
		try{
			list = mgmtNodeStatRepository.computingStatAllUser(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
}
