package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtNodeStat;
import com.kt.bdapportal.domain.MgmtQryHist;
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
	public ModelAndView statisticsList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/list/statisticsList");
		
		try{
			request.setCharacterEncoding("UTF-8");
			
			String searchType = (String)request.getParameter("all");				//searchType
			String searchWord = (String)request.getParameter("userInfo");	//searchWord
			String category = (String)request.getParameter("timing");			//timing
			
			SearchVO searchVO = new SearchVO();
			
			searchType = searchVO.nullTrim(searchType);
			searchWord = searchVO.nullTrim(searchWord);
			category = searchVO.nullTrim(category);
			
			searchVO.setSearchWord(searchWord);										
			searchVO.setSearchType(searchType);
			searchVO.setCategory(category);
			
			mav.addObject("searchVO", searchVO);		
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mav;
	}
	
	
	@RequestMapping("/getComputingList.do")						// COMPUTING 히스토리
	public void getComputingList(HttpServletRequest request, HttpServletResponse response) {
		try{
			String startDate = (String)request.getParameter("startDate");
			String endDate = (String)request.getParameter("endDate");
			
			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));
			searchVO.setPaging(request);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("page", String.valueOf(searchVO.getPage()));
			
			JSONArray jsonArray = new JSONArray();
			
			List<MgmtNodeStat> list = this.mgmtNodeStatService.computingStat(searchVO);
			
			for(int i = 0; i < list.size() ;i++){
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
			
			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
	@RequestMapping("/getDiskUsageList.do")						// DISK 사용량 통계
	public void getDiskUsageList(HttpServletRequest request, HttpServletResponse response) {
		try{
			String startDate = (String)request.getParameter("startDate");
			String endDate = (String)request.getParameter("endDate");
			
			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));
			searchVO.setPaging(request);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("page", String.valueOf(searchVO.getPage()));
			
			JSONArray jsonArray = new JSONArray();
			
			List<MgmtUserTblStat> mgmtUserTblStatList = mgmtUserTblStatService.getUserUsage(searchVO);
			
			for(int i = 0; i < mgmtUserTblStatList.size() ;i++){
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
			
			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
	
	@RequestMapping("/getQueryUsageList.do")						// 관리자 - 통계 - 쿼리히스토리 통계
	public void getQueryUsageList(HttpServletRequest request, HttpServletResponse response) {
		try{
			String startDate = (String)request.getParameter("startDate");
			String endDate = (String)request.getParameter("endDate");
			
			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));
			searchVO.setPaging(request);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("page", String.valueOf(searchVO.getPage()));
			
			JSONArray jsonArray = new JSONArray();
			
			List<MgmtQryHist> mgmtQryHistList = mgmtQryHistService.getQueryUsageList(searchVO);
			
			for(int i = 0; i < mgmtQryHistList.size() ;i++){
				MgmtQryHist mgmtQryHistStat = mgmtQryHistList.get(i);
				JSONObject jsonObj1 = new JSONObject();
				jsonObj1.put("userId", mgmtQryHistStat.getQryUser());
				jsonObj1.put("userName", mgmtQryHistStat.getQryStatement());
				jsonObj1.put("statToday", mgmtQryHistStat.getQryHiveId());
				jsonObj1.put("statMinusOne", mgmtQryHistStat.getQryEndDt());
				jsonObj1.put("statMinusTwo", mgmtQryHistStat.getQryStartDt());
				jsonObj1.put("statMinusThree", mgmtQryHistStat.getQryStatus());
				jsonArray.add(jsonObj1);
			}
			
			jsonObj.put("rows", jsonArray);
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
