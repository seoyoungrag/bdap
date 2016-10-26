package com.kt.bdapportal.common.util;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.kt.bdapportal.common.util.auth.NdapAuthentication;
import com.kt.bdapportal.common.util.auth.NdapUser;
import com.kt.bdapportal.domain.BdapCrypto;

import net.sf.json.JSONException;

public class NdapApiWrapper {
    private static NdapApiWrapper ndapApiPublicWrapper;
    private static NdapApiWrapper ndapApiPrivateWrapper;
    
    private String ndapDomain = "ndap.management.host";
    private String workflowAllCountUrl = "rest.api.to.database.job.api.workflowAllCount";
    private String workflowEachCountUrl = "rest.api.to.database.job.api.workflowEachCount";
    private String apiUserInfoUrl = "rest.api.to.database.job.api.userInfo";
    private String encTableUrl = "rest.api.to.database.job.api.encTable";
    //TODO 암호화 테이블들을 어떤 db 할건지 정하기로 했었음. 아직 못받았음.
    private String encDestDbNm = "rest.api.to.database.job.api.encTable.dbNm";
	
    private String publicAuthKey = "";
    private String privateAuthKey = "";

    private RestTemplate restTemplate;

    private HttpHeaders headers;
    
	//공통 api 호출(admin 권한)
	public NdapApiWrapper() {
		Properties props = new Properties();
		try{
			props.load(NdapAuthentication.class.getClassLoader().getResourceAsStream("/ndap.properties"));
        }
        catch(Exception e){
            //System.out.println("Authentication properties get error: " + e);
        }
        if(props != null){
        	ndapDomain = props.getProperty(ndapDomain);
        	workflowAllCountUrl = props.getProperty(workflowAllCountUrl);
        	workflowEachCountUrl = props.getProperty(workflowEachCountUrl);
        	apiUserInfoUrl = props.getProperty(apiUserInfoUrl);
        	encTableUrl = props.getProperty(encTableUrl);
        	encDestDbNm = props.getProperty(encDestDbNm);
        }
        restTemplate = new RestTemplate();
	    headers = new HttpHeaders();
        publicAuthKey = NdapAuthentication.getPublicAuthInstance().getAuthKey();
        headers.add("Authentication", publicAuthKey);
        headers.add("Content-Type", MediaType.APPLICATION_JSON_UTF8_VALUE);
        privateAuthKey = NdapAuthentication.getPrivateAuthInstance().getAuthKey();
	}
	
    public static NdapApiWrapper getInstance() {
        if (ndapApiPublicWrapper == null)
        	ndapApiPublicWrapper = new NdapApiWrapper();
        return ndapApiPublicWrapper;        
    }

	public NdapUser userInfo(String userId) throws IOException{
		HttpEntity<String> httpEntity = new HttpEntity<String>(null, headers);
		String formattedAuthApiUrl = MessageFormat.format(apiUserInfoUrl, ndapDomain, userId);
		NdapUser userInfo = new NdapUser();
		String responseString = "";
		
		try {
		
		ResponseEntity<NdapUser> responseEntity = restTemplate.exchange(
				formattedAuthApiUrl, 
				HttpMethod.GET, 
				httpEntity, 
				NdapUser.class
				);
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			userInfo = responseEntity.getBody();
			responseString = userInfo.toString();
		}else{
			//System.out.println("connection error: "+responseEntity.getStatusCode());
		} 
		} catch (HttpClientErrorException e) {
			responseString += "client err: ";
			responseString += e.getStatusCode();
			responseString += e.getResponseBodyAsString();
		} catch (HttpServerErrorException e) {
			responseString += "server err: ";
			responseString += e.getStatusCode();
			responseString += e.getResponseBodyAsString();
		}
		return userInfo;
	}
	

	public String workflowAllCount() throws IOException, JSONException{
		HttpEntity<String> httpEntity = new HttpEntity<String>(null, headers);
		
		String formattedAuthApiUrl = MessageFormat.format(workflowAllCountUrl, ndapDomain);

		String responseString = "";
		
		try {
		
		ResponseEntity<JsonNode> responseEntity = restTemplate.exchange(
				formattedAuthApiUrl, 
				HttpMethod.GET, 
				httpEntity, 
				 new ParameterizedTypeReference<JsonNode>(){}
				);
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			JsonNode body = responseEntity.getBody();
		    responseString = body.get("value").asText();
		}else{
			//System.out.println("connection error: "+responseEntity.getStatusCode());
		} 
		} catch (HttpClientErrorException e) {
			responseString += "client err: ";
			responseString += e.getStatusCode();
			responseString += e.getResponseBodyAsString();
		} catch (HttpServerErrorException e) {
			responseString += "server err: ";
			responseString += e.getStatusCode();
			responseString += e.getResponseBodyAsString();
		}
		return responseString;
	}

	public String workflowEachCount(int userId) throws IOException, JSONException{
		HttpEntity<String> httpEntity = new HttpEntity<String>(null, headers);
		String formattedAuthApiUrl = MessageFormat.format(workflowEachCountUrl, ndapDomain, userId);
				
		String responseString = "";
		
		try {
		
		ResponseEntity<JsonNode> responseEntity = restTemplate.exchange(
				formattedAuthApiUrl, 
				HttpMethod.GET, 
				httpEntity, 
				 new ParameterizedTypeReference<JsonNode>(){}
				);
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			JsonNode body = responseEntity.getBody();
		    responseString = body.get("value").asText();
		}else{
			//System.out.println("connection error: "+responseEntity.getStatusCode());
		} 
		} catch (HttpClientErrorException e) {
			responseString += e.getStatusCode();
			responseString += e.getResponseBodyAsString();
		} catch (HttpServerErrorException e) {
			responseString += e.getStatusCode();
			responseString += e.getResponseBodyAsString();
		}
		return responseString;
	}

	@RequestMapping("/ndap/encTable.do")				
	public String encTable(BdapCrypto cryptoInfo) throws IOException, JSONException{

		JSONObject requestJson = new JSONObject();

		JSONArray colList = new JSONArray();
		colList.addAll(cryptoInfo.getChild());

		requestJson.put("originDatabase", cryptoInfo.getCrtSrcDbNm());
		requestJson.put("originTable", cryptoInfo.getCrtSrcTblNm());
		requestJson.put("destinationDatabase", encDestDbNm);
		requestJson.put("destinationTable", cryptoInfo.getCrtCreateTblNm());
		requestJson.put("encryptedColumns", colList);
		HttpEntity<String> httpEntity = new HttpEntity<String>(requestJson.toString(), headers);
		
		String formattedAuthApiUrl = MessageFormat.format(encTableUrl, ndapDomain,cryptoInfo.getCrtSrcDbNm());
				
		StringBuffer responseString = new StringBuffer("");
		
		try {
		
		ResponseEntity<String> responseEntity = restTemplate.exchange(
				formattedAuthApiUrl, 
				HttpMethod.POST, 
				httpEntity, 
				String.class
				);
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			responseString.append(responseEntity.getBody());
		}else{
			System.out.println("connection error: "+responseEntity.getStatusCode());
		} 
		} catch (HttpClientErrorException e) {
			responseString.append(e.getStatusCode());
			responseString.append(e.getResponseBodyAsString());
		} catch (HttpServerErrorException e) {
			responseString.append(e.getStatusCode());
			responseString.append(e.getResponseBodyAsString());
		}
		return responseString.toString();
	}
}
