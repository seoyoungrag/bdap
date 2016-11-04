package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.domain.BdapCrypto;

public interface BdapCryptoService {

	public List<BdapCrypto> getUserDecTblAndCol(String userId,char crtType,String crtStatus);
	public List<BdapCrypto> getTableManagementList(String userId,String dbNm);
	public List<BdapCrypto> getEncDecList(String userId,char crtType,int startNum,int rows);
	public List<BdapCrypto> getEncDecList(char crtType,int startNum,int rows);
	public List<BdapCrypto> getEncProcessList(char crtType,int startNum,int rows);
	public List<BdapCrypto> getEncProcessList(String userId, char c, int startnum, int rows);
	public List<BdapCrypto> getDecRoleList(char crtType,String crtStatus,int startNum,int rows);
	public List<BdapCrypto> getDecRoleList(String userId, char crtType, String crtStatus, int startNum, int rows);
	public Long getEncDecListCount(String userId,char crtType);
	public Long getEncDecListCount(char crtType);
	public Long getDecRoleListCount(char crtType,String crtStatus);
	public Long getDecRoleListCount(String userId, char crtType, String crtStatus);
	public Long getEncProcessListCount(char crtType);
	public Long getEncProcessListCount(String userId, char c);
	public BdapCrypto encDecInsert(BdapCrypto bdapCrypto);	
	public BdapCrypto getBdapCryptoByCryptoId(String id);
	
	
	
}
