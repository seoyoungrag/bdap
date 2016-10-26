package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.domain.BdapAcl;
import com.kt.bdapportal.repository.BdapAclRepository;
import com.kt.bdapportal.service.BdapAclService;

@Service("bdapAclService")
public class BdapAclServiceImpl implements BdapAclService{

	@Autowired
	private BdapAclRepository bdapAclRepository;
	
	public List<BdapAcl> getBdapAclList(){
		
		List<BdapAcl> bdapAclList = new ArrayList<BdapAcl>();
		bdapAclList = bdapAclRepository.bdapAclList();
		return bdapAclList;
	}
	
}
