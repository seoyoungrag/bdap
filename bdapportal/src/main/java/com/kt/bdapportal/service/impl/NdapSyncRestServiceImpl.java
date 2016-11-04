package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.domain.BdapCol;
import com.kt.bdapportal.domain.BdapTbl;
import com.kt.bdapportal.model.JsonCol;
import com.kt.bdapportal.model.JsonTable;
import com.kt.bdapportal.model.NdapTableEventJson;
import com.kt.bdapportal.repository.BdapColRepository;
import com.kt.bdapportal.repository.TblRepository;

@Service("ndapSyncRestService")
public class NdapSyncRestServiceImpl {
	@Autowired
	private TblRepository tblRepository;
	
	@Autowired
	private BdapColRepository colRepository;

	public String createTable(NdapTableEventJson json) {
		StringBuffer retVal = new StringBuffer("create tblId : ");
		
		//1. 테이블 도메인 객체 만들어서
		BdapTbl tbl = new BdapTbl();
		JsonTable jTbl = new JsonTable(json.getJsonTbl());
		tbl.setTblEngNM(jTbl.getTblName());
		tbl.setTblDbNm(jTbl.getDbName());
		tbl.setTblOwner(jTbl.getOwner());
		StringBuffer tblCreate = new StringBuffer(jTbl.getTblCreate());
		if(tblCreate.length()==10){
			tblCreate.append("000");
		}
		tbl.setTblCreateDt(tblCreate.toString());
		tbl.setTblType(jTbl.getTblType());
		tbl.setTblLocation(jTbl.getSdInfo().getLocation());
		tbl.setTblValidateDate(jTbl.getTblValidateDate());
		
		List<BdapTbl> oTblList = tblRepository.getBdapTbl(tbl);
		
		//1-1. 중복 체크(중복이면 tblid를 할당해서 update되도록 만든다. 
		//지우고 삭제하도록 변경 drop이나 alter sync가 안된 상황
		/*
		BdapTbl oTbl = null;
		if(!oTblList.isEmpty()){
			oTbl = oTblList.get(0);
		}
		if(oTbl != null){
			tbl.setTblId(oTbl.getTblId());
		}
		*/
		
		//1-1. 중복 체크(무조건 지우고 다시 입력한다.)
		if(!oTblList.isEmpty()){
			for(BdapTbl duplicatedT : oTblList){
				tblRepository.delete(duplicatedT);
				BdapCol colForTblId = new BdapCol();
				colForTblId.setColTblId(duplicatedT.getTblId());
				List<BdapCol> duplicatedC = colRepository.getBdapCol(colForTblId);
				if(!duplicatedC.isEmpty()){
					colRepository.delete(duplicatedC);
				}
			}
		}
		//2. 테이블 insert
		tbl = tblRepository.saveAndFlush(tbl);
		
		//3. 테이블 인서트한 리턴으로 id를 받아와서
		String tblId = tbl.getTblId();
		
		//4. 컬럼 도메인 만들어서
		List<BdapCol> colList = new ArrayList<BdapCol>();
		List<JsonCol> jColList = jTbl.getSdInfo().getColInfo();
		int colIndex = 1;
		for(JsonCol jCol : jColList){
			BdapCol col = new BdapCol();
			col.setColEngNm(jCol.getColNm());
			col.setColDataType(jCol.getColType());
			col.setColTblId(tblId);
			col.setColDbNm(tbl.getTblDbNm());
			col.setColTblNm(tbl.getTblEngNM());
			col.setColOrderNum(colIndex++);
			//col.setColOrderNum(jCol.getOrderNum());
			colList.add(col);
		}
		
		//5. 컬럼 도메인 insert
		colRepository.save(colList);
		colRepository.flush();
		
		// 테이블 도메인에 컬럼 도메인 담아서 한번에 insert 안됨...
		//tbl.setChild(colList);
		//tbl = tblRepository.saveAndFlush(tbl);	
		
		retVal.append(tbl.getTblId());
	
		return retVal.toString();
	}

