package com.kt.bdapportal.common.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.Region;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractXlsView;

/**
 * @author
 * @function Excel DownLoad
 * @search Spring AbstractExcelView, Spring + Jakarta POI
 */
public class ExcelDownView extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) {
		int topTitleRow = 0;
		int titleDateRow = 2;
		int titleRow = 3;
		int contentRow = 4;
		// 1. 각각의 controller에서 마지막에 넘긴 ModelAndView 가져옴
		Map<String, Object> map = (Map<String, Object>) model.get("ListExcelDownMap");

		// 2. 시트이름 설정
		String sheetName = (String) map.get("sheetNm");
		String sheetStyle = (String) map.get("sheetSt");// 시트 스타일 설정

		// 3. 엑셀파일 생성
		Sheet sheet = workbook.createSheet(sheetName);
		sheet.createRow(topTitleRow).createCell(topTitleRow).setCellValue(sheetName);// 시트(0, 0)셀에 제목과 같은 텍스트 세팅

		// 셀병합
		sheet.addMergedRegion(new CellRangeAddress(0, // 시작 행번호
				0, // 마지막 행번호
				0, // 시작 열번호
				5 // 마지막 열번호
		));
		// 4. 컬럼제목 및 색세팅
		List<Object> titleList = (List<Object>) map.get("Title");
		// 셀 폰트 & 스타일 추가
		CellStyle titleCellStyle = workbook.createCellStyle();
		titleCellStyle.setFillBackgroundColor(HSSFColor.LIGHT_GREEN.index);
		titleCellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		titleCellStyle.setAlignment(HorizontalAlignment.CENTER);
		titleCellStyle.setBorderBottom(BorderStyle.THIN);
		titleCellStyle.setBorderTop(BorderStyle.THIN);
		titleCellStyle.setBorderRight(BorderStyle.THIN);
		titleCellStyle.setBorderLeft(BorderStyle.THIN);
		Font font = workbook.createFont();
		font.setColor(HSSFColor.RED.index);

		CellStyle contentCellStyle = workbook.createCellStyle();
		contentCellStyle.setFillBackgroundColor(HSSFColor.LIGHT_GREEN.index);
		contentCellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		contentCellStyle.setAlignment(HorizontalAlignment.CENTER);
		contentCellStyle.setBorderBottom(BorderStyle.THIN);
		contentCellStyle.setBorderTop(BorderStyle.THIN);
		contentCellStyle.setBorderRight(BorderStyle.THIN);
		contentCellStyle.setBorderLeft(BorderStyle.THIN);
		
		Cell cell = null;
		
		// 엑셀 상단제목세팅
		if (sheetStyle.equals("normal")) {
			sheet.createRow(titleRow);
			for (int i = 0; i < titleList.size(); i++) {
				sheet.getRow(titleRow).createCell(i);
				cell = sheet.getRow(titleRow).getCell(i);
				cell.setCellValue(titleList.get(i).toString());
				cell.setCellStyle(titleCellStyle);
			}
		}
		// 5. 조회된 데이터 세팅
		
		HashMap getMap = new HashMap();
		// pmd said : 변수의 첫글짜는 소문자여야 한다.
		List<Object> listExcelDownList = (List<Object>) map.get("ListExcelDown");
		List<Object> titleDateList = (List<Object>) map.get("titleDate");
		// 데이터 세팅
		if (sheetStyle.equals("normal")) {
			for (int i = 0; i < listExcelDownList.size(); i++) {
				getMap = (HashMap) listExcelDownList.get(i);
				sheet.createRow(contentRow+i);
				for (int j = 0; j < titleList.size(); j++) {
					sheet.getRow(contentRow+i).createCell(j);
					cell = sheet.getRow(contentRow + i).getCell(j);
					//적재현황 조회 같은 케이스는... 다르게 처리
					if(sheetName.equals("적재현황조회")){
						cell.setCellValue((String) getMap.get(titleList.get(j).toString()+titleDateList.get(j)));
					}else{
						cell.setCellValue((String) getMap.get(titleList.get(j).toString()));
					}
					cell.setCellStyle(contentCellStyle);
					// sheet.autoSizeColumn((short)j);//셀 width 자동조정
					// sheet.setColumnWidth(j, (sheet.getColumnWidth(j))+512 );
					// //자동조정 후 잘리는 부분조정
				}
			}
			// these cords have been separated from second loop(for(int j = 0; j
			// < titleList.size(); j++)) to enhance the download speed!
			for (int k = 0; k < titleList.size(); k++) {
				sheet.autoSizeColumn((short) k);// cell width auto r	esize
				sheet.setColumnWidth(k, (sheet.getColumnWidth(k)) + 512); // 자동조정 후 잘리는 부분조정
			}

		}
		
		// 6. 상단 제목(날짜 정보 여부에 따라 등) 추가 셋팅
		//
		if(titleDateList!= null && !titleDateList.isEmpty()){
			sheet.createRow(titleDateRow);
			for (int i = 0; i < titleDateList.size(); i++) {
				sheet.getRow(titleDateRow).createCell(i);
				cell = sheet.getRow(titleDateRow).getCell(i);
				cell.setCellValue(titleDateList.get(i).toString());
				cell.setCellStyle(titleCellStyle);
			}
			if(sheetName.equals("적재현황조회")){
				sheet.addMergedRegion(new CellRangeAddress(titleDateRow, titleDateRow+1, 0, 0));
				sheet.addMergedRegion(new CellRangeAddress(titleDateRow, titleDateRow+1, 1, 1));
				for (int i = 0; i < titleDateList.size(); i++) {
					if(titleDateList.get(i).toString().contains("merge")){
						sheet.addMergedRegion(new CellRangeAddress(titleDateRow, titleDateRow, i-1, i));
					}
				}
			}
		}
		
	}

}