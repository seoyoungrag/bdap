package com.kt.bdapportal.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.domain.BdapRoleUser;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.service.BbsService;

public class RoleInterceptor   extends HandlerInterceptorAdapter {
	@Autowired
	private BbsService bbsService;
	
	public enum AnalysisRole{
		ANALYSISROLE_ALL,NDAP, RSTUDIO, JUPYTER, SAS, TABLEAU, PMS
	}
	
    @Override
    public boolean preHandle(HttpServletRequest request, 
            HttpServletResponse response, Object handler) throws IOException {
		try {
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			BdapRoleUser bdapRoleUser = (BdapRoleUser)session.getAttribute("bdapRoleUser");
			boolean isAdmin = false; // 등록, 수정, 삭제 등 조작에 관련된 권한 여부
			boolean isProcess = false; // 승인 및 처리에 관한 권한 여부.
			
			String reqUrl = request.getRequestURL().toString();
				
			if(bdapUser == null ||  bdapUser.getUserId().equals("") || bdapRoleUser==null || bdapRoleUser.getRoleId()==null){			//로그인 사용자의 정보가 없으면 로그인 페이지로 이동한다.
				response.sendRedirect(request.getContextPath()+"/loginpage.do");
				return false;
			}
			String analysis = "";
			String userRollId = bdapRoleUser.getRoleId().getRoleId();
			
			if(userRollId.contains("ADMIN")){ // 관리자 권한이 있으면 머든지 할 수 있도록 수정한다.
				isAdmin = true; 
				isProcess = true; 
			}else{
				//게시판 중 공지사항, 자료실, 비정기, 자료요청은 ETC를 제외하고 모든 권한을 갖는다. 사실 승인 절차가 없다.
				if(reqUrl.contains("notice") || reqUrl.contains("reference") || reqUrl.contains("linkage") || reqUrl.contains("devreq")){
					if(userRollId.contains("ITO") || 
							userRollId.contains("BDC") ||
							userRollId.contains("CIC") ){
						isAdmin = true; 
					}
				}else if(reqUrl.contains("qna")){  // QnA 게시판은 ITO만 답변을 달 수 있다.
					if(userRollId.contains("BDC") ||
							userRollId.contains("CIC")){
						isAdmin = true; 
					}else if(userRollId.contains("ITO")){
						isAdmin = true; 
						isProcess = true; 
					}
				}else if(reqUrl.contains("enc") || reqUrl.contains("dec")){ // 암복호화의 승인 및 처리는 관리자만 진행할 수 있다.
					if(userRollId.contains("ITO") || 
							userRollId.contains("BDC") ||
							userRollId.contains("CIC")){
						isAdmin = true; 
					}
				}
				
				if(userRollId.contains("ADMIN") || userRollId.contains("ITO")){
					analysis = AnalysisRole.ANALYSISROLE_ALL.toString();
				}
				
				// 모든 게시판의 VIEW페이지에서 isAdmin 권한은 자신이 작성한 글에 대해서만 갖을 수 있다. 관리자 권한은 머가 다를까? 잘 모르겠네.
				if(reqUrl.contains("notice") || reqUrl.contains("reference") || reqUrl.contains("linkage") || reqUrl.contains("devreq") || reqUrl.contains("qna")){
					if(reqUrl.contains("view")){
						String bbsPostId = (String)request.getParameter("bbsPostId");
						BdapBbs bbs = bbsService.getBbsbyId(bbsPostId);
						if(bdapUser.getUserId().equals(bbs.getBbsWriterId())){
							isAdmin = true; 
		         		}else{
		         			isAdmin = false;
		         		}
					}
				}
			}
			
			session.setAttribute("ANALYSIS_ROLE", analysis);
			session.setAttribute("isAdmin", isAdmin);
			session.setAttribute("isProcess", isProcess);
         } catch (Exception e) {
             e.printStackTrace();
         }
    
		return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest request, 
            HttpServletResponse response, Object handler, ModelAndView modelAndView) {
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, 
            HttpServletResponse response, Object handler, Exception ex){
         
    }

}