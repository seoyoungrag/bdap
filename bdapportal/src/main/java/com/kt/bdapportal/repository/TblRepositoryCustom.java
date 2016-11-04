package com.kt.bdapportal.repository;

import java.util.List;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapTbl;

public interface TblRepositoryCustom {
	List<BdapTbl> getBdapTbl(BdapTbl tbl);
	List<BdapTbl> userTblList(SearchVO searchVO);
}
