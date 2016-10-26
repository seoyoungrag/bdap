package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.BdapBbsCategory;

@Repository("categoryRepository")
public interface CategoryRepository extends JpaRepository<BdapBbsCategory,String>{
	@Query(value ="select * from BDAP_BBS_CATEGORY where CATE_BBS_TYPE = ?1 AND CATE_PARENT_CATE_ID IS NULL OR CATE_PARENT_CATE_ID=''", nativeQuery = true)
	List<BdapBbsCategory> findByCateBbsType(String bbsType);

	@Query(value ="select * from BDAP_BBS_CATEGORY where CATE_BBS_TYPE = ?1 AND CATE_PARENT_CATE_ID =?2", nativeQuery = true)
	List<BdapBbsCategory> findByCateBbsTypeAndCateBbsCategory(String bbsType,String bbsCategory);
	
	List<BdapBbsCategory> findByCateBbsTypeAndCateName(String bbsType,String cateName);
	
}
