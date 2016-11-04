package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapUserAcl;

public interface BdapUserAclService {
	
	List<BdapUserAcl> getBdapUserAcl(SearchVO searchVO);
	List<BdapUserAcl> updateUserAcl(BdapUserAcl bdapUserAclList);
	List<String> aclListByUserId(String userId);
	
	
	
}
