package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.domain.BdapBbsCategory;

public interface CategoryService {

	public List<BdapBbsCategory> bdapBbsCategory(String bbs);
	public List<BdapBbsCategory> bdapSubBbsCategory(String bbsType,String bbsCategory);
	public BdapBbsCategory  findCurrentCategory(BdapBbs bdapBbs);
	
}
