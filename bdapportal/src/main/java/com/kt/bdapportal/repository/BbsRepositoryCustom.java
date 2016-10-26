package com.kt.bdapportal.repository;

import java.util.List;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapBbs;

public interface BbsRepositoryCustom {
	List<BdapBbs> listBdapBbs(SearchVO searchVO,int startnum,int size);
	Long countBdapBbs(SearchVO searchVO);
}
