package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.domain.BdapFile;
import com.kt.bdapportal.repository.FileRepository;
import com.kt.bdapportal.service.FileService;



@Service("fileService")
public class FileServiceImpl implements FileService {


	@Autowired
	private FileRepository fileRepository;

	public void setFileRepository(FileRepository fileRepository) {
		this.fileRepository = fileRepository;
	}

	@Override
	public BdapFile fileInsert(BdapFile bdapFile){			//insert 와 update를 진행한다.
		
		fileRepository.save(bdapFile);
		fileRepository.flush();
		
		return bdapFile;
	}
	
	public List<BdapFile> getFileListbyParentId(String parentId){
		
		List<BdapFile> bdapFiles = new ArrayList<BdapFile>();
		
		bdapFiles =  fileRepository.findByfleParentId(parentId);
		
		
		return bdapFiles;
	}
	
	public List<BdapFile> getFileListbyParentIdArr(String parentId){
		
		List<BdapFile> bdapFiles = new ArrayList<BdapFile>();
		
		bdapFiles =  fileRepository.findByfleParentIdArr(parentId);
		
		
		return bdapFiles;
		
	}
	
	
	public void fileDelete(BdapFile bdapFile){
	
		fileRepository.delete(bdapFile);
		fileRepository.flush();
	}
	
}
