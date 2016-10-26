package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapRoleUser;

public interface BdapRoleUserService {
	
	List<BdapRoleUser> getBdapRoleUserList(SearchVO searchVO);
	List<BdapRoleUser> updateRoleUser(BdapRoleUser bdapRoleUser);
	
}
