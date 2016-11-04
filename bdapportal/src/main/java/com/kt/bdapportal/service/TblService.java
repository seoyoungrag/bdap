package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapTbl;

public interface TblService {

	public List<BdapTbl> getExpirationDateNearTable(String userId);
	public List<BdapTbl> getSchemaList(SearchVO searchVO,int startNum, int rows);
	public BdapTbl getSchema(String tblId);
	public Long getSchemaCount(String userId);
	public List<BdapTbl> getTblTree();
	public BdapTbl getSchemaByTblNm(String userId,SearchVO searchVo,int startNum,int rows);
	public List<BdapTbl> getTableList(String schema);
	public List<BdapTbl> getUserTableList(SearchVO searchVO);
	public BdapTbl getBdapTblByTblId(String tblId);
	public BdapTbl updateValidateDate(BdapTbl bdapTbl);
	public List<String> getDistinctSchemaNmList();
	public List<BdapTbl> getSchemaWithTblList(SearchVO searchVO);
	public BdapTbl updateCellTblInfo(String id, String cellName, String cellValue);
	public BdapTbl getSchemaByTblNm(String userId, SearchVO searchVo);
	public BdapTbl getSchemaListByTblId(SearchVO searchVO, String tblId);
	public List<String> getSchemaList(boolean isAdmin, String userId);
	public List<BdapTbl> getTblListByTblNm(SearchVO searchVO, int startNum, int rows);
}
