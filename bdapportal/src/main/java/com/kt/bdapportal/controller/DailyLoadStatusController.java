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

import com.kt.bdapportal.common.util.DateUtil;
import com.kt.bdapportal.common.util.RequestUtil;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtTblStat;
import com.kt.bdapportal.service.MgmtTblStatService;
import com.kt.bdapportal.service.TblService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class DailyLoadStatusController {
	@Autowired
	private TblService tblService;
	
	@Autowired
	private MgmtTblStatService mgmtTblStatService;

	@RequestMapping("/dailyloadstatus.do")
	public ModelAndView dailyloadstatus(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("dailyloadstatus");

		try {

			request.setCharacterEncoding("UTF-8");

			String searchWord = (String) request.getParameter("schema"); // searchWord
			String startDate = (String) request.getParameter("startDate"); // searchWord

			SearchVO searchVO = new SearchVO();

			startDate = searchVO.nullTrim(startDate);
			searchWord = searchVO.nullTrim(searchWord);

			searchVO.setSearchWord(searchWord);
			searchVO.setStartDate(startDate);

			mav.addObject("searchVO", searchVO);

			List<String> tblList = tblService.getSchemaList(true, "");// 관리자용 전체 리스트를 불러오면 된다.
			mav.addObject("tblList", tblList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;

	}

	@RequestMapping("/dailyloadstatuslist.do")
	public void dailyloadstatuslist(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			SearchVO searchVO = new SearchVO();
			String dbName = searchVO.nullTrim(request.getParameter("searchWord"));
			String startDate = searchVO.nullTrim(request.getParameter("startDate"));

			if (startDate.equals("")) {
				startDate = DateUtil.getDateWithFormat(DateUtil.FORMAT_WITH_HYPEN, DateUtil.NOW);
			} else {
				startDate = startDate.replaceAll("\\/", "-");
				;
			}

			List<Map<String, String>> statMap = mgmtTblStatService.getDailyMgmtTblStatList(dbName, startDate);

			JSONArray jsonArray = new JSONArray();

			for (int i = 0; i < statMap.size(); i++) {
				Map<String, String> map = statMap.get(i);

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
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/dailyloadstatusListExcel.do")
	public ModelAndView excepExport(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, Object> paraMap = new RequestUtil().getParameterMap(request);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			// 1. Excel sheet name
			String sheetName = "일적재현황조회";
			String sheetStyle = "normal";

			// 2. Excel sheet title(목록)
			String columnStr = (String) paraMap.get("columns");
			columnStr = columnStr.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\"", "");
			List<String> title = Arrays.asList(columnStr.split("\\s*,\\s*"));

			// 3. Excel data 조회
			SearchVO searchVO = new SearchVO();
			String dbName = searchVO.nullTrim(request.getParameter("searchWord"));
			String startDate = searchVO.nullTrim(request.getParameter("startDate"));

			if (startDate.equals("")) {
				startDate = DateUtil.getDateWithFormat(DateUtil.FORMAT_WITH_HYPEN, DateUtil.NOW);
			} else {
				startDate = startDate.replaceAll("\\/", "-");
				;
			}

			List<Map<String, String>> statMap = mgmtTblStatService.getDailyMgmtTblStatList(dbName, startDate);
			List<List<Object>> valueList = new ArrayList<List<Object>>();
			for (int i = 0; i < statMap.size(); i++) {
				List<Object> strList = new ArrayList<Object>();
				Map<String, String> map = statMap.get(i);

				strList.add(map.get("tbl_name"));
				strList.add(map.get("monthlyAvg"));
				strList.add(map.get("7daysAgo"));
				strList.add(map.get("1daysAgo"));
				strList.add(map.get("today"));
				strList.add(map.get("monthlyDiff"));
				strList.add(map.get("7daysAgoPerDiff"));
				strList.add(map.get("1daysAgoPerDiff"));
				strList.add(map.get("nullCheck"));
				strList.add(map.get("typeCheck"));

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
