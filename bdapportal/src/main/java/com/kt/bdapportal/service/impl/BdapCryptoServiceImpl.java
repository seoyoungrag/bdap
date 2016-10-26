package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.domain.BdapCrypto;
import com.kt.bdapportal.repository.BdapCryptoRepository;
import com.kt.bdapportal.service.BdapCryptoService;


@Service("bdapCryptoService")
public class BdapCryptoServiceImpl implements BdapCryptoService{

	@Autowired
	private BdapCryptoRepository bdapCryptoRepository;
	
	public List<BdapCrypto> getUserDecTblAndCol(String userId,char crtType,String crtStatus){
		
		List<BdapCrypto> bdapCrypto = new ArrayList<BdapCrypto>();
		
		bdapCrypto = bdapCryptoRepository.userDecTblAndCol(userId, crtType, crtStatus);
		
		return bdapCrypto;
	}
	
	public List<BdapCrypto> getTableManagementList(String userId,String dbNm){
		
		List<BdapCrypto> bdapCrypto = new ArrayList<BdapCrypto>();
		
		bdapCrypto = bdapCryptoRepository.tableManagementList(userId,dbNm);
		
		return bdapCrypto;
	}
	
	public List<BdapCrypto> getEncDecList(String userId,char crtType,int startNum,int rows){
		
		List<BdapCrypto> bdapCrypto = new ArrayList<BdapCrypto>();
		
		bdapCrypto = bdapCryptoRepository.encDecList(userId, crtType,startNum,rows);
		
		return bdapCrypto;
	}
	
	public List<BdapCrypto> getEncProcessList(char crtType,int startNum,int rows){
		
		List<BdapCrypto> bdapCrypto = new ArrayList<BdapCrypto>();
		
		bdapCrypto = bdapCryptoRepository.encProcessList(crtType,startNum,rows);
		
		return bdapCrypto;
		
		
	}
	
public List<BdapCrypto> getDecRoleList(char crtType,String crtStatus,int startNum,int rows){
		
		List<BdapCrypto> bdapCrypto = new ArrayList<BdapCrypto>();
		
		bdapCrypto = bdapCryptoRepository.decRoleList(crtType,crtStatus,startNum,rows);
		
		return bdapCrypto;
		
	}

public Long getEncDecListCount(String userId,char crtType){
	
	Long encDecListCount = 0L;
	encDecListCount = bdapCryptoRepository.encDecListCount(userId,crtType);

	return encDecListCount; 
}


public Long getDecRoleListCount(char crtType,String crtStatus){

	Long decRoleListCount = 0L;
	decRoleListCount = bdapCryptoRepository.decRoleListCount(crtType,crtStatus);

	return decRoleListCount; 	
}

public Long getEncProcessListCount(char crtType){
	
	Long encProcessListCount = 0L;
	encProcessListCount = bdapCryptoRepository.encProcessListCount(crtType);
	
	return encProcessListCount;
	
}

public BdapCrypto encDecInsert(BdapCrypto bdapCrypto){
	
	BdapCrypto resultBdapCrypto = bdapCryptoRepository.save(bdapCrypto);
	bdapCryptoRepository.flush();
	return resultBdapCrypto;
}

public BdapCrypto getBdapCryptoByCryptoId(String id){
	
	BdapCrypto bdapCrypto = bdapCryptoRepository.getBdapCryptoByCryptoId(id);
	return bdapCrypto;
}



	
}
