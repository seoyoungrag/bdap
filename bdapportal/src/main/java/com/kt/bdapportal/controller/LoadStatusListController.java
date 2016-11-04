package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.RequestUtil;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtTblStat;
import com.kt.bdapportal.service.MgmtTblStatService;
import com.kt.bdapportal.service.TblService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class LoadStatusListController {
	@Autowired
	private TblService tblService;
	
	@Autowired
	private MgmtTblStatService mgmtTblStatService;
	
	
	
	@RequestMapping("/loadStatusList.do")				//data meta system 적재현황 조회	 
	public ModelAndView loadStatusList(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/list/loadStatusList");
		try{
			
			request.setCharacterEncoding("UTF-8");
	
			String searchWord = (String)request.getParameter("schema");				
			String searchType = (String)request.getParameter("searchType");				
			String startDate = (String)request.getParameter("startDate");				
			String endDate = (String)request.getParameter("endDate");		
			
			
			SearchVO searchVO = new SearchVO();
			
			startDate = searchVO.nullTrim(startDate);
			endDate = searchVO.nullTrim(endDate);
			searchType = searchVO.nullTrim(searchType);
			searchWord = searchVO.nullTrim(searchWord);
			
			searchVO.setSearchWord(searchWord);										
			searchVO.setStartDate(startDate);
			searchVO.setEndDate(endDate);
			searchVO.setSearchType(searchType);
			
			mav.addObject("searchVO", searchVO);								
			
			List<String> tblList = tblService.getSchemaList(true, "");// 관리자용 전체 리스트를 불러오면 된다.
			mav.addObject("tblList", tblList);
			
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			
		}
		
		return mav;
		
	}
	

	@RequestMapping("/getLoadStatusList.do")
	public void getLoadStatusList(HttpServletRequest request, HttpServletResponse response) {
		try{
			request.setCharacterEncoding("UTF-8");
			
			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String)request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String)request.getParameter("rows"));
			
			JSONArray jsonArray = new JSONArray();
			
			String colNamesArr = (String)request.getParameter("colNamesArr");
			int colNamesArrlen = Integer.parseInt(colNamesArr); 
			
			SearchVO searchVO = new SearchVO();
			String dbName = searchVO.nullTrim((String)request.getParameter("searchWord"));
			String searchType = (String)request.getParameter("searchType");				//searchType
			String startDate = (String)request.getParameter("startDate");				//searchWord
			String endDate = (String)request.getParameter("endDate");	
			
			searchVO.setSearchWord(dbName);									
			searchVO.setStartDate(startDate);
			searchVO.setEndDate(endDate);
			searchVO.setSearchType(searchType);
			
			List<MgmtTblStat> mgmtTblStatList = new ArrayList<MgmtTblStat>();

			Set ymdSet = new HashSet<String>();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

			Calendar calendar = Calendar.getInstance();
			if(searchVO.getStartDate().equals("") || searchVO.getEndDate().equals("")){
				calendar.add(Calendar.DATE, -7);
				startDate = transFormat.format(calendar.getTime());
				searchVO.setStartDate(startDate);
				calendar.add(Calendar.DATE, 6);
				endDate = transFormat.format(calendar.getTime());
				searchVO.setEndDate(endDate);
			}else{
				startDate = searchVO.getStartDate().replaceAll("/", "-");
				endDate = searchVO.getEndDate().replaceAll("/", "-");
				searchVO.setStartDate(startDate);
				searchVO.setEndDate(endDate);
			}
			
			mgmtTblStatList = mgmtTblStatService.getMgmtTblLoadStatusList(searchVO);

			for(MgmtTblStat s : mgmtTblStatList){
				ymdSet.add(transFormat.parse(s.getEtlYmd()));
			}

			List<Date> ymdList = new ArrayList<Date>();
			ymdList.addAll(ymdSet);
			
			calendar.setTime(transFormat.parse(endDate));
			calendar.add(Calendar.DATE, 1);
			String compareEndDate = transFormat.format(calendar.getTime());
			Date tempDate = transFormat.parse(startDate);
			calendar.setTime(tempDate);
			String tempString = transFormat.format(tempDate);
			
			for(int i = 0 ; !tempString.equals(compareEndDate); i ++){
				boolean isThere = false;
				for(int j = 0 ; j < ymdList.size() ; j ++){
					tempDate = transFormat.parse(tempString);
					if(ymdList.get(j).equals(tempDate)){
						isThere = true;
						break;
					}
				}
				if(!isThere){
					ymdList.add(tempDate);
				}
				calendar.add(Calendar.DATE, 1);
				tempString = transFormat.format(calendar.getTime());
			}

			Collections.sort(ymdList, Collections.reverseOrder());

			JSONArray jsonArr = new JSONArray();
			if(mgmtTblStatList != null && mgmtTblStatList.size() > 0){
				List<MgmtTblStat> compare = new ArrayList<MgmtTblStat>();

				for(int i = 0 ; i < mgmtTblStatList.size() ; i++){
					boolean isThere = false;;
					for(int j = 0 ; j < compare.size() ; j ++){
						if(mgmtTblStatList.get(i).getDbName().equals(compare.get(j).getDbName()) && mgmtTblStatList.get(i).getTblName().equals(compare.get(j).getTblName() )){
							isThere = true;
						}
					}
					if(!isThere){
						compare.add(mgmtTblStatList.get(i));
					}
				}
				
				for(int i = 0 ; i < compare.size() ; i++){
					MgmtTblStat t = compare.get(i);
					JSONObject jsonOb = new JSONObject();
					for(int j = 0 ; j < ymdList.size()+2 ; j ++){
						if(j == 0){
							jsonOb.put(j, t.getDbName());
							continue;
						}else if(j==1){
							jsonOb.put(j, t.getTblName());
							continue;
						}
						String date = "";
						date = transFormat.format(ymdList.get(j-2));
						boolean isThere = false;
						for(MgmtTblStat x : mgmtTblStatList){
							if(x.getDbName().equals(t.getDbName()) && x.getTblName().equals(t.getTblName()) && x.getEtlYmd().equals(date)){
								isThere = true;
								if(searchType.equals("")||searchType.equals("all")){
									jsonOb.put(String.valueOf((j*2)-2),x.getTblSize());	
									jsonOb.put(String.valueOf((j*2+1)-2), x.getTblCnt());
									break;
								}else if(searchType.equals("size")){
									jsonOb.put(String.valueOf(j),x.getTblSize());
									break;
								}else if(searchType.equals("count")){
									jsonOb.put(String.valueOf(j), x.getTblCnt());
									break;
								}
							}
						}
						if(!isThere && j!=0 && j!=1){
							if(searchType.equals("")||searchType.equals("all")){
								jsonOb.put(String.valueOf((j*2)-2),0 );	
								jsonOb.put(String.valueOf((j*2+1)-2), 0);
							}else if(searchType.equals("size")){
								jsonOb.put(String.valueOf(j),0);	
							}else if(searchType.equals("count")){
								jsonOb.put(String.valueOf(j), 0);
							}
						}
					}
					jsonArr.add(jsonOb);
				}
			}
			jsonObj.put("rows", jsonArr);
			
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
	

	@RequestMapping("/loadStatusListExcel.do")				 
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
		   /*
		   List<String> title = new ArrayList<String>();
		   title.add("스키마");
		   title.add("테이블명");
		   */
		   
		   //3. Excel data 조회
			String colNamesArr = (String)request.getParameter("colNamesArr");
			int colNamesArrlen = Integer.parseInt(colNamesArr); 
			
			SearchVO searchVO = new SearchVO();
			String dbName = searchVO.nullTrim((String)request.getParameter("searchWord"));
			String searchType = (String)request.getParameter("searchType");				//searchType
			String startDate = (String)request.getParameter("startDate");				//searchWord
			String endDate = (String)request.getParameter("endDate");	

			searchVO.setSearchWord(dbName);									
			searchVO.setStartDate(startDate);
			searchVO.setEndDate(endDate);
			searchVO.setSearchType(searchType);

			List<MgmtTblStat> mgmtTblStatList = new ArrayList<MgmtTblStat>();

			Set ymdSet = new HashSet<String>();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

			Calendar calendar = Calendar.getInstance();
			if(searchVO.getStartDate().equals("") || searchVO.getEndDate().equals("")){
				calendar.add(Calendar.DATE, -7);
				startDate = transFormat.format(calendar.getTime());
				searchVO.setStartDate(startDate);
				calendar.add(Calendar.DATE, 6);
				endDate = transFormat.format(calendar.getTime());
				searchVO.setEndDate(endDate);
			}else{
				startDate = searchVO.getStartDate().replaceAll("/", "-");
				endDate = searchVO.getEndDate().replaceAll("/", "-");
				searchVO.setStartDate(startDate);
				searchVO.setEndDate(endDate);
			}
			
			mgmtTblStatList = mgmtTblStatService.getMgmtTblLoadStatusList(searchVO);

			for(MgmtTblStat s : mgmtTblStatList){
				ymdSet.add(transFormat.parse(s.getEtlYmd()));
			}

			List<Date> ymdList = new ArrayList<Date>();
			ymdList.addAll(ymdSet);
			
			calendar.setTime(transFormat.parse(endDate));
			calendar.add(Calendar.DATE, 1);
			String compareEndDate = transFormat.format(calendar.getTime());
			Date tempDate = transFormat.parse(startDate);
			calendar.setTime(tempDate);
			String tempString = transFormat.format(tempDate);
			
			for(int i = 0 ; !tempString.equals(compareEndDate); i ++){
				boolean isThere = false;
				for(int j = 0 ; j < ymdList.size() ; j ++){
					tempDate = transFormat.parse(tempString);
					if(ymdList.get(j).equals(tempDate)){
						isThere = true;
						break;
					}
				}
				if(!isThere){
					ymdList.add(tempDate);
				}
				calendar.add(Calendar.DATE, 1);
				tempString = transFormat.format(calendar.getTime());
			}

			Collections.sort(ymdList, Collections.reverseOrder());

			List<List<String>> valueList = new ArrayList<List<String>>();
			if(mgmtTblStatList != null && mgmtTblStatList.size() > 0){
				List<MgmtTblStat> compare = new ArrayList<MgmtTblStat>();

				for(int i = 0 ; i < mgmtTblStatList.size() ; i++){
					boolean isThere = false;;
					for(int j = 0 ; j < compare.size() ; j ++){
						if(mgmtTblStatList.get(i).getDbName().equals(compare.get(j).getDbName()) && mgmtTblStatList.get(i).getTblName().equals(compare.get(j).getTblName() )){
							isThere = true;
						}
					}
					if(!isThere){
						compare.add(mgmtTblStatList.get(i));
					}
				}
				
				for(int i = 0 ; i < compare.size() ; i++){
					MgmtTblStat t = compare.get(i);
					List<String> values = new ArrayList<String>();
					for(int j = 0 ; j < ymdList.size()+2 ; j ++){
						if(j == 0){
							values.add(t.getDbName());
							continue;
						}else if(j==1){
							values.add(t.getTblName());
							continue;
						}
						String date = "";
						date = transFormat.format(ymdList.get(j-2));
						boolean isThere = false;
						for(MgmtTblStat x : mgmtTblStatList){
							if(x.getDbName().equals(t.getDbName()) && x.getTblName().equals(t.getTblName()) && x.getEtlYmd().equals(date)){
								isThere = true;
								if(searchType.equals("")||searchType.equals("all")){
									values.add(x.getTblSize()+"");	
									values.add(x.getTblCnt()+"");
									break;
								}else if(searchType.equals("size")){
									values.add(x.getTblSize()+"");
									break;
								}else if(searchType.equals("count")){
									values.add(x.getTblCnt()+"");
									break;
								}
							}
						}
						if(!isThere && j!=0 && j!=1){
							if(searchType.equals("")||searchType.equals("all")){
								values.add("0");	
								values.add("0");
							}else if(searchType.equals("size")){
								values.add("0");	
							}else if(searchType.equals("count")){
								values.add("0");
							}
						}
					}
					valueList.add(values);
				}
			}
			
		   //4. ExcelDownView로 데이터를 넘겨주기 위한 작업

			int idx = 0;
			for(int j = 0; j < colNamesArrlen; j++){
				if(j == 0){
					titleDate.add(title.get(0));
					continue;
				}else if(j == 1){
					titleDate.add(title.get(1));
					continue;
				}
				if(searchType.equals("")||searchType.equals("all")){
					if(j%2 == 0){
						titleDate.add(transFormat.format(ymdList.get(idx++)));
					}else{
						titleDate.add(transFormat.format(ymdList.get(--idx))+"merge");
						idx++;
					}
				}else if(searchType.equals("size")){
					titleDate.add(transFormat.format(ymdList.get(idx++)));
				}else if(searchType.equals("count")){
					titleDate.add(transFormat.format(ymdList.get(idx++)));
				}
			}
			
			
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
			    /*
			    map.put(title.get(0).toString(), list.get(i).getDbName());
			    map.put(title.get(1).toString(), list.get(i).getTblName());
				    for(int j = 2 ; j < list.size(); j++){
						//title.add("적재사이즈");
						//title.add("적재건수");
					    map.put(title.get(j).toString(), list.get(i).getTblSize());
					    map.put(title.get(j).toString(), list.get(i).getTblCnt());
				    }
				*/    
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
