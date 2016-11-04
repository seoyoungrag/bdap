package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapCol;
import com.kt.bdapportal.repository.BdapColRepository;
import com.kt.bdapportal.service.BdapColService;

@Service("colService")
public class BdapColServiceImpl implements BdapColService {

	@Autowired
	private BdapColRepository bdapColRepository;

	public List<BdapCol> getBdapColList(String tblId, int startNum, int rows) {

		List<BdapCol> bdapColList = bdapColRepository.colList(tblId, startNum, rows);

		return bdapColList;
	}

	public List<BdapCol> getBdapColListByTblId(String tblId) {

		List<BdapCol> bdapColList = bdapColRepository.colListByTblId(tblId);

		return bdapColList;
	}

	public Long getColCount(String tblId) {

		Long count = bdapColRepository.colCount(tblId);

		return count;
	}

	public List<BdapCol> getBdapColListByColNm(String tblId, SearchVO searchVO, int startNum, int rows) {

		List<BdapCol> bdapColList = new ArrayList<BdapCol>();

		if (searchVO.getSearchType().equals("colKorNm")) {
			bdapColList = bdapColRepository.colByColKorNm(searchVO.getSearchWord(), startNum, rows);
		} else if (searchVO.getSearchType().equals("colEngNm")) {
			bdapColList = bdapColRepository.colByColEngNm( searchVO.getSearchWord(), startNum, rows);
		} else if (searchVO.getSearchType().equals("desc")) {
			bdapColList = bdapColRepository.colByColDesc(searchVO.getSearchWord(), startNum, rows);
		}

		return bdapColList;
	}

	public List<BdapCol> getBdapColListByColNm(String tblId, SearchVO searchVO) {

		List<BdapCol> bdapColList = new ArrayList<BdapCol>();

		if (searchVO.getSearchType().equals("colKorNm")) {
			bdapColList = bdapColRepository.colByColKorNm(tblId, searchVO.getSearchWord());
		} else if (searchVO.getSearchType().equals("colEngNm")) {
			bdapColList = bdapColRepository.colByColEngNm(tblId, searchVO.getSearchWord());
		} else if (searchVO.getSearchType().equals("desc")) {
			bdapColList = bdapColRepository.colByColDesc(tblId, searchVO.getSearchWord());
		}

		return bdapColList;
	}
	@Override
	public Long getColCountByColNm(String tblId, SearchVO searchVO) {

		Long count = 0L;

		if (searchVO.getSearchType().equals("colKorNm")) {
			count = bdapColRepository.countColByColKorNm(searchVO.getSearchWord());
		} else if (searchVO.getSearchType().equals("colEngNm")) {
			count = bdapColRepository.countColByColEngNm(searchVO.getSearchWord());
		} else if (searchVO.getSearchType().equals("desc")) {
			count = bdapColRepository.countColByColDesc(searchVO.getSearchWord());
		}

		return count;
	}

	@Override
	public BdapCol updateCellColInfo(String id, String cellName, String cellValue) {
		BdapCol bdapCol = bdapColRepository.findOne(id);
		String localCellValue = cellValue.toLowerCase();
		if (cellName.equals("colKorNm")) {
			bdapCol.setColKorNm(localCellValue);
		} else if (cellName.equals("dataType")) {
			bdapCol.setColDataType(localCellValue);
		} else if (cellName.equals("desc")) {
			bdapCol.setColDesc(localCellValue);
		} else if (cellName.equals("isEnc")) {
			bdapCol.setColIsEnc(localCellValue.charAt(0));
		} else if (cellName.equals("isChkNull")) {
			bdapCol.setColIsChkNull(localCellValue.charAt(0));
		} else if (cellName.equals("isChkType")) {
			bdapCol.setColIsChkType(localCellValue.charAt(0));
		} else if (cellName.equals("chkTypeFormat")) {
			bdapCol.setColRegex(localCellValue);
		}
		return bdapColRepository.saveAndFlush(bdapCol);

	}

	@Override
	public List<BdapCol> getBdapColListByTblIdAndIsPrivate(String colTblId) {
		List<BdapCol> bdapColList = bdapColRepository.getBdapColListByTblIdAndIsPrivate(colTblId);
		return bdapColList;
	}

}
