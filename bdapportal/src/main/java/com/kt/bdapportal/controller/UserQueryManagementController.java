package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.MgmtQryHist;
import com.kt.bdapportal.service.MgmtQryHistService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class UserQueryManagementController {

	@Autowired
	private MgmtQryHistService mgmtQryHistService;
	
	
	@RequestMapping("userQueryManagementList.do")
	public ModelAndView userQueryManagementList(HttpServletRequest request, HttpServletResponse respons){
		
		ModelAndView mav = new ModelAndView("/list/userQueryManagementList");
		
		try{
			
			request.setCharacterEncoding("UTF-8");
			
			String searchType = (String)request.getParameter("searchType");				//searchType
			String termTime = (String)request.getParameter("termTime");			//timing
			String termStatus = (String)request.getParameter("termStatus");			//timing
			String startDate = (String)request.getParameter("startDate");
			String endDate = (String)request.getParameter("endDate");

			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));
			searchVO.setSearchType(searchVO.nullTrim(searchType, "normal"));
			searchVO.setTermTime(Integer.parseInt(searchVO.nullTrim(termTime, "0")));
			searchVO.setTermStatus(searchVO.nullTrim(termStatus, ""));
			
			mav.addObject("searchVO", searchVO);		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping("getUserQueryManagementList.do")
	public void getUserQueryManagementList(HttpServletRequest request, HttpServletResponse response){
		try{
			
			request.setCharacterEncoding("UTF-8");
			String searchType = (String)request.getParameter("searchType");	// searchType
			String termTime = (String)request.getParameter("termTime");	
			String termStatus = (String)request.getParameter("termStatus");	
			String startDate = (String)request.getParameter("startDate");
			String endDate = (String)request.getParameter("endDate");
			
			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));
			searchVO.setSearchType(searchVO.nullTrim(searchType,"personal"));
			searchVO.setTermTime(Integer.parseInt(searchVO.nullTrim(termTime, "0")));
			searchVO.setTermStatus(searchVO.nullTrim(termStatus, ""));
			searchVO.setPaging(request);
				 
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("page", String.valueOf(searchVO.getPage()));
			
			List<MgmtQryHist> mgmtQryHistList = mgmtQryHistService.getMgmtQryHistList(searchVO);
			Long listCount = mgmtQryHistService.getMgmtQryHistListCount(searchVO);
			
			JSONArray jsonArray = new JSONArray();
			
			for(int i = 0; i < mgmtQryHistList.size() ;i++){
				MgmtQryHist mgmtQryHist = mgmtQryHistList.get(i);
				JSONObject jsonObj1 = new JSONObject();
				jsonObj1.put("user", mgmtQryHist.getQryUser());
				jsonObj1.put("query", mgmtQryHist.getQryStatement());
				jsonObj1.put("startTime", mgmtQryHist.getQryStartDt());
				jsonObj1.put("endTime", mgmtQryHist.getQryEndDt());
				jsonObj1.put("term", mgmtQryHist.getQryDuration());
				jsonObj1.put("result", mgmtQryHist.getQryStatus());
				jsonArray.add(jsonObj1);
			}
			
			searchVO.setListCount(listCount);
			searchVO.setLastPage();

			jsonObj.put("records", listCount);
			jsonObj.put("total", searchVO.getTotal()) ;
			jsonObj.put("rows", jsonArray);
			
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("getUserPersonalQueryManagementList.do")
	public void getUserPersonalQueryManagementList(HttpServletRequest request, HttpServletResponse response){
		try{
			request.setCharacterEncoding("UTF-8");
			String searchType = (String)request.getParameter("searchType");	//searchType
			String startDate = (String)request.getParameter("startDate");	//searchType
			String endDate = (String)request.getParameter("endDate");	//searchType
			
			
			SearchVO searchVO = new SearchVO();
			searchVO.setStartDate(searchVO.nullTrim(startDate));
			searchVO.setEndDate(searchVO.nullTrim(endDate));
			searchVO.setSearchType(searchVO.nullTrim(searchType,"personal"));
			searchVO.setPaging(request);
			
			List<MgmtQryHist> mgmtQryHistList = mgmtQryHistService.getMgmtPersonalQryHistList(searchVO);
			Long listCount = mgmtQryHistService.getMgmtPersonalQryHistListCount(searchVO);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("page", String.valueOf(searchVO.getPage()));
			
			JSONArray jsonArray = new JSONArray();
			
			for(int i = 0; i < mgmtQryHistList.size() ;i++){
				MgmtQryHist mgmtQryHist = mgmtQryHistList.get(i);
				JSONObject jsonObj1 = new JSONObject();
				jsonObj1.put("user", mgmtQryHist.getQryUser());
				jsonObj1.put("query", mgmtQryHist.getQryStatement());
				jsonObj1.put("startTime", mgmtQryHist.getQryStartDt());
				jsonObj1.put("endTime", mgmtQryHist.getQryEndDt());
				jsonObj1.put("term", mgmtQryHist.getQryDuration());
				jsonObj1.put("result", mgmtQryHist.getQryStatus());
				jsonArray.add(jsonObj1);
			}

			searchVO.setListCount(listCount);
			searchVO.setLastPage();

			jsonObj.put("records", listCount);
			jsonObj.put("total", searchVO.getTotal()) ;
			jsonObj.put("rows", jsonArray);
			
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
