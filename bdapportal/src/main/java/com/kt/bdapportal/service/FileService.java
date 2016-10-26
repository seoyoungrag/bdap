package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.domain.BdapFile;

public interface FileService {

	public BdapFile fileInsert(BdapFile bdapFile);	
	
	public void fileDelete(BdapFile bdapFile);
	public List<BdapFile> getFileListbyParentId(String parentId);
	public List<BdapFile> getFileListbyParentIdArr(String parentId);
	
	
}
