package com.kt.bdapportal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.FileChannel;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class QnaController {

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
	
	public void setBbsService(BbsService bbsService){
		this.bbsService = bbsService;
	}
	
	
	@RequestMapping("/qna/list.do")				
	public ModelAndView qnaList(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("/list/qnaList");
		
		try{
			
			request.setCharacterEncoding("UTF-8");
			
			String processStatus = (String)request.getParameter("processStatus");				
			String minePostYN = (String)request.getParameter("minePostYN");		
			String startDate = (String)request.getParameter("startDate");				//startDate
			String endDate = (String)request.getParameter("endDate");					//endDate
			String searchType = (String)request.getParameter("searchType");				//searchType
			String searchWord = (String)request.getParameter("searchWord");				//searchWord
			String question = (String)request.getParameter("question");		
			
			SearchVO searchVO = new SearchVO();
			
			processStatus = searchVO.nullTrim(processStatus);
			minePostYN = searchVO.nullTrim(minePostYN);
			startDate = searchVO.nullTrim(startDate);
			endDate = searchVO.nullTrim(endDate);
			searchType = searchVO.nullTrim(searchType);
			searchWord = searchVO.nullTrim(searchWord);
			question = searchVO.nullTrim(question,"N");
			
			char status = ' ';
			if(processStatus.equals("P")){
				status = 'P';
			}else if(processStatus.equals("S")){
				status = 'S';
			}else if(processStatus.equals("R")){
				status = 'R';
			}
			
			char mineYn = ' ';
			if(minePostYN.equals("Y")){
				mineYn = 'Y';
			}
			
			
			searchVO.setProcessStatus(status);
			searchVO.setMinePostYN(mineYn);
			searchVO.setStartDate(startDate);
			searchVO.setEndDate(endDate);
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
			searchVO.setQuestionYn(question);
			
			mav.addObject("searchVO", searchVO);	
			
			
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			
		}
	
	return mav;
	
	}
	
	
	@RequestMapping("/getQnaList.do")						
	public void getQnaList(HttpServletRequest request, HttpServletResponse response, @PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable) {
		
		try{
			
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USER_ID");
			
			String processStatus = (String)request.getParameter("processStatus");				
			String minePostYN = (String)request.getParameter("minePostYN");		
			String question = (String)request.getParameter("question");		
			
			String startDate = (String)request.getParameter("startDate");				//startDate
			String endDate = (String)request.getParameter("endDate");					//endDate
			String searchType = (String)request.getParameter("searchType");				//searchType
			String searchWord = (String)request.getParameter("searchWord");				//searchWord
			
			char status = ' ';
			if(processStatus.equals("P")){
				status = 'P';
			}else if(processStatus.equals("S")){
				status = 'S';
			}else if(processStatus.equals("R")){
				status = 'R';
			}
			
			char mineYn = ' ';
			if(minePostYN.equals("Y")){
				mineYn = 'Y';
			}
			
			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String)request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String)request.getParameter("rows"));
			
			SearchVO searchVO = new SearchVO();
			
			searchVO.setProcessStatus(status);
			searchVO.setMinePostYN(mineYn);
			searchVO.setQuestionYn(question);
			searchVO.setStartDate(startDate);
			searchVO.setEndDate(endDate);
			searchVO.setSearchType(searchType);
			searchVO.setSearchWord(searchWord);
			searchVO.setUserId(userId);
			
			int startnum = (page-1)*rows;				
			
			List<BdapBbs> bbsList =	bbsService.getQnaList(searchVO,startnum,rows);	
			
			long qnaListCount = bbsService.getQnaListCount(BbsConstant.QNA_CODE,searchVO);
			long qnaStatusProcess = qnaService.qnaStatus(BbsConstant.QNA_STATUS_PROCESS);
			long qnaStatusComplete = qnaService.qnaStatus(BbsConstant.QNA_STATUS_COMPLETE);
			long qnaStatusProcessReq = qnaService.qnaStatus(BbsConstant.QNA_STATUS_REQ);
			
			int bbsListSize = bbsList.size();
			
			JSONArray jsonArray = new JSONArray();
			
			for(int i = 0; i < bbsListSize; i++){
				JSONObject jsonObj1 = new JSONObject();
				BdapBbs bbs = bbsList.get(i);
				BdapQna bbsQna = qnaService.getQnabyId(bbs.getBbsId());
				
				jsonObj1.put("category", bbs.getBbsCategory());
				jsonObj1.put("title", bbs.getBbsTitle());
				jsonObj1.put("postId", bbs.getBbsId());
				if(bbsQna != null){						
					jsonObj1.put("status",bbsQna.getQnaStatus());
					jsonObj1.put("responsername", searchVO.nullTrim(bbsQna.getQnaResponserNm()));
					jsonObj1.put("expectDate", bbsQna.getQnaExpectedAnsDate()!=null? bbsQna.getQnaExpectedAnsDate().toString():"");
				}else{
					jsonObj1.put("status","");
					jsonObj1.put("responsername", "");
					jsonObj1.put("expectDate", "");
				}
				
				jsonObj1.put("wirterName", bbs.getBbsWriterNm());
				jsonObj1.put("wirterId", bbs.getBbsWriterId());
				jsonObj1.put("regDate", bbs.getBbsRegDt().toString());
				if(bbs.getBbsParentBbsId() == null){
					jsonObj1.put("parentId", "");						
				}else{
					jsonObj1.put("parentId",bbs.getBbsParentBbsId());
				}
				
				jsonArray.add(jsonObj1);
			}
			
			int forLastPage = (qnaListCount % rows > 0)? 1:0;
			jsonObj.put("records", qnaListCount);
			jsonObj.put("total", (qnaListCount/rows)+forLastPage) ;
			jsonObj.put("rows", jsonArray);
			
			jsonObj.put("qnaStatusProcess", qnaStatusProcess);
			jsonObj.put("qnaStatusComplete", qnaStatusComplete);
			jsonObj.put("qnaStatusReq", qnaStatusProcessReq);
			
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/qna/insert.do")							
	public String qnaInsert(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {

		try {

			HttpSession session = request.getSession();
			
			String userId = (String)session.getAttribute("USER_ID");
			String userNm = (String)session.getAttribute("USER_NM");
			String userMail = (String)session.getAttribute("USER_MAIL");
			request.setCharacterEncoding("UTF-8");
			
			String title = (String)request.getParameter("title");
			String responsibility = (String)request.getParameter("responsibility");
			String category = (String)request.getParameter("category");
			String categorySub = (String)request.getParameter("categorySub");
			String content = (String)request.getParameter("content");
			String fileListArr = (String)request.getParameter("fileList");
			
			BdapBbs bdapBbs = new BdapBbs();
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = "";
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);
			
			bdapBbs.setBbsCategory(category);
			bdapBbs.setBbsType(BbsConstant.QNA_CODE);
			bdapBbs.setBbsTitle(title);
			bdapBbs.setBbsRegDt(ts);
			bdapBbs.setBbsDeletedYn('N');
			bdapBbs.setBbsEmergencyYn('N');
			bdapBbs.setBbsContent(content);
			bdapBbs.setBbsHit(0);
			bdapBbs.setBbsWriterId(userId);
			bdapBbs.setBbsWriterEmail(userMail);			
			bdapBbs.setBbsWriterNm(userNm);
			bdapBbs.setBbsCategorySub(categorySub);
			
			bdapBbs = bbsService.qnaInsert(bdapBbs);
			
			BdapQna bdapQna = new BdapQna();
			
			bdapQna.setBbsId(bdapBbs.getBbsId());
			bdapQna.setQnaStatus(BbsConstant.QNA_STATUS_PROCESS);
			bdapQna.setQnaResponserNm(responsibility);
			bdapQna.setQnaCreateDt(ts);
			
			bdapQna = qnaService.qnaInsert(bdapQna);
			
			try{
				//답변자 정보는 jsp단에서 처리되서 넘어와야할 것이었음..
				BdapBbsCategory categoryVo = categoryService.findCurrentCategory(bdapBbs);
				
				QnaMailing qnaMailing = new QnaMailing();
				List<String> recipientList = new ArrayList<String>();
				recipientList.add(bdapBbs.getBbsWriterEmail());
				recipientList.add(categoryVo.getCateResponserEmail());
				qnaMailing.sendMail(qnaMailing.makeContents(recipientList, bdapBbs.getBbsTitle(), bdapBbs.getBbsContent(), 'N'));
			}catch(Exception e){
				e.printStackTrace();
			}
			if(!fileListArr.equals("")){
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
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/qna/list.do";
		//return mav;
	}
	
	
	
	@RequestMapping("/qna/view.do")							
	public ModelAndView qnaView(HttpServletRequest request, HttpServletResponse response) {
				
		ModelAndView mav = new ModelAndView("/view/qnaView");
		
		try{
			
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USER_ID");
			
			String bbsPostId = (String)request.getParameter("bbsPostId");
			
			BdapBbs bbs = bbsService.getBbsbyId(bbsPostId);
			BdapQna bbsQna = qnaService.getQnabyId(bbsPostId);
			String fileName = "";
	 	       
			int hit = bbs.getBbsHit();
			bbs.setBbsHit(++hit);
			bbsService.qnaInsert(bbs);
			
			
 	        List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId);
 	       List<BdapComment> bdapCmtList = commentService.getCommentList(bbsPostId);
 	       long cmtCount = commentService.countByCmtParentBbsId(bbsPostId);
			
 	        if(bdapFileList.size() > 0){
 	        	String fileStorePath = BbsConstant.FILE_STORE_PATH;
 				String fileTempPath = BbsConstant.FILE_TEMP_PATH+File.separator+userId;
 				
 				File directory = new File(fileTempPath);
 		        if(directory.exists() == false){
 		        	directory.mkdirs();
 		        }
 		       for(int i = 0; i < bdapFileList.size(); i++){
 					BdapFile bdapFile = bdapFileList.get(i);
 					
 					if(bdapFile != null){
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
 	        }
 	        
 	        mav.addObject("cmtCount", cmtCount);
 	        mav.addObject("bdapCmtList", bdapCmtList);
 	        mav.addObject("qnaSubView", bbsQna);
			mav.addObject("fileName", fileName);
			mav.addObject("bbsPostId", bbsPostId);
			mav.addObject("title", bbs.getBbsTitle());
			mav.addObject("systemName", bbs.getBbsCategory());
			mav.addObject("content", bbs.getBbsContent());
			mav.addObject("qnaView", bbs);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mav;
	}
	
	

	@RequestMapping("/qna/reg.do")							
	public ModelAndView qnaReg(HttpServletRequest request, HttpServletResponse response) {
				
		ModelAndView mav = new ModelAndView("/reg/qnaReg");
		
		List<BdapBbsCategory> bdapBbsCategory =  categoryService.bdapBbsCategory(BbsConstant.QNA_CODE);
		List<BdapBbsCategory> bdapBbsCategorySub =  categoryService.bdapSubBbsCategory(BbsConstant.QNA_CODE,bdapBbsCategory.get(0).getCateId());
		mav.addObject("bdapBbsCategory", bdapBbsCategory);
		mav.addObject("bdapBbsCategorySub", bdapBbsCategorySub);
		
		return mav;
	}
	
	@RequestMapping("/getQnaSubCategory.do")
	public void getQnaSubCategory(HttpServletRequest request, HttpServletResponse response){
		
		try{

			String subCategory = (String)request.getParameter("subCategory");									
			List<BdapBbsCategory> bdapBbsCategory =  categoryService.bdapSubBbsCategory(BbsConstant.QNA_CODE,subCategory);
			JSONObject jsonObj = new JSONObject();
			
		    jsonObj.put("cateList", bdapBbsCategory);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	
	@RequestMapping("/qna/mod.do")							
	public ModelAndView qnaMod(HttpServletRequest request, HttpServletResponse response) {
				
		ModelAndView mav = new ModelAndView("/mod/qnaMod");
		
		try{
			String bbsPostId = (String)request.getParameter("bbsPostId");
			BdapBbs bdapBbs = bbsService.getBbsbyId(bbsPostId);
			BdapQna bbsQna = qnaService.getQnabyId(bbsPostId);
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
			mav.addObject("qnaView",bdapBbs);
			mav.addObject("qnaViewSub",bbsQna);

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping("/qna/del.do")							
	public String qnaDel(HttpServletRequest request, HttpServletResponse response) {
				
		try{
			String bbsPostIdArr = request.getParameter("bbsPostIdArr");
			String[] bbsPostId = bbsPostIdArr.split("\\^");
			
			for(int i = 0; i < bbsPostId.length; i++){
				BdapBbs bdapBbs = bbsService.getBbsbyId(bbsPostId[i]);
				bbsService.noticeDelete(bdapBbs);
				BdapQna bdapQna = qnaService.getQnabyId(bbsPostId[i]);
				if(bdapQna != null){				
					qnaService.qnaDelete(bdapQna);
				}
				
				List<BdapFile> bdapFileList =  fileService.getFileListbyParentId(bbsPostId[i]);
				
				if(bdapFileList.size() > 0){
					for(int j = 0; j < bdapFileList.size(); j++){
						BdapFile bdapFile = bdapFileList.get(j); 
						fileService.fileDelete(bdapFile);
					}
				}
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/qna/list.do";
	}
	
	@RequestMapping("/qna/update.do")							
	public String qnaUpdate(HttpServletRequest request, HttpServletResponse response) {
		
		try{
			
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USER_ID");
			String userNm = (String)session.getAttribute("USER_NM");
			String userMail = (String)session.getAttribute("USER_MAIL");
			request.setCharacterEncoding("UTF-8");
			
			String title = (String)request.getParameter("title");
			String bbsPostId = (String)request.getParameter("bbsPostId");
			String responsibility = (String)request.getParameter("responsibility");
			String category = (String)request.getParameter("category");
			String categorySub = (String)request.getParameter("categorySub");
			String content = (String)request.getParameter("content");
			String fileListArr = (String)request.getParameter("fileList");
			
			BdapBbs bdapBbs = bbsService.getBbsbyId(bbsPostId);
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = "";
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);
			
			bdapBbs.setBbsCategory(category);
			bdapBbs.setBbsType(BbsConstant.QNA_CODE);
			bdapBbs.setBbsTitle(title);
			bdapBbs.setBbsRegDt(ts);
			bdapBbs.setBbsDeletedYn('N');
			bdapBbs.setBbsEmergencyYn('N');
			bdapBbs.setBbsContent(content);
			bdapBbs.setBbsHit(0);
			bdapBbs.setBbsWriterId(userId);
			bdapBbs.setBbsWriterEmail(userMail);			
			bdapBbs.setBbsWriterNm(userNm);
			bdapBbs.setBbsCategorySub(categorySub);
			
			bdapBbs = bbsService.qnaInsert(bdapBbs);
			BdapQna bdapQna = new BdapQna();
			
			bdapQna.setBbsId(bdapBbs.getBbsId());
			bdapQna.setQnaStatus(BbsConstant.QNA_STATUS_PROCESS);
			bdapQna.setQnaResponserNm(responsibility);
			bdapQna.setQnaCreateDt(ts);
			
			bdapQna = qnaService.qnaInsert(bdapQna);
			

			try{
				//답변자 정보는 jsp단에서 처리되서 넘어와야할 것이었음..
				BdapBbsCategory categoryVo = categoryService.findCurrentCategory(bdapBbs);
				
				QnaMailing qnaMailing = new QnaMailing();
				List<String> recipientList = new ArrayList<String>();
				recipientList.add(bdapBbs.getBbsWriterEmail());
				recipientList.add(categoryVo.getCateResponserEmail());
				qnaMailing.sendMail(qnaMailing.makeContents(recipientList, bdapBbs.getBbsTitle(), bdapBbs.getBbsContent(), bdapQna.getQnaStatus()));
			}catch(Exception e){
				e.printStackTrace();
			}
			
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
		
		
		
		return "redirect:/qna/list.do";
	}
	
	
	@RequestMapping("/qna/response.do")							
	public ModelAndView qnaResponse(HttpServletRequest request, HttpServletResponse response) {
				
		ModelAndView mav = new ModelAndView("/mod/qnaResponserMod");
		
		try{
			String bbsPostId = (String)request.getParameter("bbsPostId");
			BdapBbs bdapBbs = bbsService.getBbsbyId(bbsPostId);
			BdapQna bbsQna = qnaService.getQnabyId(bbsPostId);
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
					boolean isExist = new File(fileStorePath + File.separator + bdapFile.getFleStroNm()).exists();
					if(isExist){
					/*	FileInputStream fis = new FileInputStream(fileStorePath + File.separator + bdapFile.getFleStroNm());
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
	        	
	        }
	        mav.addObject("fileName", fileName);
			mav.addObject("bbsPostId",bbsPostId);
			mav.addObject("qnaView",bdapBbs);
			mav.addObject("qnaViewSub",bbsQna);

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mav;
	}
	
	
	
	
	
	
}
