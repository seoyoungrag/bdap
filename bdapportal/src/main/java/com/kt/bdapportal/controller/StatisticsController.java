package com.kt.bdapportal.controller;

import java.io.PrintWriter;
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

import com.kt.bdapportal.common.util.RequestUtil;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtNodeStat;
import com.kt.bdapportal.domain.MgmtUserTblStat;
import com.kt.bdapportal.service.MgmtNodeStatService;
import com.kt.bdapportal.service.MgmtQryHistService;
import com.kt.bdapportal.service.MgmtUserTblStatService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class StatisticsController {

	@Autowired
	private MgmtUserTblStatService mgmtUserTblStatService;

	@Autowired
	private MgmtQryHistService mgmtQryHistService;

	@Autowired
	private MgmtNodeStatService mgmtNodeStatService;

	@RequestMapping("statisticsList.do")
	public ModelAndView statisticsList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/list/statisticsList");

		try {
			request.setCharacterEncoding("UTF-8");

			String searchType = (String) request.getParameter("all"); 
			String searchWord = (String) request.getParameter("userInfo"); 
			String category = (String) request.getParameter("timing"); 

			SearchVO searchVO = new SearchVO();

			searchType = searchVO.nullTrim(searchType);
			searchWord = searchVO.nullTrim(searchWord);
			category = searchVO.nullTrim(category);

			searchVO.setSearchWord(searchWord);
			searchVO.setSearchType(searchType);
			searchVO.setCategory(category);

			mav.addObject("searchVO", searchVO);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping("/getComputingList.do") // COMPUTING 히스토리
	public void getComputingList(HttpServletRequest request, HttpServletResponse response) {
		try {
			String startDate = (String) request.getParameter("startDate");
			String endDate = (String) request.getParameter("endDate");

			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));
			searchVO.setPaging(request);

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("page", String.valueOf(searchVO.getPage()));

			JSONArray jsonArray = new JSONArray();

			List<MgmtNodeStat> list = this.mgmtNodeStatService.computingStat(searchVO);
			Long listCount = this.mgmtNodeStatService.computingStatCount(searchVO);

			for (int i = 0; i < list.size(); i++) {
				MgmtNodeStat mgmtNodeStat = list.get(i);
				JSONObject jsonObj1 = new JSONObject();

				jsonObj1.put("nodeStatId", mgmtNodeStat.getNodeStatId());
				jsonObj1.put("nodeStatCreateDt", mgmtNodeStat.getNodeStatCreateDt());
				jsonObj1.put("nodeStatType", mgmtNodeStat.getNodeStatType());
				jsonObj1.put("nodeStatAvailVal", mgmtNodeStat.getNodeStatAvailVal());
				jsonObj1.put("nodeNm", mgmtNodeStat.getNodeNm());
				jsonObj1.put("nodeStatTotalVal", mgmtNodeStat.getNodeStatTotalVal());
				jsonArray.add(jsonObj1);
			}

			searchVO.setListCount(listCount);
			searchVO.setLastPage();
			jsonObj.put("records", listCount);
			jsonObj.put("total", searchVO.getTotal());
			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/getDiskUsageList.do") // DISK 사용량 통계
	public void getDiskUsageList(HttpServletRequest request, HttpServletResponse response) {
		try {
			String startDate = (String) request.getParameter("startDate");
			String endDate = (String) request.getParameter("endDate");

			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));
			searchVO.setPaging(request);

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("page", String.valueOf(searchVO.getPage()));

			JSONArray jsonArray = new JSONArray();

			List<MgmtUserTblStat> mgmtUserTblStatList = mgmtUserTblStatService.getUserUsage(searchVO);
			Long listCount = this.mgmtUserTblStatService.getUserUsageCount();

			for (int i = 0; i < mgmtUserTblStatList.size(); i++) {
				MgmtUserTblStat mgmtUserTblStat = mgmtUserTblStatList.get(i);
				JSONObject jsonObj1 = new JSONObject();

				jsonObj1.put("userId", mgmtUserTblStat.getOwnerName());
				jsonObj1.put("userName", mgmtUserTblStat.getUserTblStatId());
				jsonObj1.put("statToday", mgmtUserTblStat.getTblType());
				jsonObj1.put("statMinusOne", mgmtUserTblStat.getTblSize());
				jsonObj1.put("statMinusTwo", mgmtUserTblStat.getDbName());
				jsonObj1.put("statMinusThree", mgmtUserTblStat.getTblName());
				jsonArray.add(jsonObj1);
			}

			searchVO.setListCount(listCount);
			searchVO.setLastPage();
			jsonObj.put("records", listCount);
			jsonObj.put("total", searchVO.getTotal());
			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/getQueryUsageList.do") // 관리자 - 통계 - 쿼리히스토리 통계
	public void getQueryUsageList(HttpServletRequest request, HttpServletResponse response) {
		try {
			String startDate = (String) request.getParameter("startDate");
			String endDate = (String) request.getParameter("endDate");

			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));
			searchVO.setPaging(request);

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("page", String.valueOf(searchVO.getPage()));

			JSONArray jsonArray = new JSONArray();

			List<Map<String, String>> queryUsageStat = mgmtQryHistService.getQueryUsageList(searchVO);
			Long listCount = this.mgmtQryHistService.getQueryUsageListCount();

			// for(int i = 0; i < mgmtQryHistList.size() ;i++){
			// MgmtQryHist mgmtQryHistStat = mgmtQryHistList.get(i);
			for (Map<String, String> stat : queryUsageStat) {
				JSONObject jsonObj1 = new JSONObject();
				jsonObj1.put("userId", stat.get("userId"));
				jsonObj1.put("userName", stat.get("userName"));
				jsonObj1.put("statToday", stat.get("statToday"));
				jsonObj1.put("statMinusOne", stat.get("statMinusOne"));
				jsonObj1.put("statMinusTwo", stat.get("statMinusTwo"));
				jsonObj1.put("statMinusThree", stat.get("statMinusThree"));
				jsonArray.add(jsonObj1);
			}

			searchVO.setListCount(listCount);
			searchVO.setLastPage();
			jsonObj.put("records", listCount);
			jsonObj.put("total", searchVO.getTotal());
			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/getComputingListExcel.do")
	public ModelAndView excepExport(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, Object> paraMap = new RequestUtil().getParameterMap(request);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			// 1. Excel sheet name
			String sheetName = "COMPUTING 히스토리";
			String sheetStyle = "normal";

			// 2. Excel sheet title(목록)
			String columnStr = (String) paraMap.get("columns");
			columnStr = columnStr.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\"", "");
			List<String> title = Arrays.asList(columnStr.split("\\s*,\\s*"));

			// 3. Excel data 조회
			

			String startDate = (String) request.getParameter("startDate");
			String endDate = (String) request.getParameter("endDate");

			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));

			List<MgmtNodeStat> list = this.mgmtNodeStatService.computingStatAllUser(searchVO);

			List<List<Object>> valueList = new ArrayList<List<Object>>();
			for (int i = 0; i < list.size(); i++) {
				List<Object> strList = new ArrayList<Object>();
				MgmtNodeStat mgmtNodeStat = list.get(i);

				strList.add(mgmtNodeStat.getNodeNm());
				strList.add(mgmtNodeStat.getNodeStatCreateDt());
				strList.add(mgmtNodeStat.getNodeStatAvailVal());
				strList.add(mgmtNodeStat.getNodeStatTotalVal());

				valueList.add(strList);
			}

			// 4. ExcelDownView로 데이터를 넘겨주기 위한 작업
			Map map;
			List excelList = new ArrayList();
			for (int i = 0; i < valueList.size(); i++) {
				// title의 목록과 동일하게 구성
				map = new HashMap();
				List<Object> values = valueList.get(i);
				for (int j = 0; j < values.size(); j++) {
					map.put(title.get(j), values.get(j).toString());
				}
				excelList.add(map);
			}

			// 5. HashMap에 담아 ModelAndView 리턴할 때 모두 함께 담아서 보냄
			resultMap.put("sheetNm", sheetName);
			resultMap.put("sheetSt", sheetStyle);
			resultMap.put("Title", title);
			resultMap.put("ListExcelDown", excelList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("ExcelDownView", "ListExcelDownMap", resultMap);
	}
	

	@RequestMapping("/getDiskUsageListExcel.do")
	public ModelAndView getDiskUsageListExcel(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, Object> paraMap = new RequestUtil().getParameterMap(request);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			// 1. Excel sheet name
			String sheetName = "DISK 통계";
			String sheetStyle = "normal";

			// 2. Excel sheet title(목록)
			String columnStr = (String) paraMap.get("columns");
			columnStr = columnStr.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\"", "");
			List<String> title = Arrays.asList(columnStr.split("\\s*,\\s*"));

			// 3. Excel data 조회
			
			String startDate = (String) request.getParameter("startDate");
			String endDate = (String) request.getParameter("endDate");

			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));
			
			List<MgmtUserTblStat> mgmtUserTblStatList = mgmtUserTblStatService.getUserUsageAlluser(searchVO);

			List<List<Object>> valueList = new ArrayList<List<Object>>();
			for (MgmtUserTblStat stat :  mgmtUserTblStatList) {
				List<Object> strList = new ArrayList<Object>();

				strList.add(stat.getOwnerName());
				strList.add(stat.getUserTblStatId());
				strList.add(stat.getTblType());
				strList.add(stat.getTblSize());
				strList.add(stat.getDbName());
				strList.add(stat.getTblName());
				valueList.add(strList);
			}

			// 4. ExcelDownView로 데이터를 넘겨주기 위한 작업
			Map map;
			List excelList = new ArrayList();
			for (int i = 0; i < valueList.size(); i++) {
				// title의 목록과 동일하게 구성
				map = new HashMap();
				List<Object> values = valueList.get(i);
				for (int j = 0; j < values.size(); j++) {
					map.put(title.get(j), values.get(j).toString());
				}
				excelList.add(map);
			}

			// 5. HashMap에 담아 ModelAndView 리턴할 때 모두 함께 담아서 보냄
			resultMap.put("sheetNm", sheetName);
			resultMap.put("sheetSt", sheetStyle);
			resultMap.put("Title", title);
			resultMap.put("ListExcelDown", excelList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("ExcelDownView", "ListExcelDownMap", resultMap);
	}

	@RequestMapping("/getQueryUsageListExcel.do")
	public ModelAndView getQueryUsageListExcel(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, Object> paraMap = new RequestUtil().getParameterMap(request);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			// 1. Excel sheet name
			String sheetName = "QUERY 통계";
			String sheetStyle = "normal";

			// 2. Excel sheet title(목록)
			String columnStr = (String) paraMap.get("columns");
			columnStr = columnStr.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\"", "");
			List<String> title = Arrays.asList(columnStr.split("\\s*,\\s*"));

			// 3. Excel data 조회
			
			String startDate = (String) request.getParameter("startDate");
			String endDate = (String) request.getParameter("endDate");

			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));

			List<Map<String, String>> queryUsageStat = mgmtQryHistService.getQueryUsageListAll(searchVO);

			// for(int i = 0; i < mgmtQryHistList.size() ;i++){
			// MgmtQryHist mgmtQryHistStat = mgmtQryHistList.get(i);
			List<List<Object>> valueList = new ArrayList<List<Object>>();
			for (Map<String, String> stat : queryUsageStat) {
				List<Object> strList = new ArrayList<Object>();
				
				strList.add(stat.get("userId"));
				strList.add(stat.get("userName"));
				strList.add(stat.get("statToday"));
				strList.add(stat.get("statMinusOne"));
				strList.add(stat.get("statMinusTwo"));
				strList.add(stat.get("statMinusThree"));
				
				valueList.add(strList);
			}

			// 4. ExcelDownView로 데이터를 넘겨주기 위한 작업
			Map map;
			List excelList = new ArrayList();
			for (int i = 0; i < valueList.size(); i++) {
				// title의 목록과 동일하게 구성
				map = new HashMap();
				List<Object> values = valueList.get(i);
				for (int j = 0; j < values.size(); j++) {
					map.put(title.get(j), values.get(j).toString());
				}
				excelList.add(map);
			}

			// 5. HashMap에 담아 ModelAndView 리턴할 때 모두 함께 담아서 보냄
			resultMap.put("sheetNm", sheetName);
			resultMap.put("sheetSt", sheetStyle);
			resultMap.put("Title", title);
			resultMap.put("ListExcelDown", excelList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("ExcelDownView", "ListExcelDownMap", resultMap);
	}
	
}
