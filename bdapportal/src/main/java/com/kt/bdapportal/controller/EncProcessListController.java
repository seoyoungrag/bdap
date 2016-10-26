package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.domain.BdapCrypto;
import com.kt.bdapportal.service.BdapCryptoService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class EncProcessListController {

	@Autowired
	private BdapCryptoService bdapCryptoService;
	
	
	
	@RequestMapping("encProcessList.do")
	public ModelAndView encProcessList(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable){
		
		ModelAndView mav = new ModelAndView("/list/encProcessList");
		
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping("/getEncProcessList.do")						
	public void ktlist8(HttpServletRequest request, HttpServletResponse response) {
		
		try{
			
			JSONObject jsonObj = new JSONObject();
			
			int page = Integer.parseInt((String)request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int rows = Integer.parseInt((String)request.getParameter("rows"));
			
			int startnum = (page-1)*rows;	
			
			JSONArray jsonArray = new JSONArray();
			
			List<BdapCrypto> bdapCryptoList = new ArrayList<BdapCrypto>();
			
			bdapCryptoList = bdapCryptoService.getEncProcessList('E',startnum,rows);
			Long bdapCryptoListCount = bdapCryptoService.getEncProcessListCount('E');
		
			for(int i = 0; i < bdapCryptoList.size();i++){
				JSONObject jsonObj1 = new JSONObject();
				BdapCrypto bdapCrypto = bdapCryptoList.get(i);

				String processDt = (bdapCrypto.getCrtResDt() != null && !bdapCrypto.getCrtResDt().equals(""))? bdapCrypto.getCrtResDt().toString().substring(0, 10) : "";
				String validateDt = (bdapCrypto.getCrtEndDate() != null && !bdapCrypto.getCrtEndDate().equals(""))? bdapCrypto.getCrtEndDate().toString().substring(0, 10) : "";
				String status = "";
				if(bdapCrypto.getCrtStatus().equals("REQ")){
					status = "요청됨";
				}else if(bdapCrypto.getCrtStatus().equals("SUC")){
					status = "승인";
				}else if(bdapCrypto.getCrtStatus().equals("FAL")){
					status = "반려";
				}
				jsonObj1.put("schemaNm",bdapCrypto.getCrtSrcDbNm());
				jsonObj1.put("tableNm",bdapCrypto.getCrtCreateTblNm());
				jsonObj1.put("columnNm",bdapCrypto.getCrtDocNum());
				jsonObj1.put("startDate",processDt);
				jsonObj1.put("endDate",validateDt);
				jsonObj1.put("status",status);
				
				jsonArray.add(jsonObj1);
			}
			
			int forLastPage = (bdapCryptoListCount % rows > 0)? 1:0;
			jsonObj.put("records", bdapCryptoListCount);
			jsonObj.put("total", (bdapCryptoListCount/rows)+forLastPage);
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