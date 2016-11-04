package com.kt.bdapportal.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.bdapportal.common.util.NdapApiWrapper;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.model.NdapTableEventJson;
import com.kt.bdapportal.service.impl.NdapSyncRestServiceImpl;

import net.sf.json.JSONObject;

@Controller
public class NdapSyncRestController {
	
	@Autowired
	NdapSyncRestServiceImpl ndapSyncRestService;
	
    @RequestMapping(value = "/hive/metastore/event/listener/entitytype/{entityType}/eventtype/{eventType}", method = RequestMethod.PUT)
    @ResponseBody
    public String ndapSync(@PathVariable(value = "entityType") String entityType,@PathVariable(value = "eventType") String eventType,  @RequestBody NdapTableEventJson bdapTbl) {
    	String retVal = "";
/*    	switch (entityType) {
	    	case "table" :
	    		switch(eventType){
	    		case "create" :
	    			retVal = ndapEntityService.createTable(bdapTbl);
	    			break;
	    		case "alter" :
	    			retVal = ndapEntityService.alterTable(bdapTbl);
	    			break;
	    		case "drop" :
	    			retVal = ndapEntityService.dropTable(bdapTbl);
	    			break;
    			default: 
    				retVal = "eventType : " +eventType;
	    		}
	    		break;
	    	case "database" :
	    		retVal = "OK";
	    		break;
	    	case "partition" :
	    		retVal = "OK";
	    		break;
	    	default :
	    		retVal = "entityType : "+entityType;
	    		break;
    	}
*/        
    	return retVal;
    }

    @RequestMapping(value = "/hive/metastore/event/listener/entitytype/TABLE/eventType/CREATE", method = RequestMethod.PUT)
    @ResponseBody
    public String ndapTblCreate( @RequestBody NdapTableEventJson bdapTbl) {
    	String retVal = "";
		retVal = ndapSyncRestService.createTable(bdapTbl);
		return retVal;
    }

    @RequestMapping(value = "/hive/metastore/event/listener/entitytype/TABLE/eventType/ALTER", method = RequestMethod.PUT)
    @ResponseBody
    public String ndapTblAlter( @RequestBody NdapTableEventJson bdapTbl) {
    	String retVal = "";
		retVal = ndapSyncRestService.alterTable(bdapTbl);
		return retVal;
    }
    @RequestMapping(value = "/hive/metastore/event/listener/entitytype/TABLE/eventType/DROP", method = RequestMethod.PUT)
    @ResponseBody
    public String ndapTblDrop( @RequestBody NdapTableEventJson bdapTbl) {
    	String retVal = "";
		retVal = ndapSyncRestService.dropTable(bdapTbl);
		return retVal;
    }

    @RequestMapping(value = "/ndap/workflowAll", method = RequestMethod.GET)
    @ResponseBody
    public void getNdapWorkflowAll(HttpServletRequest request, HttpServletResponse response) {
    	try {
			String workflowAllCnt = NdapApiWrapper.getInstance().workflowAllCount();
			
			JSONObject jsonObj = new JSONObject();

			try{
				jsonObj.put("workflowAllCnt", workflowAllCnt);
			}catch(Exception e){ 
				//TODO local환경에서 테스트 용
				jsonObj.put("workflowAllCnt", "0");
			}
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}
	
    }

    @RequestMapping(value = "/ndap/workflowEach", method = RequestMethod.GET)
    @ResponseBody
    public void getNdapWorkflowEach(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
    	try {
			String workflowCnt = NdapApiWrapper.getInstance().workflowEachCount(bdapUser.getNdapId());
			
			JSONObject jsonObj = new JSONObject();
			try{
				jsonObj.put("myWorkflowCnt", workflowCnt);
			}catch(Exception e){ 
				//TODO local환경에서 테스트 용
				jsonObj.put("myWorkflowCnt", "0");
			}
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}
	
    }
    
}
