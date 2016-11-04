package com.kt.bdapportal.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kt.bdapportal.domain.BdapRoleUser;

public class Util {
	public static String nullTrim(String str) {
    	return nullTrim(str,"");
    }
    
    public static String nullTrim(String str, String def) {
    	if (str == null || str.equals("null")) {
    	    return def;
    	}
    	return str.trim();
    }
    
    public static String getRoleId(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	BdapRoleUser bdapRoleUser = (BdapRoleUser)session.getAttribute("bdapRoleUser");
    	
    	return bdapRoleUser.getRoleId().getRoleId();
    }
    
    public static boolean isAdmin(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	return (Boolean)session.getAttribute("isAdmin");
    }
    
    public static boolean isProcess(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	return (Boolean)session.getAttribute("isProcess");
    }
}
