package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapRoleUser;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.repository.BdapUserRepository;
import com.kt.bdapportal.service.BdapUserService;

@Service("bdapUserService")
public class BdapUserServiceImpl implements BdapUserService {

	@Autowired
	private BdapUserRepository bdapUserRepository;
	
	@Override
	public List<BdapUser> getUserList(SearchVO searchVO) {
		List<BdapUser> bdapUserList = new ArrayList<BdapUser>();
		if (searchVO.nullTrim(searchVO.getUserId()).equals("") && searchVO.nullTrim(searchVO.getUserNm()).equals("")
				&& searchVO.nullTrim(searchVO.getRoleId()).equals("")) {
			bdapUserList = bdapUserRepository.findAllOrderByUserNm();
		} else {
			List<BdapRoleUser> bdapUserLista = bdapUserRepository.getBdapUserListBySearchVO(searchVO);
			for(BdapRoleUser user : bdapUserLista){
				bdapUserList.add(user.getUserId());
			}
		}
		return bdapUserList;
	}
	
	@Override
	public BdapUser getBdapUser(SearchVO searchVO) {
		BdapUser bdapUser = new BdapUser();
		if (searchVO.getUserId().equals("")) {
			bdapUser = bdapUserRepository.findOneLimit();
		} else {
			bdapUser = bdapUserRepository.findByUserId(searchVO.getUserId());
		}
		return bdapUser;
	}

	@Override
	public BdapUser updateCellUserInfo(String id, String cellName, String cellValue) {
		BdapUser bdapUser = bdapUserRepository.findByUserId(id);
		if (cellName.equals("userNm")) {
			bdapUser.setUserNm(cellValue);
		} else if (cellName.equals("email")) {
			bdapUser.setUserEmail(cellValue);
		}
		return bdapUserRepository.saveAndFlush(bdapUser);
	}

}
