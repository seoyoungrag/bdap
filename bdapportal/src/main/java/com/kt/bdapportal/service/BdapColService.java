package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapCol;

public interface BdapColService {

	public List<BdapCol> getBdapColList(String tblId,int startNum,int rows);
	public Long getColCount(String tblId);
	public List<BdapCol> getBdapColListByColNm(String tblId,SearchVO searchVO,int startNum,int rows);
	public Long getColCountByColNm(String tblId,SearchVO searchVO);
	public List<BdapCol> getBdapColListByTblId(String tblId);
	public BdapCol updateCellColInfo(String id, String cellName, String cellValue);
	public List<BdapCol> getBdapColListByColNm(String tblId, SearchVO searchVO);
	public List<BdapCol> getBdapColListByTblIdAndIsPrivate(String colTblId);
}
