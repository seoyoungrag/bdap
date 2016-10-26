package com.kt.bdapportal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.FileChannel;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

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
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.domain.BdapComment;
import com.kt.bdapportal.domain.BdapFile;
import com.kt.bdapportal.service.BbsService;
import com.kt.bdapportal.service.CommentService;
import com.kt.bdapportal.service.FileService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class DevreqController {

	
	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private CommentService commentService;
	
	public void setBbsService(BbsService bbsService){
		this.bbsService = bbsService;
	}
	
	
	@RequestMapping("/devreq/list.do")			
	public ModelAndView devreqList(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("/list/devreqList");
		
	try{
			
			request.setCharacterEncoding("UTF-8");
			
			String referenceType = (String)request.getParameter("referenceType");				
			String startDate = (String)request.getParameter("startDate");				//startDate
			String endDate = (String)request.getParameter("endDate");				//endDate
			String searchTypes [] = request.getParameterValues("searchTypes");				//searchType
			String searchWord = (String)request.getParameter("searchWord");				//searchWord
			
			SearchVO searchVO = new SearchVO();
			
			referenceType = searchVO.nullTrim(referenceType);
			startDate = searchVO.nullTrim(startDate);
			endDate = searchVO.nullTrim(endDate);
			searchWord = searchVO.nullTrim(searchWord);
			searchTypes = searchTypes==null ? new String[0]:searchTypes; 
			
			searchVO.setReferenceType(referenceType);
			searchVO.setStartDate(startDate);
			searchVO.setEndDate(endDate);
			searchVO.setSearchTypes(searchTypes);
			searchVO.setSearchWord(searchWord);
			
			mav.addObject("searchVO", searchVO);								
			
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			
		}
	
	return mav;
	
	}
	
	
	@RequestMapping("/getDevreqList.do")						
	public void getDevreqList(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable) {
		
		try{
			
			request.setCharacterEncoding("UTF-8");
			
			String referenceType = (String)request.getParameter("referenceType");				
			String startDate = (String)request.getParameter("startDate");				//startDate
			String endDate = (String)request.getParameter("endDate");				//endDate
			String searchType = (String)request.getParameter("searchType");				//searchType
			String searchTypes[] = request.getParameterValues("searchTypes");				//searchType
			String searchWord = (String)request.getParameter("searchWord");				//searchWord
			
			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String)request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String)request.getParameter("rows"));
			
			SearchVO searchVO = new SearchVO();
			searchVO.setReferenceType(referenceType);
			searchVO.setStartDate(startDate);
			searchVO.setEndDate(endDate);
			searchVO.setSearchType(searchType);
			searchVO.setSearchTypes(searchTypes);
			searchVO.setSearchWord(searchWord);
			
			int startnum = (page-1)*rows;				
			
			List<BdapBbs> bbsList =	bbsService.getDevreqList(searchVO,startnum,rows);	
			long devreqListCount = bbsService.getReferenceListCount(BbsConstant.DEV_REQ_CODE,searchVO);
			
			int bbsListSize = bbsList.size();
			
			JSONArray jsonArray = new JSONArray();
			
			for(int i = 0; i < bbsListSize;i++){
				JSONObject jsonObj1 = new JSONObject();
				BdapBbs bbs = bbsList.get(i);
				
				jsonObj1.put("category", bbs.getBbsCategorySub());
				jsonObj1.put("title", bbs.getBbsTitle());
				jsonObj1.put("postId", bbs.getBbsId());
				jsonObj1.put("regDate", bbs.getBbsRegDt().toString());
				jsonObj1.put("writerNm", bbs.getBbsWriterNm());
				jsonObj1.put("postHit", bbs.getBbsHit());
				if(bbs.getBbsParentBbsId() == null){
					jsonObj1.put("parentId", "");						
				}else{
					jsonObj1.put("parentId",bbs.getBbsParentBbsId());
				}
				jsonArray.add(jsonObj1);
			
			}
			
			int forLastPage = (devreqListCount % rows > 0)? 1:0;
			jsonObj.put("records", devreqListCount);
			jsonObj.put("total", (devreqListCount/rows)+forLastPage) ;
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


	@RequestMapping("/devreq/insert.do")							
	public String devreqInsert(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {

		try {
			HttpSession session = request.getSession();
			
			String userId = (String)session.getAttribute("USER_ID");
			String userNm = (String)session.getAttribute("USER_NM");
			String userMail = (String)session.getAttribute("USER_MAIL");
			
			request.setCharacterEncoding("UTF-8");
			
			String title = (String)request.getParameter("title");
			String referenceType = (String)request.getParameter("referenceType");
			String content = (String)request.getParameter("content");
			String fileListArr = (String)request.getParameter("fileList");
			
			BdapBbs bdapBbs = new BdapBbs();
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = "";
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);
			
			bdapBbs.setBbsCategory("BIDW");
			bdapBbs.setBbsType(BbsConstant.DEV_REQ_CODE);
			bdapBbs.setBbsTitle(title);
			bdapBbs.setBbsRegDt(ts);
			bdapBbs.setBbsDeletedYn('N');
			bdapBbs.setBbsEmergencyYn('N');
			bdapBbs.setBbsContent(content);
			bdapBbs.setBbsHit(0);
			bdapBbs.setBbsWriterId(userId);
			bdapBbs.setBbsWriterEmail(userMail);
			bdapBbs.setBbsWriterNm(userNm);
			bdapBbs.setBbsCategorySub(referenceType);
			
			bdapBbs = bbsService.devreqInsert(bdapBbs);
			
			String[] fileList = fileListArr.split("\\*");
			
			if(fileList.length != 0){
				
				String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+userId;
				String filePath = BbsConstant.FILE_STORE_PATH;
				
				File directory = new File(filePath);
	 	        if(directory.exists() == false){
	 	        	directory.mkdirs();
	 	        }
				
				for(int i = 0; i <fileList.length; i++){
					BdapFile bdapFile = new BdapFile();
					String fileStrNm = UUID.randomUUID().toString().replaceAll("\\-", "");
					/*FileInputStream fis = new FileInputStream(fileTempPath + File.separator + fileList[i]);
					FileOutputStream fos = new FileOutputStream(filePath + File.separator + fileStrNm);
					   
					int data = 0;
					while((data=fis.read())!=-1) {
						fos.write(data);
					}
					fis.close();
					fos.close();*/
					FileInputStream inputStream = new FileInputStream(fileTempPath + File.separator + fileList[i]);        
					FileOutputStream outputStream = new FileOutputStream(filePath + File.separator + fileStrNm);
					  
					FileChannel fcin =  inputStream.getChannel();
					FileChannel fcout = outputStream.getChannel();
					  
					long size = fcin.size();
					fcin.transferTo(0, size, fcout);
					  
					fcout.close();
					fcin.close();
					  
					outputStream.close();
					inputStream.close();
					 
					bdapFile.setFleStroNm(fileStrNm);
					bdapFile.setFleDisplayNm(fileList[i]);
					bdapFile.setFleRegDt(ts);
					bdapFile.setFleExtNm(fileList[i].substring(fileList[i].lastIndexOf(".")));
					bdapFile.setFleParentId(bdapBbs.getBbsId());
					bdapFile.setFleType('B');
					bdapFile = fileService.fileInsert(bdapFile);
				}
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/devreq/list.do";
		//return mav;
	}
	
	
	@RequestMapping("/devreq/view.do")							
	public ModelAndView devreqView(HttpServletRequest request, HttpServletResponse response) {
				
		ModelAndView mav = new ModelAndView("/view/devreqView");
		
		try{
			
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USER_ID");
			
			String bbsPostId = (String)request.getParameter("bbsPostId");
			
			BdapBbs bbs = bbsService.getBbsbyId(bbsPostId);
			String fileName = "";
	 	       
			int hit = bbs.getBbsHit();
			bbs.setBbsHit(++hit);
			bbsService.devreqInsert(bbs);
			
			List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId);
			List<BdapComment> bdapCmtList = commentService.getCommentList(bbsPostId);
			long cmtCount = commentService.countByCmtParentBbsId(bbsPostId);
 	        if(bdapFileList.size() > 0){
 	        	String fileStorePath = BbsConstant.FILE_STORE_PATH;
 				String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator;
 				
 				File directory = new File(fileTempPath);
 		        if(directory.exists() == false){
 		        	directory.mkdirs();
 		        }
 		       for(int i = 0; i < bdapFileList.size(); i++){
 					BdapFile bdapFile = bdapFileList.get(i);
 					
 					/*FileInputStream fis = new FileInputStream(fileStorePath + File.separator + bdapFile.getFleStroNm());
 					FileOutputStream fos = new FileOutputStream(fileTempPath + File.separator + bdapFile.getFleDisplayNm());
 					int data = 0;
 					while((data=fis.read())!=-1) {
 						fos.write(data);
 					}
 					fis.close();
 					fos.close();*/
 					FileInputStream inputStream = new FileInputStream(fileStorePath + File.separator + bdapFile.getFleStroNm());        
					FileOutputStream outputStream = new FileOutputStream(fileTempPath + File.separator + bdapFile.getFleDisplayNm());
					  
					FileChannel fcin =  inputStream.getChannel();
					FileChannel fcout = outputStream.getChannel();
					  
					long size = fcin.size();
					fcin.transferTo(0, size, fcout);
					  
					fcout.close();
					fcin.close();
					  
					outputStream.close();
					inputStream.close();
					
 					fileName += bdapFile.getFleDisplayNm()+"*"; 
 				}
 	        	
 	        }
 	       
 	        mav.addObject("cmtCount", cmtCount);
 	        mav.addObject("bdapCmtList", bdapCmtList);
			mav.addObject("fileName", fileName);
			mav.addObject("bbsPostId", bbsPostId);
			mav.addObject("title", bbs.getBbsTitle());
			mav.addObject("systemName", bbs.getBbsCategory());
			mav.addObject("content", bbs.getBbsContent());
			mav.addObject("devreqView", bbs);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		return mav;
	}
	
	

	@RequestMapping("/devreq/reg.do")							//devreq ��� ������
	public ModelAndView devreqReg(HttpServletRequest request, HttpServletResponse response) {
				
		ModelAndView mav = new ModelAndView("/reg/devreqReg");
		
		//String type= (String)request.getParameter("type");
		
		return mav;
	}
	
	
	@RequestMapping("/devreq/mod.do")							
	public ModelAndView devreqMod(HttpServletRequest request, HttpServletResponse response) {
				
		ModelAndView mav = new ModelAndView("/mod/devreqMod");
		
		try{
			String bbsPostId = (String)request.getParameter("bbsPostId");
			BdapBbs bdapBbs = bbsService.getBbsbyId(bbsPostId);
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USER_ID");
			String fileName = "";
		       
	        List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId);
		
	        if(bdapFileList.size() > 0){
	        	String fileStorePath = BbsConstant.FILE_STORE_PATH;
				String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+userId;
				
				File directory = new File(fileTempPath);
		        if(directory.exists() == false){
		        	directory.mkdirs();
		        }
		       for(int i = 0; i < bdapFileList.size(); i++){
					BdapFile bdapFile = bdapFileList.get(i);
					
					/*FileInputStream fis = new FileInputStream(fileStorePath + File.separator + bdapFile.getFleStroNm());
					FileOutputStream fos = new FileOutputStream(fileTempPath + File.separator + bdapFile.getFleDisplayNm());
					int data = 0;
					while((data=fis.read())!=-1) {
						fos.write(data);
					}
					fis.close();
					fos.close();*/
					FileInputStream inputStream = new FileInputStream(fileStorePath + File.separator + bdapFile.getFleStroNm());        
					FileOutputStream outputStream = new FileOutputStream(fileTempPath + File.separator + bdapFile.getFleDisplayNm());
					  
					FileChannel fcin =  inputStream.getChannel();
					FileChannel fcout = outputStream.getChannel();
					  
					long size = fcin.size();
					fcin.transferTo(0, size, fcout);
					  
					fcout.close();
					fcin.close();
					  
					outputStream.close();
					inputStream.close();
					
					fileName += bdapFile.getFleDisplayNm()+"*"; 
				}
	        	
	        }
	        mav.addObject("fileName", fileName);
			mav.addObject("bbsPostId",bbsPostId);
			mav.addObject("devreqView",bdapBbs);
	
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping("/devreq/del.do")							//devreq ���� ������
	public String devreqDel(HttpServletRequest request, HttpServletResponse response) {
				
		String bbsPostIdArr = request.getParameter("bbsPostIdArr");
		
		String[] bbsPostId = bbsPostIdArr.split("\\^");
		
		for(int i = 0; i < bbsPostId.length; i++){
			BdapBbs bdapBbs = bbsService.getBbsbyId(bbsPostId[i]);
			bdapBbs.setBbsDeletedYn('Y');
			bbsService.noticeInsert(bdapBbs);
			
			/* 파일도 일단 삭제하지 않도록 하자
			 * 
			 * List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId[i]);
			
			if(bdapFileList.size() > 0){
				for(int j = 0; j < bdapFileList.size(); j++){
					BdapFile bdapFile = bdapFileList.get(j); 
					fileService.fileDelete(bdapFile);
				}
			}*/
			
		}
		
		return "redirect:/devreq/list.do";
	}
	
	@RequestMapping("/devreq/update.do")							
	public String devreqUpdate(HttpServletRequest request, HttpServletResponse response) {

		try{
			
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USER_ID");
			String userMail = (String)session.getAttribute("USER_MAIL");
			request.setCharacterEncoding("UTF-8");
			
			String title = (String)request.getParameter("title");
			String categorySub = (String)request.getParameter("referenceType");
			String content = (String)request.getParameter("content");
			String bbsPostId = (String)request.getParameter("bbsPostId");
			
			BdapBbs bdapBbs = bbsService.getBbsbyId(bbsPostId);
			String fileListArr = (String)request.getParameter("fileList");
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = "";
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);
			

			bdapBbs.setBbsCategory("BIDW");
			bdapBbs.setBbsType(BbsConstant.DEV_REQ_CODE);
			bdapBbs.setBbsTitle(title);
			bdapBbs.setBbsModDt(ts);
			bdapBbs.setBbsDeletedYn('N');
			bdapBbs.setBbsEmergencyYn('N');
			bdapBbs.setBbsContent(content);
			bdapBbs.setBbsWriterEmail(userMail);			
			bdapBbs.setBbsCategorySub(categorySub);
			
			bbsService.devreqInsert(bdapBbs);
			
			List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId);
			
			if(bdapFileList.size() > 0){
				for(int i = 0; i < bdapFileList.size(); i++){
					BdapFile bdapFile = bdapFileList.get(i); 
					fileService.fileDelete(bdapFile);
				}
			}
			
			String[] fileList = fileListArr.split("\\*");
						
			if(fileListArr.contains("*")){
				
				String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+userId;
				String filePath = BbsConstant.FILE_STORE_PATH;
				
				File directory = new File(filePath);
	 	        if(directory.exists() == false){
	 	        	directory.mkdirs();
	 	        }
				
				for(int i = 0; i <fileList.length; i++){
					BdapFile bdapFile = new BdapFile();
					String fileStrNm = UUID.randomUUID().toString().replaceAll("\\-", "");
					/*FileInputStream fis = new FileInputStream(fileTempPath + File.separator + fileList[i]);
					FileOutputStream fos = new FileOutputStream(filePath + File.separator + fileStrNm);
					   
					int data = 0;
					while((data=fis.read())!=-1) {
						fos.write(data);
					}
					fis.close();
					fos.close();*/
					
					FileInputStream inputStream = new FileInputStream(fileTempPath + File.separator + fileList[i]);        
					FileOutputStream outputStream = new FileOutputStream(filePath + File.separator + fileStrNm);
					  
					FileChannel fcin =  inputStream.getChannel();
					FileChannel fcout = outputStream.getChannel();
					  
					long size = fcin.size();
					fcin.transferTo(0, size, fcout);
					  
					fcout.close();
					fcin.close();
					  
					outputStream.close();
					inputStream.close();
					 
					bdapFile.setFleStroNm(fileStrNm);
					bdapFile.setFleDisplayNm(fileList[i]);
					bdapFile.setFleRegDt(ts);
					bdapFile.setFleExtNm(fileList[i].substring(fileList[i].lastIndexOf(".")));
					bdapFile.setFleParentId(bdapBbs.getBbsId());
					bdapFile.setFleType('B');
					bdapFile = fileService.fileInsert(bdapFile);
				}
			}
		
		}catch(Exception e){
			
			e.printStackTrace();	
		}
		
		
		return "redirect:/devreq/list.do";
	}
	
	
	
	
}
