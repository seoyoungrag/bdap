package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
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
import com.kt.bdapportal.common.util.Util;
import com.kt.bdapportal.domain.BdapCrypto;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.service.BdapCryptoService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller
public class DecRoleListController {

	
	@Autowired
	private BdapCryptoService bdapCryptoService;
	
	@RequestMapping("decRoleList.do")
	public ModelAndView decRoleList(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable){
		
		ModelAndView mav = new ModelAndView("/list/decRoleList");
		
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
		
	@RequestMapping("/getDecRoleList.do")						
	public void getDecRoleList(HttpServletRequest request, HttpServletResponse response) {
		
		try{

			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			JSONObject jsonObj = new JSONObject();
			
			int page = Integer.parseInt((String)request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int rows = Integer.parseInt((String)request.getParameter("rows"));
			
			int startnum = (page-1)*rows;	
			
			JSONArray jsonArray = new JSONArray();

			List<BdapCrypto> bdapCryptoList = new ArrayList<BdapCrypto>();
			String userRoleId = Util.getRoleId(request);
			
			if(userRoleId.contains("ADMIN")){ 
				bdapCryptoList = bdapCryptoService.getDecRoleList('D',"SUC",startnum,rows);
			}else{
				bdapCryptoList = bdapCryptoService.getDecRoleList(bdapUser.getUserId(),'D',"SUC",startnum,rows);
			}


			Long bdapCryptoListCount = 0L;
			
			if(userRoleId.contains("ADMIN")){ // 암복호화 승인 권한이 있는지 확인한다. 승인 권한이 있다면 전체 리스트가 나와야 함.
				bdapCryptoListCount = bdapCryptoService.getDecRoleListCount('D',"SUC");
			}else{
				bdapCryptoListCount = bdapCryptoService.getDecRoleListCount(bdapUser.getUserId(), 'D',"SUC");
			}
			
			
			Date forValidate = new Date();
			
			for(int i = 0; i < bdapCryptoList.size();i++){
				JSONObject jsonObj1 = new JSONObject();
				BdapCrypto bdapCrypto = bdapCryptoList.get(i);
				String validate = "만료됨";

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
				jsonObj1.put("tableNm",bdapCrypto.getCrtSrcTblNm());
				jsonObj1.put("columnNm",bdapCrypto.getCrtDocNum());
				jsonObj1.put("startDate",processDt);
				jsonObj1.put("endDate",validateDt);
				jsonObj1.put("status",status);
				jsonObj1.put("ownerId",bdapCrypto.getCrtOwnerId());
		   		
		   		if(forValidate.before(bdapCrypto.getCrtEndDate())){
		   			validate = "유효함";
		   		}
		   		jsonObj1.put("isVal",validate);
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
