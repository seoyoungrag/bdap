package com.kt.bdapportal.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.service.BbsService;

public class RoleInterceptor   extends HandlerInterceptorAdapter {
	  
	
	@Autowired
	private BbsService bbsService;
	
	
    @Override
    public boolean preHandle(HttpServletRequest request, 
            HttpServletResponse response, Object handler) throws Exception {
        //System.out.println("preHandle RoleInterceptor");
    	
    	 try {
    
    		 HttpSession session = request.getSession();
    		 
			String hive = "hive";
			String hiveTst = "ndap";
			String hiveReqUrl = request.getRequestURL().toString();
			if(hiveReqUrl.contains(hive) || hiveReqUrl.contains(hiveTst)){
				session.setAttribute("USER_ID", "HIVE");
				session.setAttribute("USER_ACL", "ACL_ALL");
				session.setAttribute("USER_ROLE", "ROLE_ALL");
			}
    		 
             if(session.getAttribute("USER_ID") == null ||  session.getAttribute("USER_ID").equals("")){			//로그인 사용자의 정보가 없으면 로그인 페이지로 이동한다.
                     response.sendRedirect(request.getContextPath()+"/loginpage.do");
                     return false;
             }
             
             String userAcl = (String)session.getAttribute("USER_ACL");												//사용자의 ACL과 ROLE을 가져온다.
             String userRole = (String)session.getAttribute("USER_ROLE");
    		 
             if(userAcl == null){
            	 userAcl = "";
             }
             if(userRole== null){
            	 userRole = "";
             }
             
             if(userRole.contains("ROLE_ALL")){																		//전체 관리자이면 페이지 이동한다.
            	 return true;
             }
             
             String reqUrl = request.getRequestURL().toString();
             
            /* if(reqUrl.contains("noticeReg.do") || reqUrl.contains("noticeMod.do") || reqUrl.contains("noticeDel.do")|| reqUrl.contains("noticeUpdate.do")){*/	//공지사항 등록,수정,삭제의 경우 게시판 관리자 권한이 있는 경우에 이동한다.
             if(reqUrl.contains("notice")){
            	 if(reqUrl.contains("del.do")|| reqUrl.contains("update.do")){
            		 String bbsPostId = (String)request.getParameter("bbsPostId");
                	 if(bbsPostId == null){
                		 bbsPostId = "";
                	 }
              		 BdapBbs bbs = bbsService.getBbsbyId(bbsPostId);
              		if((String)session.getAttribute("USER_ID") == bbs.getBbsWriterId()){
              			return true;
              		}
            	 }
            	 
            	 if(userRole.contains("ROLE_NOTICE_ADMIN")){
            		 return true;	 
                 }else{
            		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
                     return false;
            	 }
            	 
             }

             if(reqUrl.contains("mod.do") || reqUrl.contains("del.do") || reqUrl.contains("update.do")){												//자신이 작성한 게시물이면 수정,삭제를 허용한다.
     		
     			String bbsPostId = (String)request.getParameter("bbsPostId");
     			BdapBbs bbs = bbsService.getBbsbyId(bbsPostId);
         		if((String)session.getAttribute("USER_ID") == bbs.getBbsWriterId()){
         			return true;
         		}else{
         			response.sendRedirect(request.getContextPath()+"/nopermission.do");
                     return false;
         		}
     			
     		}
      		           
             
    		 
         } catch (Exception e) {
             e.printStackTrace();
         }
    
        return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest request, 
            HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        //System.out.println("postHandle RoleInterceptor");
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, 
            HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //System.out.println("afterCompletion RoleInterceptor");
         
    }

}