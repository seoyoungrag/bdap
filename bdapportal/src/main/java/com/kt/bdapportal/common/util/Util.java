package com.kt.bdapportal.common.util;

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
}
