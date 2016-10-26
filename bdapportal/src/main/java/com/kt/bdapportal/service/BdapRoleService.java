package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapRole;

public interface BdapRoleService {

	public List<BdapRole> getBdapRoleList();
	public BdapRole getBdapRole(SearchVO searchVO);
}
