package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapAcl;
import com.kt.bdapportal.domain.BdapRole;
import com.kt.bdapportal.domain.BdapRoleAcl;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.domain.BdapUserAcl;
import com.kt.bdapportal.repository.BdapRoleAclRepository;
import com.kt.bdapportal.service.BdapRoleAclService;

@Service("bdapRoleAclService")
public class BdapRoleAclServiceImpl implements BdapRoleAclService{

	@Autowired
	private BdapRoleAclRepository bdapRoleAclRepository;
	
	@Override
	public List<BdapRoleAcl> getBdapRoleAclList(SearchVO searchVO) {
		List<BdapRoleAcl> bdapRoleAclList = new ArrayList<BdapRoleAcl>();
		if(!searchVO.getRoleId().equals("")){
			BdapRole br = new BdapRole();
			br.setRoleId(searchVO.getRoleId());
			bdapRoleAclList = bdapRoleAclRepository.getBdapRoleAclByRoleId(br);
		}
		return bdapRoleAclList;
	}

	@Override
	public List<BdapRoleAcl> updateRoleAcl(BdapRoleAcl bdapRoleAcl) {
		List<BdapRoleAcl> old = bdapRoleAclRepository.getBdapRoleAclByRoleId(bdapRoleAcl.getRoleId());
		if(old!=null){
			bdapRoleAclRepository.delete(old);
		}
		List<BdapRoleAcl> saveList = new ArrayList<BdapRoleAcl>();
		if(!bdapRoleAcl.getBdapAcl().isEmpty()){
			for(BdapAcl acl : bdapRoleAcl.getBdapAcl()){
				BdapAcl aclId = new BdapAcl();
				aclId.setAclId(acl.getAclId());
				BdapRoleAcl bra = new BdapRoleAcl();
				bra.setRoleId(bdapRoleAcl.getRoleId());
				bra.setAclId(aclId);
				saveList.add(bra);
			}
		}
		return bdapRoleAclRepository.save(saveList);
	}
}
