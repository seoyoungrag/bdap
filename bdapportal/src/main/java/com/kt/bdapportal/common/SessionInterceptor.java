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

public class SessionInterceptor  extends HandlerInterceptorAdapter {
	  
@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		try {
			HttpSession session = request.getSession();
			BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
				
			if(bdapUser == null ||  bdapUser.getUserId().equals("")){			//로그인 사용자의 정보가 없으면 로그인 페이지로 이동한다.
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
            HttpServletResponse response, Object handler, ModelAndView modelAndView){
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, 
            HttpServletResponse response, Object handler, Exception ex)  {
    }
}


