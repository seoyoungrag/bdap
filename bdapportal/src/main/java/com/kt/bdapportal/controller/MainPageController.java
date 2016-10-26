package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
import com.kt.bdapportal.domain.MgmtNodeStat;
import com.kt.bdapportal.domain.MgmtTblStat;
import com.kt.bdapportal.service.BbsService;
import com.kt.bdapportal.service.BdapCryptoService;
import com.kt.bdapportal.service.CommentService;
import com.kt.bdapportal.service.FileService;
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
	private FileService fileService;
	
	@Autowired
	private CommentService commentService;

	@Autowired
	private MgmtTblStatService mgmtTblStatService;

	@Autowired
	private MgmtUserTblStatService mgmtUserTblStatService;
	
	@Autowired
	private TblService tblService;
	
	@Autowired
	private MgmtNodeStatService mgmtNodeStatService;
	
	@Autowired
	private MgmtQryHistService mgmtQryHistService;
	
	@Autowired
	private BdapCryptoService bdapCryptoService;
	
	@RequestMapping("/mainPage.do")				
	public ModelAndView mainPage(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable){
	
		ModelAndView mav = new ModelAndView("bdapPortalMain");
	
		try{
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USER_ID");
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
			
			
			List<MgmtTblStat> mgmtTblStat = new ArrayList<MgmtTblStat>();
			mgmtTblStat = mgmtTblStatService.getMgmtTblList();
			mav.addObject("mgmtTblStat", mgmtTblStat);
			
			
			MgmtNodeStat storageNode= mgmtNodeStatService.getStorageNode();
			MgmtNodeStat computingNode = mgmtNodeStatService.getComputingNode();
			mav.addObject("storageNode", storageNode);
			mav.addObject("computingNode", computingNode);
			
			Long managedAreaUsage = 0L; 
			
			if(mgmtTblStatService.getManagedAreaUsage() != null){
				managedAreaUsage = mgmtTblStatService.getManagedAreaUsage();
			}
					
			Long userAreaUsage = mgmtUserTblStatService.getUserAreaUsage();
			
			mav.addObject("managedAreaUsage", managedAreaUsage);
			mav.addObject("userAreaUsage", userAreaUsage);
			
			Long accumulateQueryCount = mgmtQryHistService.getAccumulateQueryCount(userId);
			mav.addObject("accumulateQueryCount", accumulateQueryCount);
			
			Long weekQueryCount = mgmtQryHistService.getWeekQueryCount(userId);
			mav.addObject("weekQueryCount", weekQueryCount);
			
			Long dailyQueryLoadCount = mgmtTblStatService.getDailyQureyLoadCount();
			mav.addObject("dailyQueryLoadCount", dailyQueryLoadCount);
			
			Long qnaCount = bbsService.getQnaListCountForMainPage(BbsConstant.QNA_CODE);
			mav.addObject("qnaCount", qnaCount);
			
			Long usage = mgmtUserTblStatService.getUsage(userId);
			mav.addObject("usage", usage);
			
			
			List<BdapCrypto> cryptoList = bdapCryptoService.getUserDecTblAndCol(userId, 'D', "SUC");
			int columnCount = 0;
			for(int i = 0; i < cryptoList.size(); i++){
				BdapCrypto bdapCrypto = cryptoList.get(i);
				columnCount += bdapCrypto.getChild().size();
			}
			
			mav.addObject("cryptoListSize", cryptoList.size());
			mav.addObject("columnCount", columnCount);
			
			List<BdapTbl> tblList = tblService.getExpirationDateNearTable(userId);
			mav.addObject("tblList", tblList);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return mav;
	}
	
	
	@RequestMapping("/getComputingGraph.do")				
	public void getComputingGraph(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable){
	
		try{
			
			MgmtNodeStat computingNode = mgmtNodeStatService.getComputingNode();
			
			//Long managedAreaUsage = mgmtTblStatService.getManagedAreaUsage();
			//Long userAreaUsage = mgmtUserTblStatService.getUserAreaUsage();
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("computingNode", computingNode);
			
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
