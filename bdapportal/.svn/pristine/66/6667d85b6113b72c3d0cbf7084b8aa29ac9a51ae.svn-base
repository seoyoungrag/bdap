package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.domain.BdapCrypto;

public interface BdapCryptoService {

	public List<BdapCrypto> getUserDecTblAndCol(String userId,char crtType,String crtStatus);
	public List<BdapCrypto> getTableManagementList(String userId,String dbNm);
	public List<BdapCrypto> getEncDecList(String userId,char crtType,int startNum,int rows);
	public List<BdapCrypto> getEncProcessList(char crtType,int startNum,int rows);
	public List<BdapCrypto> getDecRoleList(char crtType,String crtStatus,int startNum,int rows);
	public Long getEncDecListCount(String userId,char crtType);
	public Long getDecRoleListCount(char crtType,String crtStatus);
	public Long getEncProcessListCount(char crtType);
	public BdapCrypto encDecInsert(BdapCrypto bdapCrypto);	
	public BdapCrypto getBdapCryptoByCryptoId(String id);
	
	
}
