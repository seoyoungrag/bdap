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
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.service.BbsService;
import com.kt.bdapportal.service.CommentService;
import com.kt.bdapportal.service.FileService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class BbsController {

	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private CommentService commentService;
	
	public void setBbsService(BbsService bbsService){
		this.bbsService = bbsService;
	}
	
	
	@RequestMapping("/notice/list.do")				
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("/list/noticeList");
		
		try{
			
			request.setCharacterEncoding("UTF-8");
			
			String category = (String)request.getParameter("category");				
			String categorySub = (String)request.getParameter("categorySub");		
			String startDate = (String)request.getParameter("startDate");				//startDate
			String endDate = (String)request.getParameter("endDate");				//endDate
			String searchType = (String)request.getParameter("searchType");				//searchType
			String searchWord = (String)request.getParameter("searchWord");				//searchWord
			
			SearchVO searchVO = new SearchVO();
			
			category = searchVO.nullTrim(category);
			categorySub = searchVO.nullTrim(categorySub);
			startDate = searchVO.nullTrim(startDate);
			endDate = searchVO.nullTrim(endDate);
			searchType = searchVO.nullTrim(searchType);
			searchWord = searchVO.nullTrim(searchWord);
			
			searchVO.setCategory(category);
			searchVO.setCategorySub(categorySub);
			searchVO.setStartDate(startDate);
			searchVO.setEndDate(endDate);
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
			
			mav.addObject("searchVO", searchVO);								
			
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			
		}
	
	return mav;
	
	}
	
	
	@RequestMapping("/getNoticeList.do")						
	public void getNoticeList(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable) {
		
		try{

			request.setCharacterEncoding("UTF-8");
			
			String category = (String)request.getParameter("category");				
			String categorySub = (String)request.getParameter("categorySub");		
			String startDate = (String)request.getParameter("startDate");				//startDate
			String endDate = (String)request.getParameter("endDate");				//endDate
			String searchType = (String)request.getParameter("searchType");				//searchType
			String searchWord = (String)request.getParameter("searchWord");				//searchWord
			String emergencyYn = (String)request.getParameter("emergencyYn");				//emergencyYn
			
			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String)request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int rows = Integer.parseInt((String)request.getParameter("rows"));
			
			SearchVO searchVO = new SearchVO();
			
			searchVO.setCategory(category);
			searchVO.setCategorySub(categorySub);
			searchVO.setStartDate(startDate);
			searchVO.setEndDate(endDate);
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
			searchVO.setEmergencyYn(emergencyYn);
			
			int startnum = (page-1)*rows;				
			
			List<BdapBbs> bbsList = bbsService.getNoticeList(searchVO,startnum,rows,pageable);	
			long bbsListCount = bbsService.getNoticeListCount(BbsConstant.BBS_CODE,searchVO);
			
			int bbsListSize = bbsList.size();
			
			JSONArray jsonArray = new JSONArray();
			
			for(int i = 0; i < bbsListSize;i++){
				
				JSONObject jsonObj1 = new JSONObject();
				BdapBbs bbs = (BdapBbs)bbsList.get(i);
				
				jsonObj1.put("category", bbs.getBbsCategory());
				jsonObj1.put("categorySub", bbs.getBbsCategorySub());
				jsonObj1.put("title", bbs.getBbsTitle());
				jsonObj1.put("emer", bbs.getBbsEmergencyYn());
				jsonObj1.put("writer", bbs.getBbsWriterNm());
				jsonObj1.put("noticeId", bbs.getBbsId());
				jsonObj1.put("regDate", bbs.getFormatBbsRegDt());
				jsonObj1.put("userId", bbs.getBbsWriterId());
				if(bbs.getBbsParentBbsId() == null){
					jsonObj1.put("parentId", "");						
				}else{
					jsonObj1.put("parentId",bbs.getBbsParentBbsId());
				}
				jsonArray.add(jsonObj1);
			}
			
			int forLastPage = (bbsListCount % rows > 0)? 1:0;
			jsonObj.put("records", bbsListCount);
			jsonObj.put("total", (bbsListCount/rows)+forLastPage) ;
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
	
	@RequestMapping("/notice/insert.do")							
	public String noticeInsert(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
				
		try {
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			
			request.setCharacterEncoding("UTF-8");
			
			String title = (String)request.getParameter("title");
			String category = (String)request.getParameter("category");
			String categorySub = (String)request.getParameter("categorySub");
			String content = (String)request.getParameter("content");
			String emerYN = (String)request.getParameter("emerYN");
			String fileListArr = (String)request.getParameter("fileList");
			char yn;
			if(emerYN.equals("emerY")){
				yn = 'Y';
			}else{
				yn = 'N';
			}
			
			BdapBbs bdapBbs = new BdapBbs();
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = "";
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);

			bdapBbs.setBbsCategory(category);
			bdapBbs.setBbsType(BbsConstant.BBS_CODE);
			bdapBbs.setBbsTitle(title);
			bdapBbs.setBbsRegDt(ts);
			bdapBbs.setBbsDeletedYn('N');
			bdapBbs.setBbsEmergencyYn(yn);
			bdapBbs.setBbsContent(content);
			bdapBbs.setBbsHit(0);
			bdapBbs.setBbsWriterId(bdapUser.getUserId());
			bdapBbs.setBbsWriterEmail(bdapUser.getUserEmail());
			bdapBbs.setBbsWriterNm(bdapUser.getUserNm());
			bdapBbs.setBbsCategorySub(categorySub);
			
			bdapBbs = bbsService.noticeInsert(bdapBbs);
			
			if(!fileListArr.equals("")){
				String[] fileList = fileListArr.split("\\*");
				if(fileList.length != 0 && fileListArr.contains("*")){
					String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+bdapUser.getUserId();
					String filePath = BbsConstant.FILE_STORE_PATH+File.separator;
					
					File directory = new File(filePath);
		 	        if(directory.exists() == false){
		 	        	directory.mkdirs();
		 	        }
					
					for(int i = 0; i <fileList.length; i++){
						BdapFile bdapFile = new BdapFile();
						String fileStrNm = UUID.randomUUID().toString().replaceAll("\\-", "");
						 
						FileInputStream inputStream = new FileInputStream(fileTempPath + File.separator + fileList[i]);         
						FileOutputStream outputStream = new FileOutputStream(filePath + fileStrNm);
						  
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
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/notice/list.do";
	}
	
	
	
	
	@RequestMapping("/notice/view.do")							
	public ModelAndView notificationView(HttpServletRequest request, HttpServletResponse response)  {
				
		ModelAndView mav = new ModelAndView("/view/noticeView");
		
		try{
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			
			String bbsPostId = (String)request.getParameter("bbsPostId");
			BdapBbs bbs = bbsService.getBbsbyId(bbsPostId);
			
			int hit = bbs.getBbsHit();
			bbs.setBbsHit(++hit);
			bbs = bbsService.noticeInsert(bbs);
			
			StringBuffer fileName = new StringBuffer();
 	       
 	        List<BdapComment> bdapCmtList = commentService.getCommentList(bbsPostId);
 	        long cmtCount = commentService.countByCmtParentBbsId(bbsPostId); 
 	        List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId);
			
 	        if(bdapFileList.size() > 0){
 	        	String fileStorePath = BbsConstant.FILE_STORE_PATH+File.separator;
 				String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator + bbs.getBbsWriterId();
 				
 				File directory = new File(fileTempPath);
 		        if(directory.exists() == false){
 		        	directory.mkdirs();
 		        }
 		       for(int i = 0; i < bdapFileList.size(); i++){
 					BdapFile bdapFile = bdapFileList.get(i);
 	
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
 					
					fileName.append(bdapFile.getFleDisplayNm()).append("*");
 				}
 	        	
 	        }
 	       
 	        mav.addObject("cmtCount", cmtCount);
 	       	mav.addObject("bdapCmtList", bdapCmtList);
			mav.addObject("fileName", fileName.toString());
			mav.addObject("bbsPostId", bbsPostId);
			mav.addObject("title", bbs.getBbsTitle());
			mav.addObject("systemName", bbs.getBbsCategory());
			mav.addObject("content", bbs.getBbsContent());
			mav.addObject("noticeView", bbs);
		}catch(Exception e){
			e.printStackTrace();
			
		}

		return mav;
	}
	
	@RequestMapping("/notice/reg.do")							
	public ModelAndView notificationReg(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/reg/noticeReg");
		return mav;
	}
	
	
	@RequestMapping("/notice/mod.do")							
	public ModelAndView notificationMod(HttpServletRequest request, HttpServletResponse response) {
				
		ModelAndView mav = new ModelAndView("/mod/noticeMod");
		
		try{
			String bbsPostId = (String)request.getParameter("bbsPostId");
			BdapBbs bdapBbs = bbsService.getBbsbyId(bbsPostId);
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			StringBuffer fileName = new StringBuffer();
		       
	        List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId);
		
	        if(bdapFileList.size() > 0){
	        	String fileStorePath = BbsConstant.FILE_STORE_PATH+File.separator;
				String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+bdapUser.getUserId();
				
				File directory = new File(fileTempPath);
		        if(directory.exists() == false){
		        	directory.mkdirs();
		        }
		       for(int i = 0; i < bdapFileList.size(); i++){
					BdapFile bdapFile = bdapFileList.get(i);
					
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
					
					fileName.append(bdapFile.getFleDisplayNm()).append("*");
				}
	        	
	        }
	        mav.addObject("fileName", fileName.toString());
			mav.addObject("bbsPostId",bbsPostId);
			mav.addObject("bdapBbs",bdapBbs);
	
		}catch(Exception e){
			e.printStackTrace();
		}
				
		return mav;
	}
	
	@RequestMapping("/notice/del.do")							
	public String notificationDel(HttpServletRequest request, HttpServletResponse response) {
				
		String bbsPostIdArr = (String)request.getParameter("bbsPostIdArr");
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
		
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping("/notice/update.do")							
	public String noticeUpdate(HttpServletRequest request, HttpServletResponse response) {
		try{
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			request.setCharacterEncoding("UTF-8");
			
			String title = (String)request.getParameter("title");
			String category = (String)request.getParameter("category");
			String categorySub = (String)request.getParameter("categorySub");
			String content = (String)request.getParameter("content");
			String emerYN = (String)request.getParameter("emerYN");
			String bbsPostId = (String)request.getParameter("bbsPostId");
			
			BdapBbs bdapBbs = bbsService.getBbsbyId(bbsPostId);
			String fileListArr = (String)request.getParameter("fileList");
			
			char yn;
			if(emerYN.equals("emerY")){
				yn = 'Y';
			}else{
				yn = 'N';
			}
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = "";
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);

			bdapBbs.setBbsCategory(category);
			bdapBbs.setBbsType(BbsConstant.BBS_CODE);
			bdapBbs.setBbsTitle(title);
			bdapBbs.setBbsModDt(ts);
			bdapBbs.setBbsDeletedYn('N');
			bdapBbs.setBbsEmergencyYn(yn);
			bdapBbs.setBbsContent(content);
			bdapBbs.setBbsWriterEmail(bdapUser.getUserEmail());
			bdapBbs.setBbsCategorySub(categorySub);
			
			bbsService.noticeInsert(bdapBbs);
		
			List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId);
			
			if(bdapFileList.size() > 0){
				for(int i = 0; i < bdapFileList.size(); i++){
					BdapFile bdapFile = bdapFileList.get(i); 
					fileService.fileDelete(bdapFile);
				}
			}
			
			if(!fileListArr.equals("")){
				String[] fileList = fileListArr.split("\\*");
				
				if(fileListArr.contains("*")){
					
					String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+bdapUser.getUserId();
					String filePath = BbsConstant.FILE_STORE_PATH+File.separator;
					
					File directory = new File(filePath);
		 	        if(directory.exists() == false){
		 	        	directory.mkdirs();
		 	        }
					
					for(int i = 0; i <fileList.length; i++){
						BdapFile bdapFile = new BdapFile();
						String fileStrNm = UUID.randomUUID().toString().replaceAll("\\-", "");
				
						FileInputStream inputStream = new FileInputStream(fileTempPath + File.separator + fileList[i]);        
						FileOutputStream outputStream = new FileOutputStream(filePath + fileStrNm);
						  
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
			}
		}catch(Exception e){
			e.printStackTrace();	
		}
		
		return "redirect:/notice/list.do";
	}
	
	

		@RequestMapping("/noticeReplyInsert.do")						
		public String noticeReplyInsert(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
			try {

				HttpSession session = request.getSession();
				
				BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
				request.setCharacterEncoding("UTF-8");
				
				String title = (String)request.getParameter("replyTitle");
				String content = (String)request.getParameter("replyContent");
				String fileListArr = (String)request.getParameter("replyFileList");
				String parentPostId = (String)request.getParameter("parentPostId");
				
				BdapBbs bdapBbs = new BdapBbs();
				
				SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String today = "";
				today = formatter.format(cal.getTime());
				Timestamp ts = Timestamp.valueOf(today);

				bdapBbs.setBbsType(BbsConstant.BBS_CODE);
				bdapBbs.setBbsTitle(title);
				bdapBbs.setBbsRegDt(ts);
				bdapBbs.setBbsDeletedYn('N');
				bdapBbs.setBbsParentBbsId(parentPostId);
				bdapBbs.setBbsContent(content);
				bdapBbs.setBbsHit(0);
				bdapBbs.setBbsWriterId(bdapUser.getUserId());
				bdapBbs.setBbsWriterEmail(bdapUser.getUserEmail());
				bdapBbs.setBbsWriterNm(bdapUser.getUserNm());
				
				bdapBbs = bbsService.noticeInsert(bdapBbs);
				
				String[] fileList = fileListArr.split("\\*");
				
				if(!fileListArr.equals("")){
					if(fileList.length != 0 && fileListArr.contains("*")){
						
						String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+bdapUser.getUserId();
						String filePath = BbsConstant.FILE_STORE_PATH+File.separator;
						
						File directory = new File(filePath);
			 	        if(directory.exists() == false){
			 	        	directory.mkdirs();
			 	        }
						
						for(int i = 0; i <fileList.length; i++){
							BdapFile bdapFile = new BdapFile();
							String fileStrNm = UUID.randomUUID().toString().replaceAll("\\-", "");
				
							FileInputStream inputStream = new FileInputStream(fileTempPath + File.separator + fileList[i]);        
							FileOutputStream outputStream = new FileOutputStream(filePath + fileStrNm);
							  
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
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return "redirect:/noticeList.do";
		}
	
		@RequestMapping("/notice/ReplyUpdate.do")							
		public String ReplyUpdate(HttpServletRequest request, HttpServletResponse response) {
			
			try{
				
				HttpSession session = request.getSession();
				BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
				request.setCharacterEncoding("UTF-8");
				
				String title = (String)request.getParameter("replyTitle");
				String content = (String)request.getParameter("replyContent");
				String fileListArr = (String)request.getParameter("replyFileList");
				String bbsChildId = (String)request.getParameter("bbsChildId");
				
				BdapBbs bdapBbs = bbsService.getBbsbyId(bbsChildId);
				
				
				SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String today = "";
				today = formatter.format(cal.getTime());
				Timestamp ts = Timestamp.valueOf(today);

				bdapBbs.setBbsType(BbsConstant.BBS_CODE);
				bdapBbs.setBbsTitle(title);
				bdapBbs.setBbsModDt(ts);
				bdapBbs.setBbsDeletedYn('N');
				bdapBbs.setBbsContent(content);
				bdapBbs.setBbsWriterEmail(bdapUser.getUserEmail());
				
				bbsService.noticeInsert(bdapBbs);
			
				List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsChildId);
				
				if(bdapFileList.size() > 0){
					for(int i = 0; i < bdapFileList.size(); i++){
						BdapFile bdapFile = bdapFileList.get(i); 
						fileService.fileDelete(bdapFile);
					}
				}
				
				String[] fileList = fileListArr.split("\\*");
							
				if(fileListArr.contains("*")){
					
					String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+bdapUser.getUserId();
					String filePath = BbsConstant.FILE_STORE_PATH+File.separator;
					
					File directory = new File(filePath);
		 	        if(directory.exists() == false){
		 	        	directory.mkdirs();
		 	        }
					
					for(int i = 0; i <fileList.length; i++){
						BdapFile bdapFile = new BdapFile();
						String fileStrNm = UUID.randomUUID().toString().replaceAll("\\-", "");
				
						FileInputStream inputStream = new FileInputStream(fileTempPath + File.separator + fileList[i]);        
						FileOutputStream outputStream = new FileOutputStream(filePath + fileStrNm);
						  
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
			return "redirect:/notice/list.do";
		}
}
