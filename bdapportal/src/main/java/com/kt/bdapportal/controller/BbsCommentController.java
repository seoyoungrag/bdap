package com.kt.bdapportal.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kt.bdapportal.domain.BdapComment;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.service.CommentService;

import net.sf.json.JSONObject;

@Controller
public class BbsCommentController {

	
	@Autowired
	private CommentService commentService;
	
	
	
	
	@RequestMapping("/commentReg.do")				
	public void commentReg(HttpServletRequest request, HttpServletResponse response){
		
		try{
			
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			request.setCharacterEncoding("UTF-8");
			
			String comment = (String)request.getParameter("comment");				
			String bbsPostId = (String)request.getParameter("bbsPostId");			
			
			BdapComment bdapComment = new BdapComment();
	
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = "";
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);
			
			bdapComment.setCmtParentBbsId(bbsPostId);
			bdapComment.setCmtContent(comment);
			bdapComment.setCmtRegDt(ts);
			bdapComment.setCmtDeletedYn('N');
			bdapComment.setCmtWriterId(bdapUser.getUserId());
			bdapComment.setCmtWriterEmail(bdapUser.getUserEmail());
			bdapComment.setCmtWriterNm(bdapUser.getUserNm());
			
			bdapComment = commentService.commentInsert(bdapComment);
			long cmtCount = commentService.countByCmtParentBbsId(bbsPostId);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("commentContent", comment);
			jsonObj.put("cmtCount", cmtCount);
			jsonObj.put("commentId", bdapComment.getCmtId());
			jsonObj.put("commentWriterId", bdapComment.getCmtWriterId());
			jsonObj.put("commentRegDt", bdapComment.getCmtRegDt());
			
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
			
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			
		}
	
	}
	
	@RequestMapping("/commentUpdate.do")				
	public void commentUpdate(HttpServletRequest request, HttpServletResponse response){
		
		try{
			
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			request.setCharacterEncoding("UTF-8");
			
			String commentContent = (String)request.getParameter("commentContent");				
			String bbsPostId = (String)request.getParameter("bbsPostId");			
			String commentId = (String)request.getParameter("commentId");			
			
			BdapComment bdapComment = new BdapComment();
	
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = "";
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);
			
			bdapComment.setCmtId(commentId);
			bdapComment.setCmtParentBbsId(bbsPostId);
			bdapComment.setCmtContent(commentContent);
			bdapComment.setCmtRegDt(ts);
			bdapComment.setCmtDeletedYn('N');
			bdapComment.setCmtWriterId(bdapUser.getUserId());
			bdapComment.setCmtWriterEmail(bdapUser.getUserEmail());
			bdapComment.setCmtWriterNm(bdapUser.getUserNm());
			
			commentService.commentInsert(bdapComment);
		
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("commentContent", commentContent);
			jsonObj.put("commentId", commentId);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
			
			
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			
		}
	
	
	}
	
	@RequestMapping("/commentDelete.do")				
	public void commentDelete(HttpServletRequest request, HttpServletResponse response){
		
		try{
			
			HttpSession session = request.getSession();
			request.setCharacterEncoding("UTF-8");
			
			String commentId = (String)request.getParameter("commentId");		
			String bbsPostId = (String)request.getParameter("bbsPostId");
			
			BdapComment bdapComment = new BdapComment();
			bdapComment.setCmtId(commentId);
			commentService.commentDelete(bdapComment);
			
			long cmtCount = commentService.countByCmtParentBbsId(bbsPostId);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("commentId", commentId);
			jsonObj.put("cmtCount", cmtCount);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
			
			
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			
		}
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
}
