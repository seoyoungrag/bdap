package com.kt.bdapportal.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapTbl;
import com.kt.bdapportal.repository.TblRepository;
import com.kt.bdapportal.service.TblService;

@Service("tblService")
public class TblServiceImpl implements TblService {

	@Autowired
	private TblRepository tblRepository;

	public List<BdapTbl> getExpirationDateNearTable(String userId) {

		List<BdapTbl> bdapTbl = tblRepository.expirationDateNearTable(userId);

		return bdapTbl;
	} 

	public BdapTbl getSchema(String tblId) {

		BdapTbl bdapTbl = new BdapTbl();
		bdapTbl = tblRepository.schema(tblId);

		return bdapTbl;
	}

	public BdapTbl getSchemaListByTblId(SearchVO searchVO, String tblId) {

		BdapTbl bdapTbl = new BdapTbl();
		bdapTbl = tblRepository.getSchemaListByTblId(tblId);

		return bdapTbl;
	}

	public List<BdapTbl> getSchemaList(SearchVO searchVO, int startNum, int rows) {

		List<BdapTbl> bdapTbl = new ArrayList<BdapTbl>();
		bdapTbl = tblRepository.schemaList(searchVO.getUserId(), startNum, rows);

		return bdapTbl;
	}

	public Long getSchemaCount(String userId) {

		Long count = tblRepository.schemaCount(userId);

		return count;
	}

	public List<BdapTbl> getTblTree() {
		List<BdapTbl> bdapTbl = new ArrayList<BdapTbl>();
		bdapTbl = tblRepository.tblTree();

		return bdapTbl;
	}

	public BdapTbl getSchemaByTblNm(String userId, SearchVO searchVo, int startNum, int rows) {

		BdapTbl bdapTbl = new BdapTbl();

		if (searchVo.getSearchType().equals("tblKorNm")) {
			bdapTbl = tblRepository.schemaByTblKorNm(userId, searchVo.getSearchWord());
		} else if (searchVo.getSearchType().equals("tblEngNm")) {
			bdapTbl = tblRepository.schemaByTblEngNm(userId, searchVo.getSearchWord());
		}

		return bdapTbl;
	}

	public BdapTbl getSchemaByTblNm(String userId, SearchVO searchVo) {

		BdapTbl bdapTbl = new BdapTbl();

		if (searchVo.getSearchType().equals("tblKorNm")) {
			bdapTbl = tblRepository.schemaByTblKorNm(userId, searchVo.getSearchWord());
		} else if (searchVo.getSearchType().equals("tblEngNm")) {
			bdapTbl = tblRepository.schemaByTblEngNm(userId, searchVo.getSearchWord());
		}

		return bdapTbl;
	}
	
	public List<BdapTbl> getTableList(String schema) {

		List<BdapTbl> bdapTbl = new ArrayList<BdapTbl>();

		bdapTbl = tblRepository.tblList(schema);

		return bdapTbl;

	}

	public List<BdapTbl> getUserTableList(SearchVO searchVO) {
		List<BdapTbl> bdapTbl = new ArrayList<BdapTbl>();
		bdapTbl = tblRepository.userTblList(searchVO);
		return bdapTbl;
	}

	public BdapTbl getBdapTblByTblId(String tblId) {

		BdapTbl bdapTbl = tblRepository.findByTblId(tblId);
		return bdapTbl;
	}

	public BdapTbl updateValidateDate(BdapTbl bdapTbl) {
		BdapTbl resultBdapTbl = tblRepository.save(bdapTbl);
		tblRepository.flush();
		return resultBdapTbl;
	}

	@Override
	public List<String> getDistinctSchemaNmList() {
		List<String> dbNms = tblRepository.findDistinctByTblDbNm();
		return dbNms;
	}

	@Override
	public List<BdapTbl> getSchemaWithTblList(SearchVO searchVO) {
		BdapTbl searchTbl = new BdapTbl();
		if (!searchVO.getSchemaNm().equals("")) {
			searchTbl.setTblDbNm(searchVO.getSchemaNm());
		}
		if (!searchVO.getTblNm().equals("")) {
			searchTbl.setTblEngNM(searchVO.getTblNm());
		}
		List<BdapTbl> tblList = tblRepository.getBdapTbl(searchTbl);
		return tblList;
	}

	@Override
	public BdapTbl updateCellTblInfo(String id, String cellName, String cellValue) {
		BdapTbl bdapTbl = tblRepository.findByTblId(id);
		String localCellValue = cellValue.toLowerCase();
		if (cellName.equals("tblKorNm")) {
			bdapTbl.setTblKorNm(localCellValue);
		} else if (cellName.equals("isManaged")) {
			bdapTbl.setTblIsManaged(localCellValue.charAt(0));
			bdapTbl.setTblStackType("2");
			try{
				java.util.Date insertDate = new java.text.SimpleDateFormat("yyyy-MM-dd").parse("9999-12-31");	
				bdapTbl.setTblValidateDate(insertDate);
			}catch(ParseException e){
				e.printStackTrace();
			}
		} else if (cellName.equals("isCheckNull")) {
			bdapTbl.setTblIsChkNull(localCellValue.charAt(0));
		} else if (cellName.equals("isCehckRegex")) {
			bdapTbl.setTblIsChkType(localCellValue.charAt(0));
		}
		return tblRepository.saveAndFlush(bdapTbl);
	}
	
	public List<String> getSchemaList(boolean isAdmin, String userId){
		List<String> bdapTbl = new ArrayList<String>();
		if(isAdmin){
			bdapTbl = tblRepository.getSchemaListForAdmin();
		}else{
			bdapTbl = tblRepository.getSchemaListForUser(userId);
		}
		
		return bdapTbl; 
	}

	@Override
	public List<BdapTbl> getTblListByTblNm(SearchVO searchVO, int startNum, int rows) {

		List<BdapTbl> bdapTblList = new ArrayList<BdapTbl>();

		if (searchVO.getSearchType().equals("tblKorNm")) {
			bdapTblList = tblRepository.getBdapTblByTblKorNmIgnoreCaseContaining(searchVO.getSearchWord());
		} else if (searchVO.getSearchType().equals("tblEngNm")) {
			bdapTblList = tblRepository.getBdapTblByTblEngNmIgnoreCaseContaining(searchVO.getSearchWord());
		}

		return bdapTblList;
	}

}