	public String alterTable(NdapTableEventJson json) {
		StringBuffer retVal = new StringBuffer("alter tblId : ");
		//1. 테이블 도메인 객체 만들어서
		BdapTbl oldTbl = new BdapTbl();
		JsonTable jOldTbl = json.getJsonTblOld();
		oldTbl.setTblEngNM(jOldTbl.getTblName());
		oldTbl.setTblDbNm(jOldTbl.getDbName());
		//2. 테이블을 셀렉트 한다.
		List<BdapTbl> oTblList = tblRepository.getBdapTbl(oldTbl);
		
		/*
		BdapTbl oTbl = null;
		if(!oTblList.isEmpty()){
			oTbl = oTblList.get(0);
		}
		if(oTbl != null){
			oldTbl.setTblId(oTbl.getTblId());
		}
		*/
		
		//2-1. 기존의 중복 테이블들을 삭제해야한다. 중복 테이블들 중 첫번째만 기존정보를 넘겨주는 로직 처리후 삭제처리된다.
		boolean isDuplicated = false;
		for(BdapTbl oTbl : oTblList){
			if(!isDuplicated){
				oldTbl.setTblId(oTbl.getTblId());
				if(oTbl.getTblValidateDate()!=null){
					oldTbl.setTblValidateDate(oTbl.getTblValidateDate());
				}
				//3. 기존 테이블 부가 정보를 유지해야 한다.
				//3-1. 기존 테이블 부가 정보를 복사한 객체를 만들고, 이 json 데이터를 객체에 입력한다.
				BdapTbl newTbl = new BdapTbl(oldTbl);
				JsonTable jNewTbl = json.getJsonTblNew();
				newTbl.setTblDbNm(jNewTbl.getDbName());
				StringBuffer tblCreate = new StringBuffer(jNewTbl.getTblCreate());
				if(tblCreate.length()==10){
					tblCreate.append("000");
				}
				newTbl.setTblCreateDt(tblCreate.toString());
				newTbl.setTblId(oldTbl.getTblId());
				newTbl.setTblEngNM(jNewTbl.getTblName());
				newTbl.setTblType(jNewTbl.getTblType());
				newTbl.setTblLocation(jNewTbl.getSdInfo().getLocation());
				newTbl.setTblOwner(jNewTbl.getOwner());
				
				
				//3-2. 테이블 인서트
				newTbl = tblRepository.save(newTbl);
				
				//4. 테이블의 id로 컬럼 리스트를 같이 읽힌다.
				
				//5. 기존 컬럼 부가 정보를 유지 해야한다.
				//5-1. 기존 컬럼에서 name을 기준으로 type만 비교하여 다른 값을 입력하고,
				//List<BdapCol> oldColList = oldTbl.getChild(); //LAZY라 한번에 안불러와서 따로 불러와야 한다.
				BdapCol colForTblid = new BdapCol();
				colForTblid.setColTblId(newTbl.getTblId());
				List<BdapCol> oldColList = colRepository.getBdapCol(colForTblid);
				List<JsonCol> jNewColList = jNewTbl.getSdInfo().getColInfo();
				List<BdapCol> insertColList = new ArrayList<BdapCol>();
				int colIndex = 1;
				for(JsonCol jCol : jNewColList){
					BdapCol curCol = null;
					for(BdapCol oCol : oldColList){
						if(jCol.getColNm().equals(oCol.getColEngNm())){
							curCol = oCol;
							break;
						}
					}
					if(curCol !=null){
						curCol.setColDataType(jCol.getColType());
						//curCol.setColOrderNum(jCol.getOrderNum());
					}else{
						curCol = new BdapCol();
						curCol.setColEngNm(jCol.getColNm());
						curCol.setColDataType(jCol.getColType());
						//curCol.setColOrderNum(jCol.getOrderNum());
					}
					curCol.setColTblId(newTbl.getTblId());
					curCol.setColDbNm(newTbl.getTblDbNm());
					curCol.setColTblNm(newTbl.getTblEngNM());
					curCol.setColOrderNum(colIndex++);
					insertColList.add(curCol);
				}
				
				//5-2. 새로운 컬럼리스트에는 없는데 기존 컬럼리스트에 있는 것들은 삭제한다.(변경된 컬럼과 새로운 컬럼들은 동일한 리스트로 insert할 것, 자동으로 update되기 때문)
				List<BdapCol> deleteColList = new ArrayList<BdapCol>();
				for(BdapCol oCol : oldColList){
					Boolean isRemain = false;
					for(JsonCol jCol : jNewColList){
						if(oCol.getColEngNm().equals(jCol.getColNm())){
							isRemain = true;
							break;
						}
					}
					if(!isRemain){
						deleteColList.add(oCol);
					}
				}
				//5-3. 삭제 컬럼 delete
				colRepository.delete(deleteColList);
				
				//5-4. 새로운 컬럼 및 변경 컬럼 insert
				colRepository.save(insertColList);
				colRepository.flush();
				
				retVal.append(newTbl.getTblId());
				isDuplicated = true;
			}else{
				tblRepository.delete(oldTbl);
				BdapCol colForTblId = new BdapCol();
				colForTblId.setColTblId(oTbl.getTblId());
				List<BdapCol> duplicatedC = colRepository.getBdapCol(colForTblId);
				if(!duplicatedC.isEmpty()){
					colRepository.delete(duplicatedC);
				}
			}
		}
		
		return retVal.toString();
	}

	public String dropTable(NdapTableEventJson json) {
		StringBuffer retVal = new StringBuffer("drop tblId : ");
		
		//1. 테이블 도메인 객체 만들어서
		BdapTbl oldTbl = new BdapTbl();
		JsonTable jTbl = json.getJsonTbl();
		oldTbl.setTblEngNM(jTbl.getTblName());
		oldTbl.setTblDbNm(jTbl.getDbName());
		//2. 테이블을 셀렉트 한다.
		List<BdapTbl> oTblList = tblRepository.getBdapTbl(oldTbl);
		/*
		BdapTbl oTbl = null;
		if(!oTblList.isEmpty()){
			oTbl = oTblList.get(0);
		}
		if(oTbl != null){
			oldTbl.setTblId(oTbl.getTblId());
		}
		*/
		if(!oTblList.isEmpty()){
			for(BdapTbl oTbl : oTblList){
				//2. 테이블들을 delete
				tblRepository.delete(oTbl);
				//3. 해당 table의 id를 가진 컬럼들을 delete
				BdapCol colForTblId = new BdapCol();
				colForTblId.setColTblId(oTbl.getTblId());
				List<BdapCol> duplicatedC = colRepository.getBdapCol(colForTblId);
				if(!duplicatedC.isEmpty()){
					colRepository.delete(duplicatedC);
				}
				retVal.append(oTbl.getTblId()).append(" ");
			}
		}
		return retVal.toString();
	}

	
}
