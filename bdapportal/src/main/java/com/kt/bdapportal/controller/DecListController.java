package com.kt.bdapportal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.nio.channels.FileChannel;
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
import com.kt.bdapportal.common.util.Util;
import com.kt.bdapportal.domain.BdapCrypto;
import com.kt.bdapportal.domain.BdapFile;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.service.BdapCryptoService;
import com.kt.bdapportal.service.FileService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller
public class DecListController {

	@Autowired
	private BdapCryptoService bdapCryptoService;
	
	@Autowired
	private FileService fileService;
	
	@RequestMapping("/decList.do")		
	public ModelAndView tableManagementList(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable){
		
		ModelAndView mav = new ModelAndView("/list/decList");
	
		try{
			
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			
		}
		
		return mav;
	}
	
	@RequestMapping("/getDecList.do")
	public void getDecList(HttpServletRequest request, HttpServletResponse response) {
		
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
			
			if(Util.isProcess(request)){ 
				bdapCryptoList = bdapCryptoService.getEncDecList('D',startnum,rows);
			}else{
				bdapCryptoList = bdapCryptoService.getEncDecList(bdapUser.getUserId(), 'D', startnum, rows);
			}
			
			Long bdapCryptoListCount = 0L;
			if(Util.isProcess(request)){ // 암복호화 승인 권한이 있는지 확인한다. 승인 권한이 있다면 전체 리스트가 나와야 함.
				bdapCryptoListCount = bdapCryptoService.getEncDecListCount('D');
			}else{
				bdapCryptoListCount = bdapCryptoService.getEncDecListCount(bdapUser.getUserId(), 'D');
			}
			
			for(int i = 0; i < bdapCryptoList.size();i++){
				BdapCrypto bdapCrypto = bdapCryptoList.get(i);
				JSONObject jsonObj1 = new JSONObject();
				List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bdapCrypto.getCrtId());
				StringBuffer fileName = new StringBuffer();
				
				if(bdapFileList.size() > 0){
	 	        	String fileStorePath = BbsConstant.FILE_STORE_PATH+File.separator;
	 				String fileTempPath = BbsConstant.FILE_TEMP_PATH + File.separator + bdapCrypto.getCrtOwnerId();
	 				
	 				File directory = new File(fileTempPath);
	 		        if(directory.exists() == false){
	 		        	directory.mkdirs();
	 		        }
	 		        
	 		       for(int j = 0; j < bdapFileList.size(); j++){
	 					BdapFile bdapFile = bdapFileList.get(j);
	 					
	 					try{
	 						FileInputStream inputStream = new FileInputStream(fileStorePath + bdapFile.getFleStroNm());        
							FileOutputStream outputStream = new FileOutputStream(fileTempPath + File.separator + bdapFile.getFleDisplayNm());
							  
							FileChannel fcin =  inputStream.getChannel();
							FileChannel fcout = outputStream.getChannel();
							  
							long size = fcin.size();
							fcin.transferTo(0, size, fcout);
							  
							fcout.close();
							fcin.close();
							  
							outputStream.close();
							inputStream.close();
	 					}catch(FileNotFoundException e){
	 						e.printStackTrace();
	 					}
						fileName.append(bdapFile.getFleDisplayNm()).append("*");
	 				}
	 	        }

				String reqDt = (bdapCrypto.getCrtReqDt() != null && !bdapCrypto.getCrtReqDt().equals(""))? bdapCrypto.getCrtReqDt().toString().substring(0, 19) : "";
				String processDt = (bdapCrypto.getCrtResDt() != null && !bdapCrypto.getCrtResDt().equals(""))? bdapCrypto.getCrtResDt().toString().substring(0, 19) : "";
				String validateDt = (bdapCrypto.getCrtEndDate() != null && !bdapCrypto.getCrtEndDate().equals(""))? bdapCrypto.getCrtEndDate().toString().substring(0, 10) : "";
				String status = "";
				if(bdapCrypto.getCrtStatus().equals("REQ")){
					status = "요청됨";
				}else if(bdapCrypto.getCrtStatus().equals("SUC")){
					status = "승인";
				}else if(bdapCrypto.getCrtStatus().equals("FAL")){
					status = "반려";
				}
				jsonObj1.put("separation", "복호화");
				jsonObj1.put("reqDt", reqDt);
				jsonObj1.put("projectNm", bdapCrypto.getCrtPrjNm());
				jsonObj1.put("reason", bdapCrypto.getCrtReqReason());
				jsonObj1.put("schema", bdapCrypto.getCrtSrcDbNm());
				jsonObj1.put("table", bdapCrypto.getCrtSrcTblNm());
				jsonObj1.put("column", bdapCrypto.getCrtDocNum());
				jsonObj1.put("status", status);
				jsonObj1.put("download",fileName.toString());
				jsonObj1.put("processDt", processDt);
				jsonObj1.put("validateDate", validateDt);
				jsonObj1.put("cryptoId", bdapCrypto.getCrtId());
				jsonObj1.put("ownerId", bdapCrypto.getCrtOwnerId());
				jsonArray.add(jsonObj1);
			}
			
			int forLastPage = (bdapCryptoListCount % rows > 0)? 1:0;
			jsonObj.put("records", bdapCryptoListCount);
			jsonObj.put("total", (bdapCryptoListCount/rows)+forLastPage) ;
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
