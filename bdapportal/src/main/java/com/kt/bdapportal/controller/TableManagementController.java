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

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapCrypto;
import com.kt.bdapportal.domain.BdapTbl;
import com.kt.bdapportal.domain.MgmtTblStat;
import com.kt.bdapportal.service.BdapCryptoService;
import com.kt.bdapportal.service.MgmtTblStatService;
import com.kt.bdapportal.service.TblService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class TableManagementController {

	@Autowired
	private MgmtTblStatService mgmtTblStatService;
	
	@Autowired
	private BdapCryptoService bdapCryptoService;
	
	@Autowired
	private TblService tblService;
	
	@RequestMapping("/tableManagementList.do")		
	public ModelAndView tableManagementList(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable){
		
		ModelAndView mav = new ModelAndView("/list/tableManagementList");
	
try{
			
			request.setCharacterEncoding("UTF-8");
			String searchWord = (String)request.getParameter("schema");				//searchWord
			SearchVO searchVO = new SearchVO();
			searchWord = searchVO.nullTrim(searchWord);
			searchVO.setSearchWord(searchWord);										
			mav.addObject("searchVO", searchVO);								
			
			List<MgmtTblStat> mgmtTblStatDbList = mgmtTblStatService.getMgmtTblDbList();
			mav.addObject("mgmtTblStatDbList", mgmtTblStatDbList);
			
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			
		}
		
		return mav;
	}
	
	@RequestMapping("/getTableManagementList.do")
	public void getTableManagementList(HttpServletRequest request, HttpServletResponse response) {
		
		try{
			
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USER_ID");
			
			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String)request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			
			JSONArray jsonArray = new JSONArray();
			
			String dbName = (String)request.getParameter("searchWord");
			SearchVO searchVO = new SearchVO();
			
			List<MgmtTblStat> mgmtTblStatDbList = new ArrayList<MgmtTblStat>();
			
			if(dbName == null || dbName.equals("")){															
				mgmtTblStatDbList = mgmtTblStatService.getMgmtTblDbList();
				dbName = mgmtTblStatDbList.get(0).getDbName();
			}
			
			searchVO.setSearchWord(dbName);										
			
			List<BdapTbl> bdapTblList = tblService.getUserTableList(userId,dbName);
	
			for(int i = 0; i < bdapTblList.size();i++){
				BdapTbl bdapTbl = bdapTblList.get(i);
				JSONObject jsonObj1 = new JSONObject();
				jsonObj1.put("schema", bdapTbl.getTblDbNm());
				jsonObj1.put("table", bdapTbl.getTblEngNM());
				jsonObj1.put("createDt", bdapTbl.getTblCreateDt());
				jsonObj1.put("size", bdapTbl.getTblLocation()==null?"0":bdapTbl.getTblLocation()); // int형이지만 강제로 String에 매핑했으므로 null이 있을 수 있다.
				jsonObj1.put("count", bdapTbl.getTblOwner()==null?"0":bdapTbl.getTblOwner()); // int형이지만 강제로 String에 매핑했으므로 null이 있을 수 있다.
				jsonObj1.put("tblId", bdapTbl.getTblId());
				jsonObj1.put("validateDate", bdapTbl.getTblValidateDate().toString().substring(0, 10));
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
	
	
	
	@RequestMapping("/expirationDateModi.do")							
	public ModelAndView expirationDateModi(HttpServletRequest request, HttpServletResponse response) {
				
		ModelAndView mav = new ModelAndView("expirationDateModi");
		
		String tblId= (String)request.getParameter("tblId");
		
		BdapTbl bdapTbl = tblService.getBdapTblByTblId(tblId);
		mav.addObject("tblId", tblId);
		mav.addObject("validateDate", bdapTbl.getTblValidateDate().toString().substring(0,10));
				
		
		return mav;
	}

	
	@RequestMapping("/expirationDateUpdate.do")							
	public void expirationDateUpdate(HttpServletRequest request, HttpServletResponse response) {
		
		try{
			String tblId= (String)request.getParameter("tblId");
			String validateDate= (String)request.getParameter("validateDate");
			String rtnUrl = "tableManagementList.do";
			BdapTbl bdapTbl = tblService.getBdapTblByTblId(tblId);
			
			validateDate = validateDate+" 00:00:00";
			validateDate = validateDate.replaceAll("\\/", "-");	
			java.util.Date insertDate = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(validateDate);	
			bdapTbl.setTblValidateDate(insertDate);
			bdapTbl = tblService.updateValidateDate(bdapTbl);
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("window.opener.location.href = '" + rtnUrl + "';");
			out.println("window.close();");
			out.println("</script>");
			out.flush();	
			
		}catch(Exception e){
			e.printStackTrace();	
		}
		
	}
	
	
	
	
	
	
	
	
	
	
}
