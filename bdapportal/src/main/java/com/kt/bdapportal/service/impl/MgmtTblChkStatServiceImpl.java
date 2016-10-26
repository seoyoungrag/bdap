package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.domain.MgmtTblChkStat;
import com.kt.bdapportal.repository.MgmtTblChkStatRepository;
import com.kt.bdapportal.service.MgmtTblChkStatService;


@Service("mgmtTblChkStatService")
public class MgmtTblChkStatServiceImpl implements MgmtTblChkStatService{

	@Autowired
	private MgmtTblChkStatRepository mgmtTblChkStatRepository;
	
	
	
	public List<MgmtTblChkStat> getMgmtTblChkStatList(String tblNm){
		
		List<MgmtTblChkStat> mgmtTblChkStatList = new ArrayList<MgmtTblChkStat>();
		
		mgmtTblChkStatList = mgmtTblChkStatRepository.mgmtTblChkStatList(tblNm);
		
		return mgmtTblChkStatList; 
		
	}
	
	
}
