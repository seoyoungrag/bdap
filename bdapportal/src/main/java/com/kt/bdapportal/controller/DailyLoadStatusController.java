package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.DateUtil;
import com.kt.bdapportal.common.util.RequestUtil;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtTblChkStat;
import com.kt.bdapportal.domain.MgmtTblStat;
import com.kt.bdapportal.service.MgmtTblChkStatService;
import com.kt.bdapportal.service.MgmtTblStatService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class DailyLoadStatusController {

	@Autowired
	private MgmtTblStatService mgmtTblStatService;
	
	@Autowired
	private MgmtTblChkStatService mgmgTblChkStatService;
	
	@RequestMapping("/dailyloadstatus.do")					 
	public ModelAndView dailyloadstatus(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("dailyloadstatus");
		
		try{
		
			request.setCharacterEncoding("UTF-8");
			
			String searchWord = (String)request.getParameter("schema");				//searchWord
			String startDate = (String)request.getParameter("startDate");				//searchWord
					
			SearchVO searchVO = new SearchVO();
			
			startDate = searchVO.nullTrim(startDate);
			searchWord = searchVO.nullTrim(searchWord);
			
			searchVO.setSearchWord(searchWord);										
			searchVO.setStartDate(startDate);
			
			mav.addObject("searchVO", searchVO);	
			
			List<MgmtTblStat> mgmtTblStatDbList = mgmtTblStatService.getMgmtTblDbList();
			mav.addObject("mgmtTblStatDbList", mgmtTblStatDbList);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return mav;
		
	}
	
	
	@RequestMapping("/dailyloadstatuslist.do")
	public void dailyloadstatuslist(HttpServletRequest request, HttpServletResponse response) {
		
		try{
			
			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String)request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			SearchVO searchVO = new SearchVO();
			String dbName = searchVO.nullTrim(request.getParameter("searchWord"));
			String startDate = searchVO.nullTrim(request.getParameter("startDate"));	
			
			List<MgmtTblStat> mgmtTblStatDbList = new ArrayList<MgmtTblStat>();
			
			if(dbName.equals("")){															
				mgmtTblStatDbList = mgmtTblStatService.getMgmtTblDbList();
				if(!mgmtTblStatDbList.isEmpty()){
					dbName = mgmtTblStatDbList.get(0).getDbName();
				}
			}
			if(startDate.equals("")){
				startDate = DateUtil.getDateWithFormat(DateUtil.FORMAT_WITH_HYPEN, DateUtil.NOW);
			}else{
				 startDate = startDate.replaceAll("\\/", "-");;
			}
			
			List<Map<String,String>> statMap = mgmtTblStatService.getDailyMgmtTblStatList(dbName, startDate);
			
			JSONArray jsonArray = new JSONArray();
			
			for(int i = 0; i < statMap.size() ;i++){
				Map<String,String> map = statMap.get(i);
				
				JSONObject jsonObj1 = new JSONObject();
				jsonObj1.put("tblNm", map.get("tbl_name"));
				jsonObj1.put("monthAvg", map.get("monthlyAvg"));
				jsonObj1.put("week", map.get("7daysAgo"));
				jsonObj1.put("yesterday", map.get("1daysAgo"));
				jsonObj1.put("today", map.get("today"));
				jsonObj1.put("monthPercentage", map.get("monthlyDiff"));
				jsonObj1.put("weekPercentage", map.get("7daysAgoPerDiff"));
				jsonObj1.put("dayPercentage", map.get("1daysAgoPerDiff"));
				jsonObj1.put("chkNull", map.get("nullCheck"));
				jsonObj1.put("chkType", map.get("typeCheck"));
				
				jsonArray.add(jsonObj1);
			}
			
			jsonObj.put("rows", jsonArray);
			
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	


	@RequestMapping("/dailyloadstatusListExcel.do")				 
	public ModelAndView excepExport(HttpServletRequest request, HttpServletResponse response) {
		  HashMap<String, Object> paraMap = new RequestUtil().getParameterMap(request);
		  HashMap<String, Object> resultMap = new HashMap<String, Object>();
		  try {
		   //1. Excel sheet name
		   String sheetName = "적재현황조회";
		   String sheetStyle = "normal";
		   
		   //2. Excel sheet title(목록)
		   String columnStr = (String) paraMap.get("columns");
		   columnStr = columnStr.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\"", "");
		   List<String> title = Arrays.asList(columnStr.split("\\s*,\\s*"));
		   List<String> titleDate = new ArrayList<String>();
		   
		   //3. Excel data 조회
			String colNamesArr = (String)request.getParameter("colNamesArr");
			int colNamesArrlen = Integer.parseInt(colNamesArr); 

			String dbName = (String)request.getParameter("searchWord");
			String searchType = (String)request.getParameter("searchType");				
			String startDate = (String)request.getParameter("startDate");				
			String endDate = (String)request.getParameter("endDate");	

			List<MgmtTblStat> mgmtTblStatDbList = new ArrayList<MgmtTblStat>();
			SearchVO searchVO = new SearchVO();
			
			if(dbName == null || dbName.equals("")){															
				mgmtTblStatDbList = mgmtTblStatService.getMgmtTblDbList();
				if(!mgmtTblStatDbList.isEmpty()){
					dbName = mgmtTblStatDbList.get(0).getDbName();
				}
			}

			searchVO.setSearchWord(dbName);		
			searchVO.setStartDate(startDate);
			
			List<MgmtTblStat> mgmtTblStatList = new ArrayList<MgmtTblStat>();
			mgmtTblStatList = mgmtTblStatService.getMgmtTblDailyLoadStatusList(dbName,searchVO);							
			List<MgmtTblStat> mgmtTblMonthAvgList = new ArrayList<MgmtTblStat>();
			mgmtTblMonthAvgList = mgmtTblStatService.getMgmtTblMonthAvgLoadList(dbName,searchVO);

			List<List<String>> valueList = new ArrayList<List<String>>();
			
			for(int i = 0; i < mgmtTblStatList.size() ;i++){
				List<String> values = new ArrayList<String>();
				MgmtTblStat mgmtTblStat = mgmtTblStatList.get(i);
				MgmtTblStat mgmtTblMonthAvg = mgmtTblMonthAvgList.get(i);
				
				String tblNm = mgmtTblStat.getTblName();
				values.add(tblNm);
				values.add(String.valueOf(mgmtTblMonthAvg.getTblSize()/30));
				String[] loadSizeNotInit = mgmtTblStat.getParamKey().split("\\,");
				String[] loadSize = new String[3];
				loadSize[0] = loadSizeNotInit.length>0? loadSizeNotInit[0] : "0";
				loadSize[1] = loadSizeNotInit.length>1? loadSizeNotInit[1] : "0";
				loadSize[2] = loadSizeNotInit.length>2? loadSizeNotInit[2] : "0";
				values.add(loadSize[0]);
				values.add(loadSize[1]);
				values.add(loadSize[2]);
				
				float monthPercentage = (Float.valueOf(loadSize[2])-Float.valueOf(mgmtTblMonthAvg.getTblSize()/30))/Float.valueOf(mgmtTblMonthAvg.getTblSize()/30)*100;
				values.add(String.format("%.2f",monthPercentage));
			
				float weekPercentage = (Float.valueOf(loadSize[2])-Float.valueOf(loadSize[0]))/Float.valueOf(loadSize[0])*100;
				values.add(String.format("%.2f",weekPercentage));
				
				float dayPercentage = (Float.valueOf(loadSize[2])-Float.valueOf(loadSize[1]))/Float.valueOf(loadSize[1])*100;
				values.add(String.format("%.2f",dayPercentage));
				
				List<MgmtTblChkStat> mgmtTblChkStatList = mgmgTblChkStatService.getMgmtTblChkStatList(tblNm);
				String chk = "FINISH";
				String chkType = "null";
				for(int j = 0; j < mgmtTblChkStatList.size(); j++){
					MgmtTblChkStat mgmtTblChkStat = mgmtTblChkStatList.get(j);
					if(mgmtTblChkStat.getTblChkType().equals("TYPE")){						
						chkType = "type";
					}
					if(mgmtTblChkStat.getQryResult().contains("FAIL")){
						chk = "FAILED";
						break;								
					}
				}
				if(chkType.equals("null")){
					values.add(chk);
					values.add("");
				}else{
					values.add(chk);
					values.add("");
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
			    	map.put(title.get(j)+titleDate.get(j), values.get(j));
			   }
			    excelList.add(map);
		   }
		   
		   //5. HashMap에 담아 ModelAndView 리턴할 때 모두 함께 담아서 보냄
		   resultMap.put("sheetNm", sheetName);
		   resultMap.put("sheetSt", sheetStyle);
		   resultMap.put("Title", title);
		   resultMap.put("titleDate", titleDate);
		   resultMap.put("ListExcelDown", excelList);
		   
		  } catch(Exception e) {
		   e.printStackTrace();
		  }
		   
		  return new ModelAndView("ExcelDownView","ListExcelDownMap" ,resultMap);
	}
	
	
	
	
}
