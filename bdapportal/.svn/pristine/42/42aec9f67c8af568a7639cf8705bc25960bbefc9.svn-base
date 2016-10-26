package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapRole;
import com.kt.bdapportal.repository.BdapRoleRepository;
import com.kt.bdapportal.service.BdapRoleService;

@Service("bdapRoleService")
public class BdapRoleServiceImpl implements BdapRoleService{

	@Autowired
	private BdapRoleRepository bdapRoleRepository;
	
	public List<BdapRole> getBdapRoleList(){
		
		List<BdapRole> bdapRoleList = new ArrayList<BdapRole>();
		bdapRoleList = bdapRoleRepository.findAll();
		return bdapRoleList;
	}
	
	
	public BdapRole getBdapRole(SearchVO searchVO){
		BdapRole bdapRole = new BdapRole();
		if(searchVO.getRoleId().equals("")){
			//bdapRole = bdapRoleRepository.findOne(id);
		}else{
			bdapRole = bdapRoleRepository.findByRoleId(searchVO.getRoleId());
		}
		return bdapRole;
	}

}
