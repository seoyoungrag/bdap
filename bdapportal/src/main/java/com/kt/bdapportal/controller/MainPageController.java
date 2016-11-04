package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.BbsConstant;
import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.domain.BdapCrypto;
import com.kt.bdapportal.domain.BdapTbl;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.domain.MgmtComputingStat;
import com.kt.bdapportal.domain.MgmtNodeStat;
import com.kt.bdapportal.domain.MgmtTblStat;
import com.kt.bdapportal.service.BbsService;
import com.kt.bdapportal.service.BdapCryptoService;
import com.kt.bdapportal.service.MgmtComputingStatService;
import com.kt.bdapportal.service.MgmtNodeStatService;
import com.kt.bdapportal.service.MgmtQryHistService;
import com.kt.bdapportal.service.MgmtTblStatService;
import com.kt.bdapportal.service.MgmtUserTblStatService;
import com.kt.bdapportal.service.TblService;

import net.sf.json.JSONObject;

@Controller
public class MainPageController {

	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private MgmtTblStatService mgmtTblStatService;

	@Autowired
	private MgmtUserTblStatService mgmtUserTblStatService;
	
	@Autowired
	private TblService tblService;
	
	@Autowired
	private MgmtNodeStatService mgmtNodeStatService;

	@Autowired
	private MgmtComputingStatService mgmtComputingStatService;
	
	@Autowired
	private MgmtQryHistService mgmtQryHistService;
	
	@Autowired
	private BdapCryptoService bdapCryptoService;
	
	@RequestMapping("/mainPage.do")				
	public ModelAndView mainPage(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable){
	
		ModelAndView mav = new ModelAndView("bdapPortalMain");
	
		try{
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			request.setCharacterEncoding("UTF-8");
			
			List<BdapBbs> noticeList =	bbsService.getList("BO1",0,4);	
			List<BdapBbs> qnaList =	bbsService.getList("BO2",0,4);
			List<BdapBbs> referenceList =	bbsService.getList("BO3",0,4);
			List<BdapBbs> linkageList =	bbsService.getList("BO4",0,4);
			List<BdapBbs> devreqList =	bbsService.getList("BO5",0,4);
		
			mav.addObject("noticeList", noticeList);
			mav.addObject("qnaList", qnaList);
			mav.addObject("referenceList", referenceList);
			mav.addObject("linkageList", linkageList);
			mav.addObject("devreqList", devreqList);
			
			
			List<Map<String,String>> dashTblStatList = new ArrayList<Map<String,String>>();
			dashTblStatList = mgmtTblStatService.getDashTblStatList();
			
			Comparator<Map<String, String>> dashMapComparator = new Comparator<Map<String, String>>() {
			    public int compare(Map<String, String> m1, Map<String, String> m2) {
			        return m1.get("etl_ymd").compareTo(m2.get("etl_ymd"));
			    }
			};

			Collections.sort(dashTblStatList, dashMapComparator);
			
			List<MgmtTblStat> mgmtTblStat = new ArrayList<MgmtTblStat>();
			List<String> dashTblList = new ArrayList<String>();
			Set<String> tblSetForDistinct = new HashSet<String>();
			//mgmtTblStat = mgmtTblStatService.getMgmtTblList();
			
			for(Map<String,String> map : dashTblStatList){
				MgmtTblStat stat = new MgmtTblStat();
				stat.setDbName(map.get("db_name"));
				stat.setTblName(map.get("tbl_name"));
				stat.setEtlYmd(map.get("etl_ymd"));
				stat.setTblCnt(Integer.parseInt(String.valueOf(map.get("tbl_cnt"))));
				stat.setTblSize(Integer.parseInt(String.valueOf(map.get("tbl_size"))));
				mgmtTblStat.add(stat);
				tblSetForDistinct.add(map.get("tbl_name"));
			}
			
			dashTblList.addAll(tblSetForDistinct);
			mav.addObject("mgmtTblStat", mgmtTblStat);
			mav.addObject("dashTblList", dashTblList);
			
			MgmtNodeStat storageNode= mgmtNodeStatService.getStorageNode();
			MgmtComputingStat computingNode = mgmtComputingStatService.getComputingNode();
			mav.addObject("storageNode", storageNode);
			mav.addObject("computingNode", computingNode);
			
			/*Long managedAreaUsage = 0L; 
			
			if(mgmtTblStatService.getManagedAreaUsage() != null){
				managedAreaUsage = mgmtTblStatService.getManagedAreaUsage();
			}*/
			Long managedAreaUsage = mgmtUserTblStatService.getManagedAreaUsage();
			
			Long userAreaUsage = mgmtUserTblStatService.getUserAreaUsage();
			
			mav.addObject("managedAreaUsage", managedAreaUsage);
			mav.addObject("userAreaUsage", userAreaUsage);
			
			//Long accumulateQueryCount = mgmtQryHistService.getAccumulateQueryCount(bdapUser.getUserId());
			Long accumulateQueryCount = mgmtQryHistService.getAccumulateQueryCountAll();
			mav.addObject("accumulateQueryCount", accumulateQueryCount);
			
			//Long weekQueryCount = mgmtQryHistService.getWeekQueryCount(bdapUser.getUserId());
			Long weekQueryCount = mgmtQryHistService.getWeekQueryCountAll();
			mav.addObject("weekQueryCount", weekQueryCount);
			
			Long dailyQueryLoadCount = mgmtTblStatService.getDailyQureyLoadCount();
			mav.addObject("dailyQueryLoadCount", dailyQueryLoadCount);
			
			Long qnaCount = bbsService.getQnaListCountForMainPage(BbsConstant.QNA_CODE);
			mav.addObject("qnaCount", qnaCount);
			
			Long usage = mgmtUserTblStatService.getUsage(bdapUser.getUserId());
			mav.addObject("usage", usage);
			
			
			List<BdapCrypto> cryptoList = bdapCryptoService.getUserDecTblAndCol(bdapUser.getUserId(), 'D', "SUC");
			int columnCount = 0;
			for(int i = 0; i < cryptoList.size(); i++){
				BdapCrypto bdapCrypto = cryptoList.get(i);
				columnCount += bdapCrypto.getChild().size();
			}
			
			mav.addObject("cryptoListSize", cryptoList.size());
			mav.addObject("columnCount", columnCount);
			
			List<BdapTbl> tblList = tblService.getExpirationDateNearTable(bdapUser.getUserId());
			mav.addObject("tblList", tblList);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return mav;
	}
	
	
	@RequestMapping("/getComputingGraph.do")				
	public void getComputingGraph(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable){
	
		try{
			
			//MgmtNodeStat computingNode = mgmtNodeStatService.getComputingNode();
			
			MgmtComputingStat mgmtComputingNode = mgmtComputingStatService.getComputingNode();
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("computingNode", mgmtComputingNode);
			
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
	}
	
	@RequestMapping("/getMemoryGraph.do")				
	public void getMemoryGraph(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable){
	
		try{
			MgmtNodeStat storageNode= mgmtNodeStatService.getStorageNode();
			
			
			//Long managedAreaUsage = mgmtTblStatService.getManagedAreaUsage();
			//Long userAreaUsage = mgmtUserTblStatService.getUserAreaUsage();
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("storageNode", storageNode);
			
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
