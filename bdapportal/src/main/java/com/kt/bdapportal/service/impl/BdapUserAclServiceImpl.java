package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapAcl;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.domain.BdapUserAcl;
import com.kt.bdapportal.repository.BdapUserAclRepository;
import com.kt.bdapportal.service.BdapUserAclService;

@Service("bdapUserAclService")
public class BdapUserAclServiceImpl implements BdapUserAclService{

	@Autowired
	private BdapUserAclRepository bdapUserAclRepository;
	
	public List<BdapUserAcl> getBdapUserAcl(SearchVO searchVO){
		
		List<BdapUserAcl> bdapUserAclList = new ArrayList<BdapUserAcl>();
		if(!searchVO.getUserId().equals("")){
			BdapUser bu = new BdapUser();
			bu.setUserId(searchVO.getUserId());
			bdapUserAclList = bdapUserAclRepository.getBdapUserAclByUserId(bu);
		}
		return bdapUserAclList;
	}
	
	@Override
	@Transactional 
	public List<BdapUserAcl> updateUserAcl(BdapUserAcl bdapUserAcl) {
			List<BdapUserAcl> old = bdapUserAclRepository.getBdapUserAclByUserId(bdapUserAcl.getUserId());
			if(old!=null){
				bdapUserAclRepository.delete(old);
			}
			List<BdapUserAcl> saveList = new ArrayList<BdapUserAcl>();
			if(!bdapUserAcl.getBdapAcl().isEmpty()){
				for(BdapAcl acl : bdapUserAcl.getBdapAcl()){
					BdapAcl aclId = new BdapAcl();
					aclId.setAclId(acl.getAclId());
					BdapUserAcl bau = new BdapUserAcl();
					bau.setUserId(bdapUserAcl.getUserId());
					bau.setAclId(aclId);
					saveList.add(bau);
				}
			}
			return bdapUserAclRepository.save(saveList);
	}

	
	
	public List<String> aclListByUserId(String userId){
		List<String> aclList = new ArrayList<String>();
		aclList = bdapUserAclRepository.aclListByUserId(userId);
		return aclList;
	}
}
