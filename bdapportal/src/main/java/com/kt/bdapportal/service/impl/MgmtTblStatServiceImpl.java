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
	
	
	public List<MgmtTblStat> getMgmtTblList(){
		
		List<MgmtTblStat> mgmtTblStatList = new ArrayList<MgmtTblStat>();
		
		mgmtTblStatList = mgmtTblStatRepository.getMgmtTblStat();
		
		return mgmtTblStatList;
	}
	
	
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
	
	
	public List<MgmtTblStat> getMgmtTblLoadStatusList(String dbName,SearchVO searchVO){
		
		List<MgmtTblStat> mgmtTblStatList = new ArrayList<MgmtTblStat>();
		try{
			if(searchVO.getStartDate().equals("")){
				mgmtTblStatList = mgmtTblStatRepository.mgmtTblLoadStatusList(dbName);	
			}else{
				String startDate = searchVO.getStartDate()+" 00:00:00";
				String endDate = searchVO.getEndDate()+" 23:59:59";
				startDate = startDate.replaceAll("\\/", "-");	
				endDate = endDate.replaceAll("\\/", "-");	
				java.util.Date searchStartDate = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate);
				java.util.Date searchEndDate = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate);
				mgmtTblStatList = mgmtTblStatRepository.mgmtTblLoadStatusListSearch(dbName,searchStartDate,searchEndDate);
			}
			
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
