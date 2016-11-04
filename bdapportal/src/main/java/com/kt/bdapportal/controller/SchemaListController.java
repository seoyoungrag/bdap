package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.RequestUtil;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapCol;
import com.kt.bdapportal.domain.BdapTbl;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.service.BdapColService;
import com.kt.bdapportal.service.TblService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class SchemaListController {

	
	@Autowired
	private TblService tblService;
	
	@Autowired
	private BdapColService colService;
	
	@RequestMapping("/schemaList.do")						 
	public ModelAndView schemaList(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/list/schemaList");
		try{
			
			request.setCharacterEncoding("UTF-8");
	
			String searchType = (String)request.getParameter("searchType");				//searchType
			String searchWord = (String)request.getParameter("searchWord");				//searchWord
			
			String tblId = (String)request.getParameter("tblId");
			
			if(tblId == null){
				tblId = "";
			}
			
			SearchVO searchVO = new SearchVO();
			searchType = searchVO.nullTrim(searchType);
			searchWord = searchVO.nullTrim(searchWord);
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
			
			
			List<BdapTbl> bdapTblTree = tblService.getTblTree();
			mav.addObject("bdapTblTree", bdapTblTree);
			mav.addObject("tblId", tblId);
			mav.addObject("searchVO", searchVO);
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			
		}
		
		return mav;
		
	}
	
	
	
	@RequestMapping("/getSchemaList.do")
	public void getSchemaList(HttpServletRequest request, HttpServletResponse response) {
		
		try{
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			request.setCharacterEncoding("UTF-8");
			
			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String)request.getParameter("page")==null?"1":(String)request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int rows = Integer.parseInt((String)request.getParameter("rows")==null?"15":(String)request.getParameter("rows"));
			
			String searchType = (String)request.getParameter("searchType");				//searchType
			String searchWord = (String)request.getParameter("searchWord");				//searchWord
				
			String tblId = (String)request.getParameter("tblId");
			String selectTblId = (String)request.getParameter("selectTblId");
			
			List<BdapTbl> bdapTblTree = new ArrayList<BdapTbl>(); 
			
			if(selectTblId != null && selectTblId != ""){
				tblId = selectTblId;
			}else{
				if(tblId == null || tblId.equals("")){
					bdapTblTree = tblService.getTblTree();
					String[] tblIdArr = bdapTblTree.get(0).getTblId().split("\\,"); 
					tblId = tblIdArr[0];
				}
			}
			
			int startNum = (page-1)*rows;
			SearchVO searchVO = new SearchVO();
			searchVO.setUserId(bdapUser.getUserId());
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
		
			BdapTbl bdapTbl = new BdapTbl();
			List<BdapCol> bdapColList = new ArrayList<BdapCol>();
			long colListCount = 0L;
			
			if(searchType != null && (searchType.equals("tblKorNm") || searchType.equals("tblEngNm")) && !searchWord.equals("")){
				//전체 스키마 안에서 테이블 리스트를 조회할 수도 있음.
				List<BdapTbl> bdapTblList = new ArrayList<BdapTbl>();
				bdapTblList = tblService.getTblListByTblNm(searchVO,startNum, rows);
				for(BdapTbl tbl : bdapTblList){
					bdapColList.addAll(colService.getBdapColList(tbl.getTblId(), startNum, rows));
					colListCount += colService.getColCount(tbl.getTblId());
				}
			}else if(searchType != null && (searchType.equals("colKorNm") || searchType.equals("colEngNm") || searchType.equals("desc")) && !searchWord.equals("")){
				 bdapTbl = tblService.getSchema(tblId);
				 bdapColList = colService.getBdapColListByColNm(bdapTbl.getTblId(),searchVO, startNum, rows);
				 colListCount = colService.getColCountByColNm(bdapTbl.getTblId(),searchVO);
				 
			}else{
				bdapTbl = tblService.getSchema(tblId);
				bdapColList = colService.getBdapColList(tblId, startNum, rows);
				colListCount = colService.getColCount(tblId);
			}
		
			int colListSize = bdapColList.size();
			JSONArray jsonArray = new JSONArray();
		
			if(bdapColList.size()>0){
				for(int i = 0; i < colListSize;i++){
					JSONObject jsonObj1 = new JSONObject();
					
					BdapCol bdapCol = bdapColList.get(i);
					
					if(searchType != null && (searchType.equals("colKorNm") || searchType.equals("colEngNm") || searchType.equals("desc") || searchType.equals("tblKorNm") || searchType.equals("tblEngNm")) && !searchWord.equals("")){
						bdapTbl = tblService.getSchema(bdapCol.getColTblId());
					}
					jsonObj1.put("system", bdapTbl.getTblDbNm());
					jsonObj1.put("schema", bdapTbl.getTblDbNm());
			   		
					jsonObj1.put("tblEngNm", bdapTbl.getTblEngNM());
					jsonObj1.put("tblKorNm", bdapTbl.getTblKorNm());
					jsonObj1.put("colEngNm", bdapCol.getColEngNm());
					jsonObj1.put("colKorNm", bdapCol.getColKorNm());
					jsonObj1.put("desc", bdapCol.getColDesc());
					jsonObj1.put("colType", bdapCol.getColDataType());
					/*jsonObj1.put("length", bdapCol.getcol);*/
					jsonObj1.put("pk", bdapTbl.getTblId());
					jsonObj1.put("order", bdapCol.getColOrderNum());
					jsonArray.add(jsonObj1);
				}
			}
			int forLastPage = (colListCount % rows > 0)? 1:0;
			jsonObj.put("rows", jsonArray);
			jsonObj.put("records", colListCount);
			jsonObj.put("total", (colListCount/rows)+forLastPage) ;
			jsonObj.put("tblId", tblId);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
	

	@RequestMapping("/schemaListExcel.do")				 
	public ModelAndView excepExport(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
		
		  HashMap<String, Object> paraMap = new RequestUtil().getParameterMap(request);
		  HashMap<String, Object> resultMap = new HashMap<String, Object>();
		  try {
		   //1. Excel sheet name
		   String sheetName = "스키마리스트";
		   String sheetStyle = "normal";
		   
		   //2. Excel sheet title(목록)
		   String columnStr = (String) paraMap.get("columns");
		   columnStr = columnStr.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\"", "");
		   List<String> title = Arrays.asList(columnStr.split("\\s*,\\s*"));
		   
		   //3. Excel data 조회
			SearchVO searchVO = new SearchVO();

			String searchType = searchVO.nullTrim(request.getParameter("searchType"));				
			String searchWord = searchVO.nullTrim(request.getParameter("searchWord"));			
			String tblId = searchVO.nullTrim(request.getParameter("tblId"));
			String selectTblId = searchVO.nullTrim(request.getParameter("selectTblId"));
			
			List<BdapTbl> bdapTblTree = new ArrayList<BdapTbl>(); 
			
			if(selectTblId != null && selectTblId != ""){
				tblId = selectTblId;
			}else{
				if(tblId == null || tblId.equals("")){
					bdapTblTree = tblService.getTblTree();
					String[] tblIdArr = bdapTblTree.get(0).getTblId().split("\\,"); 
					tblId = tblIdArr[0];
				}
			}
			
			searchVO.setUserId(bdapUser.getUserId());
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
		
			BdapTbl bdapTbl = new BdapTbl();
			List<BdapCol> bdapColList = new ArrayList<BdapCol>();
			
			if(searchType != null && (searchType.equals("tblKorNm") || searchType.equals("tblEngNm")) && !searchWord.equals("")){
				bdapTbl = tblService.getSchemaByTblNm(bdapUser.getUserId(),searchVO);
				if(bdapTbl != null){
					bdapColList = colService.getBdapColListByTblId(bdapTbl.getTblId());
				}
				 
			}else if(searchType != null && (searchType.equals("colKorNm") || searchType.equals("colEngNm") || searchType.equals("desc")) && !searchWord.equals("")){
				bdapTbl = tblService.getSchemaListByTblId(searchVO,tblId);
				 bdapColList = colService.getBdapColListByColNm(bdapTbl.getTblId(),searchVO);
				 
			}else{
				bdapTbl = tblService.getSchemaListByTblId(searchVO,tblId);
				bdapColList = colService.getBdapColListByTblId(tblId);
			}
		
			int colListSize = bdapColList.size();
			List<List<String>> valueList = new ArrayList<List<String>>();
		
			if(bdapColList.size()>0){
				for(int i = 0; i < colListSize;i++){
					List<String> value = new ArrayList<String>();
					
					BdapCol bdapCol = bdapColList.get(i);

					value.add(String.valueOf(bdapCol.getColOrderNum()));
					value.add(bdapTbl.getTblDbNm());
					value.add(bdapTbl.getTblEngNM());
					value.add(bdapTbl.getTblKorNm());
					value.add(bdapCol.getColEngNm());
					value.add(bdapCol.getColKorNm());
					value.add(bdapCol.getColDesc());
					value.add(bdapCol.getColDataType());
					valueList.add(value);
				}
			}
			
		   //4. ExcelDownView로 데이터를 넘겨주기 위한 작업
		   Map map;
		   List excelList = new ArrayList();
		   for(int i = 0; i < valueList.size(); i++)
		   {
			    //title의 목록과 동일하게 구성
			   map = new HashMap();
			   List<String> values = valueList.get(i);
			   for(int j = 0 ; j < values.size(); j++){
			    	map.put(title.get(j), values.get(j));
			   }
			    excelList.add(map);
		   }
		   
		   //5. HashMap에 담아 ModelAndView 리턴할 때 모두 함께 담아서 보냄
		   resultMap.put("sheetNm", sheetName);
		   resultMap.put("sheetSt", sheetStyle);
		   resultMap.put("Title", title);
		   resultMap.put("ListExcelDown", excelList);
		   
		  } catch(Exception e) {
		   e.printStackTrace();
		  }
		   
		  return new ModelAndView("ExcelDownView","ListExcelDownMap" ,resultMap);
	}
	
	
}
