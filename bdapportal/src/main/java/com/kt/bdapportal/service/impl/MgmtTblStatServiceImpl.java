package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtTblStat;
import com.kt.bdapportal.repository.MgmtTblStatRepository;
import com.kt.bdapportal.service.MgmtTblStatService;

@Service("mgmtTblStatService")
public class MgmtTblStatServiceImpl implements MgmtTblStatService{

	
	@Autowired
	private MgmtTblStatRepository mgmtTblStatRepository;

	@Override
	public List<Map<String, String>> getDashTblStatList() {
		return mgmtTblStatRepository.getDashTblStatList(); 
	}
	
	@Deprecated
	public List<MgmtTblStat> getMgmtTblList(){
		
		List<MgmtTblStat> mgmtTblStatList = new ArrayList<MgmtTblStat>();
		
		mgmtTblStatList = mgmtTblStatRepository.getMgmtTblStat();
		
		return mgmtTblStatList;
	}
	
	
	@Deprecated(/*
	 * mgmt_tbl_stat에서 데이터를 가지고 오던 것을 mgmt_user_tbl_stat에서 가져옴. bdap_tbl과 조인하여 is_managed만 플래그로 구별해서 가지고옴.
	 * 추가된 메소드 - DailyUserTableService, managedAreaUsage()
	 */
)
	public Long getManagedAreaUsage(){
		
		Long usage  = 0L;
		
		MgmtTblStat mgmtTbl = mgmtTblStatRepository.managedAreaUsage();
		
		if(mgmtTbl != null){
			usage = mgmtTbl.getTblSize();	
		}
		return usage;
	}
	
	public Long getDailyQureyLoadCount(){
		
		Long count = mgmtTblStatRepository.dailyQueryLoadCount();
		
		return count;
	}

	public List<MgmtTblStat> getMgmtTblDbList(){
		
		List<MgmtTblStat> mgmtTblStatList = new ArrayList<MgmtTblStat>();
		
		mgmtTblStatList = mgmtTblStatRepository.mgmtTblDbList(); 
		
		return mgmtTblStatList;
		
	}
	
	
	public List<MgmtTblStat> getMgmtTblLoadStatusList(SearchVO searchVO){
		
		List<MgmtTblStat> mgmtTblStatList = new ArrayList<MgmtTblStat>();
		try{
			mgmtTblStatList = mgmtTblStatRepository.mgmtTblLoadStatusList(searchVO);
		}catch(Exception e){
			e.printStackTrace();
		}
			
		return mgmtTblStatList;
		
	}
	
	public List<Map<String,String>> getDailyMgmtTblStatList(String dbName, String searchDate){
		return mgmtTblStatRepository.getDailyLoadStatic(dbName,searchDate); 
	}
	
	@Deprecated
	public List<MgmtTblStat> getMgmtTblDailyLoadStatusList(String dbName,SearchVO searchVO){
		List<MgmtTblStat> mgmtTblStatList = new ArrayList<MgmtTblStat>();

		try{
			
			if(searchVO.getStartDate().equals("")){
				mgmtTblStatList = mgmtTblStatRepository.mgmtTblDailyLoadStatusList(dbName);
			}else{
				String startDate = searchVO.getStartDate()+" 00:00:00";
				startDate = startDate.replaceAll("\\/", "-");	
				java.util.Date searchStartDate = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate);
				mgmtTblStatList = mgmtTblStatRepository.mgmtTblDailyLoadStatusListSearch(dbName,searchStartDate);
				
			}	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mgmtTblStatList;
		
	}
	@Deprecated
	public List<MgmtTblStat> getMgmtTblMonthAvgLoadList(String dbName,SearchVO searchVO){
		
		List<MgmtTblStat> mgmtTblStatList = new ArrayList<MgmtTblStat>();

		try{
			
			if(searchVO.getStartDate().equals("")){
				mgmtTblStatList = mgmtTblStatRepository.mgmtTblMonthAvgStatusList(dbName);
			}else{
				String startDate = searchVO.getStartDate()+" 00:00:00";
				startDate = startDate.replaceAll("\\/", "-");	
				java.util.Date searchStartDate = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate);
				mgmtTblStatList = mgmtTblStatRepository.mgmtTblMonthAvgStatusListSearch(dbName,searchStartDate);
			}	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mgmtTblStatList;
		
	}
	
}
