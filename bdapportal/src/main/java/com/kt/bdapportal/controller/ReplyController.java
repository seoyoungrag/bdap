package com.kt.bdapportal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.BbsConstant;
import com.kt.bdapportal.common.util.QnaMailing;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.domain.BdapBbsCategory;
import com.kt.bdapportal.domain.BdapComment;
import com.kt.bdapportal.domain.BdapFile;
import com.kt.bdapportal.domain.BdapQna;
import com.kt.bdapportal.service.BbsService;
import com.kt.bdapportal.service.CategoryService;
import com.kt.bdapportal.service.CommentService;
import com.kt.bdapportal.service.FileService;
import com.kt.bdapportal.service.QnaService;

@Controller
public class ReplyController {

	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private CommentService commentService;

	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/reply/reg.do")						
	public ModelAndView noticeReplyReg(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		ModelAndView mav = new ModelAndView("/reg/replyReg");
		
		try{
			
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USER_ID");
			
			String bbsPostId = (String)request.getParameter("bbsPostId");
			String bbsType = (String)request.getParameter("bbsType");
			
			BdapBbs bbs = bbsService.getBbsbyId(bbsPostId);
			BdapQna bdapQna = new BdapQna(); 
			SearchVO searchVO = new SearchVO();
			if(bbsType.equals("BO2")){
				bdapQna = qnaService.getQnabyId(bbsPostId);
				searchVO.setProcessStatus(bdapQna.getQnaStatus());
				mav.addObject("searchVO", searchVO);
			}
			
			int hit = bbs.getBbsHit();
			bbs.setBbsHit(++hit);
			bbs = bbsService.noticeInsert(bbs);
			
 	        String fileName = "";
 	       
 	        List<BdapComment> bdapCmtList = commentService.getCommentList(bbsPostId);
 	        long cmtCount = commentService.countByCmtParentBbsId(bbsPostId); 
 	        List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId);
			
 	        if(bdapFileList.size() > 0){
 	        	String fileStorePath = BbsConstant.FILE_STORE_PATH+File.separator;
 				String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+userId;
 				
 				File directory = new File(fileTempPath);
 		        if(directory.exists() == false){
 		        	directory.mkdirs();
 		        }
 		       for(int i = 0; i < bdapFileList.size(); i++){
 					BdapFile bdapFile = bdapFileList.get(i);
 					
 					/*FileInputStream fis = new FileInputStream(fileStorePath + bdapFile.getFleStroNm());
 					FileOutputStream fos = new FileOutputStream(fileTempPath + File.separator + bdapFile.getFleDisplayNm());
 					int data = 0;
 					while((data=fis.read())!=-1) {
 						fos.write(data);
 					}
 					fis.close();
 					fos.close();*/
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
 					fileName += bdapFile.getFleDisplayNm()+"*"; 
 				}
 	        }
 	        mav.addObject("bbsType", bbsType);
 	        mav.addObject("cmtCount", cmtCount);
 	       	mav.addObject("bdapCmtList", bdapCmtList);
			mav.addObject("fileName", fileName);
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
	

		@RequestMapping("/reply/insert.do")							
		public String noticeReplyInsert(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
					
			/*ModelAndView mav = new ModelAndView("/list/noticeList");*/
			String rtnUrl = "";
			try {

				HttpSession session = request.getSession();
				
				String userId = (String)session.getAttribute("USER_ID");
				String userNm = (String)session.getAttribute("USER_NM");
				String userMail = (String)session.getAttribute("USER_MAIL");
				
				request.setCharacterEncoding("UTF-8");
				
				String title = (String)request.getParameter("replyTitle");
				String content = (String)request.getParameter("replyContent");
				String fileListArr = (String)request.getParameter("replyFileList");
				String parentPostId = (String)request.getParameter("parentPostId");
				String bbsType = (String)request.getParameter("bbsType");
				String qnaStatus = "";
				
				if(bbsType.equals("BO1")){
					rtnUrl = "redirect:/notice/list.do";
				}else if(bbsType.equals("BO2")){
					String expectDate = (String)request.getParameter("expectDate");
					
					SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd");
					Date qnaExpectedAnsDate = transFormat.parse(expectDate);
					
					rtnUrl = "redirect:/qna/list.do";
					qnaStatus = (String)request.getParameter("qnaStatus");
					char status = ' ';
					if(qnaStatus.equals("P")){
						status = 'P';
					}else if(qnaStatus.equals("S")){
						status = 'S';
					}else if(qnaStatus.equals("R")){
						status = 'R';
					}
					BdapQna bdapQna = qnaService.getQnabyId(parentPostId);
					bdapQna.setQnaStatus(status);
					bdapQna.setQnaExpectedAnsDate(new java.sql.Date(qnaExpectedAnsDate.getTime()));
					bdapQna = qnaService.qnaInsert(bdapQna);
					BdapBbs parentBbs = bbsService.getBbsbyId(parentPostId);
					try{
						//답변자 정보는 jsp단에서 처리되서 넘어와야할 것이었음..
						BdapBbsCategory categoryVo = categoryService.findCurrentCategory(parentBbs);
						
						QnaMailing qnaMailing = new QnaMailing();
						List<String> recipientList = new ArrayList<String>();
						recipientList.add(parentBbs.getBbsWriterEmail());
						recipientList.add(categoryVo.getCateResponserEmail());
						qnaMailing.sendMail(qnaMailing.makeContents(recipientList, title, content, qnaStatus.charAt(0)));
					}catch(Exception e){
						e.printStackTrace();
					}
				}else if(bbsType.equals("BO3")){
					rtnUrl = "redirect:/reference/list.do";
				}else if(bbsType.equals("BO4")){
					rtnUrl = "redirect:/linkage/list.do";
				}else if(bbsType.equals("BO5")){
					rtnUrl = "redirect:/devreq/list.do";
				}
				
				BdapBbs bdapBbs = new BdapBbs();
				
				SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String today = "";
				today = formatter.format(cal.getTime());
				Timestamp ts = Timestamp.valueOf(today);

				bdapBbs.setBbsType(bbsType);
				bdapBbs.setBbsTitle(title);
				bdapBbs.setBbsRegDt(ts);
				bdapBbs.setBbsDeletedYn('N');
				bdapBbs.setBbsParentBbsId(parentPostId);
				bdapBbs.setBbsContent(content);
				bdapBbs.setBbsHit(0);
				bdapBbs.setBbsWriterId(userId);
				bdapBbs.setBbsWriterEmail(userMail);
				bdapBbs.setBbsWriterNm(userNm);
				
				bdapBbs = bbsService.noticeInsert(bdapBbs);
				
				String[] fileList = fileListArr.split("\\*");
				
				if(fileList.length != 0 && fileListArr.contains("*")){
					
					String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+userId;
					String filePath = BbsConstant.FILE_STORE_PATH+File.separator;
					
					File directory = new File(filePath);
		 	        if(directory.exists() == false){
		 	        	directory.mkdirs();
		 	        }
					
					for(int i = 0; i <fileList.length; i++){
						BdapFile bdapFile = new BdapFile();
						String fileStrNm = UUID.randomUUID().toString().replaceAll("\\-", "");
						/*FileInputStream fis = new FileInputStream(fileTempPath + File.separator + fileList[i]);
						FileOutputStream fos = new FileOutputStream(filePath + fileStrNm);
						   
						int data = 0;
						while((data=fis.read())!=-1) {
							fos.write(data);
						}
						fis.close();
						fos.close();*/
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
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return rtnUrl;
			//return mav;
		}
	
		@RequestMapping("/reply/mod.do")							
		public ModelAndView noticeReplyMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
					
			ModelAndView mav = new ModelAndView("/mod/replyMod");
			
			try{
				
				HttpSession session = request.getSession();
				String userId = (String)session.getAttribute("USER_ID");
				
				String bbsPostId = (String)request.getParameter("bbsParentId");
				String bbsChildId = (String)request.getParameter("bbsPostId");
				BdapBbs bbs = bbsService.getBbsbyId(bbsPostId);
				BdapBbs bbsChild = bbsService.getBbsbyId(bbsChildId);
				String bbsType = (String)request.getParameter("bbsType");
				
				BdapQna bdapQna = new BdapQna(); 
				SearchVO searchVO = new SearchVO();
				if(bbsType.equals("BO2")){
					bdapQna = qnaService.getQnabyId(bbsPostId);
					searchVO.setProcessStatus(bdapQna.getQnaStatus());
					mav.addObject("searchVO", searchVO);
				}
				
				int hit = bbs.getBbsHit();
				bbs.setBbsHit(++hit);
				bbs = bbsService.noticeInsert(bbs);
				
	 	        String fileName = "";
	 	        String fileNameForChild = "";
	 	       
	 	        List<BdapComment> bdapCmtList = commentService.getCommentList(bbsPostId);
	 	        long cmtCount = commentService.countByCmtParentBbsId(bbsPostId); 
	 	        List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId);
	 	        
	 	        List<BdapComment> bdapCmtListForChild = commentService.getCommentList(bbsChildId);
	 	        long cmtCountForChild = commentService.countByCmtParentBbsId(bbsChildId); 
	 	        List<BdapFile> bdapFileListForChild =  fileService.getFileListbyParentId(bbsChildId);
	 	        
				
	 	        if(bdapFileList.size() > 0){
	 	        	String fileStorePath = BbsConstant.FILE_STORE_PATH+File.separator;
	 				String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+userId;
	 				
	 				File directory = new File(fileTempPath);
	 		        if(directory.exists() == false){
	 		        	directory.mkdirs();
	 		        }
	 		       for(int i = 0; i < bdapFileList.size(); i++){
	 					BdapFile bdapFile = bdapFileList.get(i);
	 					
	 					/*FileInputStream fis = new FileInputStream(fileStorePath + bdapFile.getFleStroNm());
	 					FileOutputStream fos = new FileOutputStream(fileTempPath + File.separator + bdapFile.getFleDisplayNm());
	 					int data = 0;
	 					while((data=fis.read())!=-1) {
	 						fos.write(data);
	 					}
	 					fis.close();
	 					fos.close();*/
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
	 					fileName += bdapFile.getFleDisplayNm()+"*"; 
	 				}
	 	        	
	 	        }
	 	        
	 	       if(bdapFileListForChild.size() > 0){
	 	        	String fileStorePath = BbsConstant.FILE_STORE_PATH+File.separator;
	 				String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+userId;
	 				
	 				File directory = new File(fileTempPath);
	 		        if(directory.exists() == false){
	 		        	directory.mkdirs();
	 		        }
	 		       for(int i = 0; i < bdapFileListForChild.size(); i++){
	 					BdapFile bdapFile = bdapFileListForChild.get(i);
	 					
	 					/*FileInputStream fis = new FileInputStream(fileStorePath + bdapFile.getFleStroNm());
	 					FileOutputStream fos = new FileOutputStream(fileTempPath + File.separator + bdapFile.getFleDisplayNm());
	 					int data = 0;
	 					while((data=fis.read())!=-1) {
	 						fos.write(data);
	 					}
	 					fis.close();
	 					fos.close();*/
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
	 					
	 					fileNameForChild += bdapFile.getFleDisplayNm()+"*"; 
	 				}
	 	        	
	 	        }
	 	       
	 	        mav.addObject("cmtCount", cmtCount);
	 	       	mav.addObject("bdapCmtList", bdapCmtList);
				mav.addObject("fileName", fileName);
				mav.addObject("bbsPostId", bbsPostId);
				mav.addObject("bbsChildId", bbsChildId);
				mav.addObject("title", bbs.getBbsTitle());
				mav.addObject("systemName", bbs.getBbsCategory());
				mav.addObject("content", bbs.getBbsContent());
				mav.addObject("noticeView", bbs);
				mav.addObject("cmtCountForChild", cmtCountForChild);
	 	       	mav.addObject("bdapCmtListForChild", bdapCmtListForChild);
				mav.addObject("fileNameForChild", fileNameForChild);
				mav.addObject("titleForChild", bbsChild.getBbsTitle());
				mav.addObject("contentForChild", bbsChild.getBbsContent());
				mav.addObject("noticeViewForChild", bbsChild);
				mav.addObject("bbsType", bbsType);
			}catch(Exception e){
				e.printStackTrace();
				
			}

			return mav;
		}
	
		@RequestMapping("/reply/update.do")							
		public String replyUpdate(HttpServletRequest request, HttpServletResponse response) {
			
			String rtnUrl = "";
			try{
				
				HttpSession session = request.getSession();
				String userId = (String)session.getAttribute("USER_ID");
				request.setCharacterEncoding("UTF-8");
				
				String title = (String)request.getParameter("replyTitle");
				String content = (String)request.getParameter("replyContent");
				String fileListArr = (String)request.getParameter("replyFileList");
				String bbsChildId = (String)request.getParameter("bbsChildId");
				String parentPostId = (String)request.getParameter("parentPostId");
				
				String qnaStatus = "";
				BdapBbs bdapBbs = bbsService.getBbsbyId(bbsChildId);
				String bbsType = (String)request.getParameter("bbsType");
				
				if(bbsType.equals("BO1")){
					rtnUrl = "redirect:/notice/list.do";
				}else if(bbsType.equals("BO2")){
					rtnUrl = "redirect:/qna/list.do";
					qnaStatus = (String)request.getParameter("qnaStatus");
					char status = ' ';
					if(qnaStatus.equals("P")){
						status = 'P';
					}else if(qnaStatus.equals("S")){
						status = 'S';
					}else if(qnaStatus.equals("R")){
						status = 'R';
					}
					BdapQna bdapQna = qnaService.getQnabyId(parentPostId);
					bdapQna.setQnaStatus(status);
					bdapQna = qnaService.qnaInsert(bdapQna);
					BdapBbs parentBbs = bbsService.getBbsbyId(parentPostId);
					try{
						//답변자 정보는 jsp단에서 처리되서 넘어와야할 것이었음..
						BdapBbsCategory categoryVo = categoryService.findCurrentCategory(parentBbs);
						
						QnaMailing qnaMailing = new QnaMailing();
						List<String> recipientList = new ArrayList<String>();
						recipientList.add(parentBbs.getBbsWriterEmail());
						recipientList.add(categoryVo.getCateResponserEmail());
						qnaMailing.sendMail(qnaMailing.makeContents(recipientList, title, content, qnaStatus.charAt(0)));
					}catch(Exception e){
						e.printStackTrace();
					}
				}else if(bbsType.equals("BO3")){
					rtnUrl = "redirect:/reference/list.do";
				}else if(bbsType.equals("BO4")){
					rtnUrl = "redirect:/linkage/list.do";
				}else if(bbsType.equals("BO5")){
					rtnUrl = "redirect:/devreq/list.do";
				}
				
				SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String today = "";
				today = formatter.format(cal.getTime());
				Timestamp ts = Timestamp.valueOf(today);

				bdapBbs.setBbsType(bbsType);
				bdapBbs.setBbsTitle(title);
				bdapBbs.setBbsModDt(ts);
				bdapBbs.setBbsDeletedYn('N');
				bdapBbs.setBbsContent(content);
				
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
					
					String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+userId;
					String filePath = BbsConstant.FILE_STORE_PATH+File.separator;
					
					File directory = new File(filePath);
		 	        if(directory.exists() == false){
		 	        	directory.mkdirs();
		 	        }
					
					for(int i = 0; i <fileList.length; i++){
						BdapFile bdapFile = new BdapFile();
						String fileStrNm = UUID.randomUUID().toString().replaceAll("\\-", "");
						/*FileInputStream fis = new FileInputStream(fileTempPath + File.separator + fileList[i]);
						FileOutputStream fos = new FileOutputStream(filePath + fileStrNm);
						   
						int data = 0;
						while((data=fis.read())!=-1) {
							fos.write(data);
						}
						fis.close();
						fos.close();*/
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
			return rtnUrl;
		}
	
	
}
