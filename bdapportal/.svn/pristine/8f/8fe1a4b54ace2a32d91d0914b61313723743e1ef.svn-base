package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapCol;
import com.kt.bdapportal.domain.BdapTbl;
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
			String userId = (String)session.getAttribute("USER_ID");
			request.setCharacterEncoding("UTF-8");
			
			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String)request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int rows = Integer.parseInt((String)request.getParameter("rows"));
			
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
			searchVO.setUserId(userId);
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
		
			BdapTbl bdapTbl = new BdapTbl();
			List<BdapCol> bdapColList = new ArrayList<BdapCol>();
			long colListCount = 0L;
			
			if(searchType != null && (searchType.equals("tblKorNm") || searchType.equals("tblEngNm")) && !searchWord.equals("")){
				bdapTbl = tblService.getSchemaByTblNm(userId,searchVO,startNum, rows);
				if(bdapTbl != null){
					bdapColList = colService.getBdapColList(bdapTbl.getTblId(), startNum, rows);
					 colListCount = colService.getColCount(bdapTbl.getTblId());	
				}
				 
			}else if(searchType != null && (searchType.equals("colKorNm") || searchType.equals("colEngNm") || searchType.equals("desc")) && !searchWord.equals("")){
				bdapTbl = tblService.getSchema(searchVO,tblId,startNum, rows);
				 bdapColList = colService.getBdapColListByColNm(bdapTbl.getTblId(),searchVO, startNum, rows);
				 colListCount = colService.getColCountByColNm(bdapTbl.getTblId(),searchVO);
				 
			}else{
				bdapTbl = tblService.getSchema(searchVO,tblId,startNum, rows);
				bdapColList = colService.getBdapColList(tblId, startNum, rows);
				colListCount = colService.getColCount(tblId);
			}
		
			int colListSize = bdapColList.size();
			JSONArray jsonArray = new JSONArray();
		
			if(bdapColList.size()>0){
				for(int i = 0; i < colListSize;i++){
					JSONObject jsonObj1 = new JSONObject();
					
					BdapCol bdapCol = bdapColList.get(i);
					
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
