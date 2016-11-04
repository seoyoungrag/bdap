package com.kt.bdapportal.common.util;

import java.io.IOException;
import java.util.Properties;


public class BbsConstant {

    public static final String TEMP_PATH_KEY = "file.temp.path";
    private static final String STORE_PATH_KEY = "file.store.path";
    
	//temp 경로
	public static final String FILE_TEMP_PATH; 
	//저장 경로
	public static final String FILE_STORE_PATH;
	

    static {
    	Properties props = new Properties();
			try {
				props.load(BbsConstant.class.getClassLoader().getResourceAsStream("/portal.properties"));
			} catch (IOException e) {
				e.printStackTrace();
			}
			FILE_TEMP_PATH = props.getProperty(TEMP_PATH_KEY);
			FILE_STORE_PATH = props.getProperty(STORE_PATH_KEY);
    }
    
	//공지사항 코드
	public static final String BBS_CODE = "BO1";
	//qna 코드
	public static final String QNA_CODE = "BO2";
	//자료실 코드
	public static final String REFERENCE_CODE = "BO3";
	//자료연동 코드
	public static final String LINKAGE_CODE = "BO4";
	//개발요청 코드
	public static final String DEV_REQ_CODE = "BO5";
	
	//qna 상태 처리중
	public static final char QNA_STATUS_PROCESS = 'P';
	
	//qna 상태 처리완료
	public static final char QNA_STATUS_COMPLETE = 'S';
		
	//qna 상태 보완 요청
	public static final char QNA_STATUS_REQ = 'R';
	
}
