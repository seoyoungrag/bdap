package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapRoleUser;
import com.kt.bdapportal.domain.BdapUser;

public interface BdapRoleUserService {
	
	List<BdapRoleUser> getBdapRoleUserList(SearchVO searchVO);
	List<BdapRoleUser> updateRoleUser(BdapRoleUser bdapRoleUser);
	public BdapRoleUser getRoleIdByUserId(BdapUser bdapUser);
	public BdapRoleUser insert(BdapRoleUser bdapRoleUser);
}
