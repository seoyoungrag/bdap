package com.kt.bdapportal.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AclInterceptor  extends HandlerInterceptorAdapter {
	  
    @Override
    public boolean preHandle(HttpServletRequest request, 
            HttpServletResponse response, Object handler) throws Exception {
    	 try {
             // pmd said : 일반 변수명은 소문자로 시작해야 하고 final변수가 아니라면 under score는 사용하지 말라신다.
    		 /*String aclAll = "/";*/
    		 String schemaSelectPage = "ktMainPage4.do";
    		 String loadstatusSelectPage = "ktMainPage5.do";
    		 String dailyloadstatusSelectPage = "dailyloadstatus.do";
    	     String tableManagementPage = "ktMainPage6.do";
    	     String encryptionSelectPage = "ktMainPage11.do";
    	     String decryptionSelectPage = "ktMainPage15.do";
    	     String encryptionProcessSelectPage = "ktMainPage14.do";
    	     String decryptionProcessSelectPage = "ktMainPage16.do";
    	     String noticePage = "notice/list.do";
    	     String qnaPage = "qna/list.do";
    	     String referencePage = "reference/list.do";
    	     String linkagePage = "linkage/list.do";
    	     String devreqPage = "devreq/list.do";
    	     //Administrator
    	     String userQueryManagementPage = "ktMainPage7.do";
    	     String statisticsPage = "ktMainPage4.do";								//현재 페이지 없음
    	     String setupPage = "setup.do";
    		
    	     String hive = "hive";
    	     String hiveTest = "ndap";
    	     
    		 HttpSession session = request.getSession();
    		 
    		 String hiveReqUrl = request.getRequestURL().toString();
  	         if(hiveReqUrl.contains(hive) || hiveReqUrl.contains(hiveTest)){
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
             
             if(userAcl.contains("ACL_ALL")){																			//모든 페이지로 이동 권한이 있으면 페이지 이동한다. 
            	 return true;
             }
             
             String reqUrl = request.getRequestURL().toString();
             
             if(reqUrl.contains(schemaSelectPage)){
            	 
            	 if(userAcl.contains("SCHEMA_SELECT_PAGE")){		
            		 return true;	 
            	 }else{
            		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
                     return false;
            	 }
            	 
             }
             
             if(reqUrl.contains(loadstatusSelectPage)){
            	 
            	 if(userAcl.contains("LOADSTATUS_SELECT_PAGE")){		
            		 return true;	 
            	 }else{
            		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
                     return false;
            	 }
            	 
             }
             
             if(reqUrl.contains(dailyloadstatusSelectPage)){
            	 
            	 if(userAcl.contains("DAILYLOADSTATUS_SELECT_PAGE")){		
            		 return true;	 
            	 }else{
            		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
                     return false;
            	 }
            	 
             }
             
             if(reqUrl.contains(tableManagementPage)){
            	 
            	 if(userAcl.contains("TABLE_MANAGEMENT_PAGE")){		
	           		 return true;	 
	           	 }else{
	           		 response.sendRedirect(request.getContextPath()+"/loginpage.do");
	           		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                    return false;
	           	 }
           	 
            }
    		 
             if(reqUrl.contains(encryptionSelectPage)){
            	 if(userAcl.contains("ENCRYPTION_SELECT_PAGE")){		
	           		 return true;	 
	           	 }else{
	           		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                    return false;
	           	 }
          	 
           }
    	     
            if(reqUrl.contains(decryptionSelectPage)){
            	
	           	 if(userAcl.contains("DECRYPTION_SELECT_PAGE")){		
	           		 return true;	 
	           	 }else{
	           		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                    return false;
	           	 }
         	 
          }
            
            	 
	    	 if(reqUrl.contains(encryptionProcessSelectPage)){
	    		 
	       		 if(userAcl.contains("ENCRYPTION_PROCESS_SELECT_PAGE")){		
	           		 return true;	 
	           	 }else{
	           		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                    return false;
	           	 }
        	 
         } 
    	    
           	 
	         if(reqUrl.contains(decryptionProcessSelectPage)){
	        	 
	           	 if(userAcl.contains("DECRYPTION_PROCESS_SELECT_PAGE")){		
	           		 return true;	 
	           	 }else{
	           		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                    return false;
	           	 }
       	 
        } 
              	 
	      if(reqUrl.contains(noticePage)){
	    	  
	         	 if(userAcl.contains("NOTICE_PAGE") || userRole.contains("ROLE_NOTICE_ADMIN")){		
	           		 return true;	 
	           	 }else{
	           		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                    return false;
	           	 }
      	 
       } 
            
             	 
	       if(reqUrl.contains(qnaPage) || userRole.contains("ROLE_NOTICE_ADMIN")){
	          if(userAcl.contains("QNA_PAGE")){
	           		 return true;	 
	           	 }else{
	           		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                    return false;
	           	 }
     	 
         } 
        
	  	 if(reqUrl.contains(referencePage) || userRole.contains("ROLE_NOTICE_ADMIN")){
	  		 
	        if(userAcl.contains("REFERENCE_PAGE")){		
	          		 return true;	 
	          	 }else{
	          		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                   return false;
	          	 }
		 
	        } 
    	    	 
	        if(reqUrl.contains(linkagePage) || userRole.contains("ROLE_NOTICE_ADMIN")){
	        	
	        	if(userAcl.contains("LINKAGE_PAGE")){
	          		 return true;	 
	          	 }else{
	          		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                   return false;
	          	 }
		 
	        } 
        
	        if(reqUrl.contains(devreqPage) || userRole.contains("ROLE_NOTICE_ADMIN")){
	        	if(userAcl.contains("DEVREQ_PAGE")){		
	          		 return true;	 
	          	 }else{
	          		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                   return false;
	          	 }
		 
	        } 
	        
	        
	        //관리자 페이지
	      	 if(reqUrl.contains(userQueryManagementPage)){
	      		 
	      		 if(userAcl.contains("USER_QUERY_MANAGEMENT_PAGE")){		
	          		 return true;	 
	          	 }else{
	          		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                   return false;
	          	 }
		 
	        } 
	      	 if(reqUrl.contains(statisticsPage)){
	      		 
	      		 if(userAcl.contains("STATISTICS_PAGE")){		
	          		 return true;	 
	          	 }else{
	          		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                   return false;
	          	 }
		 
	        } 
        
	      	 if(reqUrl.contains(setupPage)){
	      		 
	      		 if(userAcl.contains("SETUP_PAGE")){		
	        		 return true;	 
	          	 }else{
	          		 response.sendRedirect(request.getContextPath()+"/nopermission.do");
	                   return false;
	          	 }
		 
	        } 
       
             
             if(!userRole.equals("ROLE_ALL")){										
            	 response.sendRedirect(request.getContextPath()+"/loginpage.do");
            	 return false;
             }
             
             
         } catch (Exception e) {
             e.printStackTrace();
         }
    	
        return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest request, 
            HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        //System.out.println("postHandle executed");
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, 
            HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //System.out.println("afterCompletion executed");
         
    }

}


