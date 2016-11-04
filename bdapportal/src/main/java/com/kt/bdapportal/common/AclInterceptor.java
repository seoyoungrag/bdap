package com.kt.bdapportal.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kt.bdapportal.domain.BdapAcl;
import com.kt.bdapportal.domain.BdapRoleUser;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.domain.BdapUserAcl;

public class AclInterceptor  extends HandlerInterceptorAdapter {
	  
@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		boolean needCheckAcl = false;
	
		try {
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
			List<String> bdapUserAclList = (List<String>)session.getAttribute("bdapUserAclList");
			List<BdapAcl> allAclList = (List<BdapAcl>)session.getAttribute("allAclList");
			
			String reqUrl = request.getRequestURL().toString();
				
			if(bdapUser == null ||  bdapUser.getUserId().equals("")){			//로그인 사용자의 정보가 없으면 로그인 페이지로 이동한다.
				response.sendRedirect(request.getContextPath()+"/loginpage.do");
				return false;
			}
			
			// 모든 페이지의 주소가 디비에 저장되어있는 것이 아니라 리스트 페이지에 대한 주소만 저장되어 있으므로 리스트 페이지만 체크한다.
			if(allAclList == null ||  allAclList.size()==0){			//ACL 체크 페이지 정보가 없으면 로그인 페이지로 이동한다.
				response.sendRedirect(request.getContextPath()+"/loginpage.do");
				return false;
			}else{
				for(int j=0; j < allAclList.size();j++){
					BdapAcl bdapAcl = (BdapAcl)allAclList.get(j);
					
					if(bdapAcl.getAclUri()!=null){ // acl_uri가 null인건 대 메뉴이거나 잘못된 데이터로 판단한다. 추후 대메뉴로 하위 메뉴의 ACL을 체크할 수도 있겠다.
						if(reqUrl.contains(bdapAcl.getAclUri())){
							needCheckAcl = true;
							break;
						}
					}
				}
			}
			
			if(needCheckAcl){
				for(int i=0; i < bdapUserAclList.size(); i++){
					String aclUri = (String)bdapUserAclList.get(i);
					
					if(aclUri != null){ // acl_uri가 null인경우는 잘못된 레코드라고 봐도 된다.
						if(aclUri.equals("ACL_ALL")){
							return true;
						}else if(reqUrl.contains(aclUri)){
							return true;
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(needCheckAcl){
			response.sendRedirect(request.getContextPath()+"/nopermission.do");
			return false;
		}else{
			return true;
		}
    }
 
    @Override
    public void postHandle(HttpServletRequest request, 
            HttpServletResponse response, Object handler, ModelAndView modelAndView){
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, 
            HttpServletResponse response, Object handler, Exception ex)  {
    }
}


