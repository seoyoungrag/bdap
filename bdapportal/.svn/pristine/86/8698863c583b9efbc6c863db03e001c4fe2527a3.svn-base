package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapRole;
import com.kt.bdapportal.domain.BdapRoleUser;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.repository.BdapRoleUserRepository;
import com.kt.bdapportal.service.BdapRoleUserService;

@Service("bdapRoleUserService")
public class BdapRoleUserServiceImpl implements BdapRoleUserService{

	@Autowired
	private BdapRoleUserRepository bdapRoleUserRepository;

	@Override
	public List<BdapRoleUser> getBdapRoleUserList(SearchVO searchVO) {
		List<BdapRoleUser> bdapRoleUserList = new ArrayList<BdapRoleUser>();
		if(!searchVO.getRoleId().equals("")){
			BdapRole br = new BdapRole();
			br.setRoleId(searchVO.getRoleId());
			bdapRoleUserList = bdapRoleUserRepository.getUserListByRoleId(br);
		}
		return bdapRoleUserList;
	}

	@Override
	public List<BdapRoleUser> updateRoleUser(BdapRoleUser bdapRoleUser) {
		List<BdapRoleUser> old = bdapRoleUserRepository.getUserListByRoleId(bdapRoleUser.getRoleId());
		if(old!=null){
			bdapRoleUserRepository.delete(old);
		}
		List<BdapRoleUser> saveList = new ArrayList<BdapRoleUser>();
		if(!bdapRoleUser.getBdapUser().isEmpty()){
			for(BdapUser user : bdapRoleUser.getBdapUser()){
				BdapUser userId = new BdapUser();
				userId.setUserId(user.getUserId());
				BdapRoleUser bru = new BdapRoleUser();
				bru.setRoleId(bdapRoleUser.getRoleId());
				bru.setUserId(userId);
				saveList.add(bru);
			}
		}
		return bdapRoleUserRepository.save(saveList);
	}

}
