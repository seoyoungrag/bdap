package com.kt.bdapportal.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;

import com.kt.bdapportal.domain.BdapCol;
import com.kt.bdapportal.domain.BdapTbl;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.repository.BdapColRepository;
import com.kt.bdapportal.repository.TblRepository;

public class ExcelService  {
	private TblRepository tblRepository;
	private BdapColRepository colRepository;
	
	
	public ExcelService(TblRepository tblRepository, BdapColRepository colRepository){
		this.tblRepository = tblRepository;
		this.colRepository = colRepository;
	}
	
	public int excelFileUpload(HttpServletRequest request) {
		HttpSession session = request.getSession();
		BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
		String uploadPath = BbsConstant.FILE_TEMP_PATH+File.separator+bdapUser.getUserId();
		int result = 1;
		
		if(ServletFileUpload.isMultipartContent(request)){ 
	         try { 
	        	 request.setCharacterEncoding("UTF-8");
	             List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request); 
	             String fileName = "";
	             for(FileItem item : multiparts){ 
	                 if(!item.isFormField()){ 
	                	 fileName = new File(item.getName()).getName(); 
	                     File directory = new File(uploadPath);
	         	        if(directory.exists() == false){
	         	        	directory.mkdirs();
	         	        }  
	         	        item.write( new File(uploadPath+ File.separator + fileName));
	                 } 
	             } 
	            request.setAttribute("message", "File Uploaded Successfully"); 
	            result = readExcelFile(uploadPath+ File.separator + fileName);
	            
	         	}catch (Exception ex) { 
	             ex.printStackTrace();
	         } 
	     }else{ 
	    	 result = -3;
	     } 
        return result;
    }
	
	private int readExcelFile(String filePath) {
		List<BdapCol> list = new ArrayList<BdapCol>();
		int result = 1;
		
		try {
			OPCPackage opcPackage = OPCPackage.open(new File(filePath));
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
			opcPackage.close();
			int rowindex=0;
			
			XSSFSheet sheet=workbook.getSheetAt(0);
			
			//행의 수
			int rows=sheet.getPhysicalNumberOfRows();
			
			// 엑셀 row수를 10000개로 제한하자. 메모리가 어떻게 될지 알 수가 없으니.
			String currentTblName = new String();
			
			for(rowindex=1;rowindex<rows && rowindex <= 10000; rowindex++){
			    Row row=sheet.getRow(rowindex);
			    
			    if(row !=null){
			        // 엑셀의 두번째 컬럼이 스키마 영문명, 세번째가 테이블 영문명이다. 컬럼정보를 입력할 때 해당 스키마, 테이블의 모든 컬럼을 지운다.
			        try {
			        	if(!currentTblName.equals(row.getCell(1).getStringCellValue()+row.getCell(2).getStringCellValue())){
				        	currentTblName = row.getCell(1).getStringCellValue()+row.getCell(2).getStringCellValue();
				        	
				        	BdapCol colForTblId = new BdapCol();
				        	colForTblId.setColDbNm(row.getCell(1).getStringCellValue());
							colForTblId.setColTblNm(row.getCell(2).getStringCellValue());
							List<BdapCol> duplicatedC = colRepository.getBdapCol(colForTblId);
							if(!duplicatedC.isEmpty()){
								colRepository.delete(duplicatedC);
							}
				        }
			        	
			        	// 테이블 아이디를 알아내기 위해 
				        BdapTbl bdapTbl = new BdapTbl();
				        bdapTbl.setTblDbNm(row.getCell(1).getStringCellValue());
				        bdapTbl.setTblEngNM(row.getCell(2).getStringCellValue());
				        
				        List<BdapTbl> tblList = this.tblRepository.getBdapTbl(bdapTbl);
				        
				        BdapCol bdapCol = new BdapCol();
				        bdapCol.setColDbNm(row.getCell(1).getStringCellValue());
				        bdapCol.setColDataType(row.getCell(6).getStringCellValue());
				        bdapCol.setColDesc(row.getCell(9).getStringCellValue());
				        bdapCol.setColEngNm(row.getCell(4).getStringCellValue());
				        bdapCol.setColKorNm(row.getCell(5).getStringCellValue());
				        bdapCol.setColOrderNum((int)row.getCell(10).getNumericCellValue());
				        bdapCol.setColTblId(tblList.get(0).getTblId());
				        bdapCol.setColTblNm(tblList.get(0).getTblEngNM());
				        bdapCol.setColIsPk('N');
				        bdapCol.setColIsEnc('N');
				        bdapCol.setColIsChkType('N');
				        bdapCol.setColIsChkNull('N');
				        
				        colRepository.save(bdapCol);
					} catch (Exception e) {
						result = -1;
					}
			    }
			}
		} catch (Exception e) {
			result = -2;
		}
		
		return result;
    }
}