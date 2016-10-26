package com.kt.bdapportal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.domain.BdapBbsCategory;
import com.kt.bdapportal.repository.CategoryRepository;
import com.kt.bdapportal.service.CategoryService;


@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryRepository categoryRepository;
	
	public List<BdapBbsCategory> bdapBbsCategory(String bbsType){
		
		/*List <BdapBbsCategory> bdapBbsCategory = new ArrayList();*/		
		List <BdapBbsCategory> bdapBbsCategory = categoryRepository.findByCateBbsType(bbsType);
		return bdapBbsCategory;
	}
	
	public List<BdapBbsCategory> bdapSubBbsCategory(String bbsType,String bbsCategory){
		
		/*List <BdapBbsCategory> bdapBbsCategory = new ArrayList();*/		
		List <BdapBbsCategory> bdapBbsCategory = categoryRepository.findByCateBbsTypeAndCateBbsCategory(bbsType,bbsCategory);
		return bdapBbsCategory;
	}

	@Override
	public BdapBbsCategory findCurrentCategory(BdapBbs bdapBbs) {
		List<BdapBbsCategory> bbsCategoryList = categoryRepository.findByCateBbsTypeAndCateBbsCategory(bdapBbs.getBbsType(), bdapBbs.getBbsCategory());
		if(bbsCategoryList != null && !bbsCategoryList.isEmpty()){
			return bbsCategoryList.get(0);
		}
		return null;
	}
	
	
	
}
