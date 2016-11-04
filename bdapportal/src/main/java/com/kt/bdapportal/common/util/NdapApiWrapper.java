package com.kt.bdapportal.common.util;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.BufferingClientHttpRequestFactory;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.kt.bdapportal.common.LoggingRequestInterceptor;
import com.kt.bdapportal.common.ResErrorHandler;
import com.kt.bdapportal.common.util.auth.NdapAuthentication;
import com.kt.bdapportal.common.util.auth.NdapUser;
import com.kt.bdapportal.common.util.auth.NdapUserList;
import com.kt.bdapportal.domain.BdapCrypto;
import com.kt.bdapportal.domain.BdapCryptoCol;

import net.sf.json.JSONException;

public class NdapApiWrapper {
	private static NdapApiWrapper ndapApiPublicWrapper;

	private String ndapDomain = "ndap.management.host";
	private String workflowAllCountUrl = "rest.api.to.database.job.api.workflowAllCount";
	private String workflowEachCountUrl = "rest.api.to.database.job.api.workflowEachCount";
	private String apiUserInfoUrl = "rest.api.to.database.job.api.userInfo";
	private String apiUserListUrl = "rest.api.to.database.job.api.userList";
	private String encTableUrl = "rest.api.to.database.job.api.encTable";
	// TODO 암호화 테이블들을 어떤 db 할건지 정하기로 했었음. 아직 못받았음.
	private String encDestDbNm = "rest.api.to.database.job.api.encTable.dbNm";

	private String publicAuthKey = "";

	private RestTemplate restTemplate;

	private HttpHeaders headers;

	// 공통 api 호출(admin 권한)
	public NdapApiWrapper() {
		Properties props = new Properties();
		try {
			props.load(NdapAuthentication.class.getClassLoader().getResourceAsStream("/ndap.properties"));
		} catch (Exception e) {
			// System.out.println("Authentication properties get error: " + e);
		}
		if (props != null) {
			ndapDomain = props.getProperty(ndapDomain);
			workflowAllCountUrl = props.getProperty(workflowAllCountUrl);
			workflowEachCountUrl = props.getProperty(workflowEachCountUrl);
			apiUserInfoUrl = props.getProperty(apiUserInfoUrl);
			encTableUrl = props.getProperty(encTableUrl);
			encDestDbNm = props.getProperty(encDestDbNm);
			apiUserListUrl = props.getProperty(apiUserListUrl);
		}

		restTemplate = new RestTemplate();
		ClientHttpRequestInterceptor ri = new LoggingRequestInterceptor();
		List<ClientHttpRequestInterceptor> ris = new ArrayList<ClientHttpRequestInterceptor>();
		ris.add(ri);
		restTemplate.setInterceptors(ris);
		restTemplate.setRequestFactory(new BufferingClientHttpRequestFactory(new SimpleClientHttpRequestFactory()));
		restTemplate.setErrorHandler(new ResErrorHandler());

		headers = new HttpHeaders();
		publicAuthKey = NdapAuthentication.getPublicAuthInstance().getAuthKey();
		headers.add("Authentication", publicAuthKey);
		headers.add("Content-Type", MediaType.APPLICATION_JSON_UTF8_VALUE);
	}

	public static NdapApiWrapper getInstance() {
		if (ndapApiPublicWrapper == null)
			ndapApiPublicWrapper = new NdapApiWrapper();
		return ndapApiPublicWrapper;
	}

	public NdapUser userInfo(String userId) throws IOException {
		HttpEntity<String> httpEntity = new HttpEntity<String>(null, headers);
		String formattedAuthApiUrl = MessageFormat.format(apiUserListUrl, ndapDomain, userId);
		NdapUserList userList = new NdapUserList();
		NdapUser ndapUser = new NdapUser();
		StringBuffer responseString = new StringBuffer("");
		boolean userFind = false;
		ResponseEntity<NdapUserList> responseEntity = restTemplate.exchange(formattedAuthApiUrl, HttpMethod.GET,
				httpEntity, NdapUserList.class);
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			userList = responseEntity.getBody();
			responseString.append(userList.toString());
			for (NdapUser user : userList.getItems()) {
				if (user.getUesrName().equals(userId)) {
					userFind = true;
					ndapUser.setEmail(user.getEmail());
					ndapUser.setId(user.getId());
					ndapUser.setUesrName(user.getUesrName());
				}
			}
		} else {
			// System.out.println("connection error:
			// "+responseEntity.getStatusCode());
		}
		// TODO 확인하고 지워야 함.
		// System.out.println(responseString);
		/*
		 * HttpEntity<String> httpEntity = new HttpEntity<String>(null,
		 * headers); String formattedAuthApiUrl =
		 * MessageFormat.format(apiUserInfoUrl, ndapDomain, userId); NdapUser
		 * userInfo = new NdapUser(); String responseString = "";
		 * 
		 * try { ResponseEntity<NdapUser> responseEntity =
		 * restTemplate.exchange( formattedAuthApiUrl, HttpMethod.GET,
		 * httpEntity, NdapUser.class ); if (responseEntity.getStatusCode() ==
		 * HttpStatus.OK) { userInfo = responseEntity.getBody(); responseString
		 * = userInfo.toString(); }else{
		 * //System.out.println("connection error: "+responseEntity.
		 * getStatusCode()); } } catch (HttpClientErrorException e) {
		 * responseString += "client err: "; responseString +=
		 * e.getStatusCode(); responseString += e.getResponseBodyAsString(); }
		 * catch (HttpServerErrorException e) { responseString +=
		 * "server err: "; responseString += e.getStatusCode(); responseString
		 * += e.getResponseBodyAsString(); }
		 */
		// 임시 코드
		if (!userFind) {
			ndapUser.setEmail("asd@asd.com");
			ndapUser.setId(123);
			ndapUser.setUesrName("테스트");
		}
		return ndapUser;
	}

	public String workflowAllCount() throws IOException, JSONException {
		HttpEntity<String> httpEntity = new HttpEntity<String>(null, headers);

		String formattedAuthApiUrl = MessageFormat.format(workflowAllCountUrl, ndapDomain);

		StringBuffer responseString = new StringBuffer("");

		ResponseEntity<JsonNode> responseEntity = restTemplate.exchange(formattedAuthApiUrl, HttpMethod.GET, httpEntity,
				new ParameterizedTypeReference<JsonNode>() {
				});
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			JsonNode body = responseEntity.getBody();
			responseString.append(body.get("value").asText());
		} else {
			// System.out.println("connection error:
			// "+responseEntity.getStatusCode());
		}
		// TODO 확인하고 지워야 함.
		// System.out.println(responseString);
		return responseString.toString();
	}

	public String workflowEachCount(int userId) throws IOException, JSONException {
		HttpEntity<String> httpEntity = new HttpEntity<String>(null, headers);
		String formattedAuthApiUrl = MessageFormat.format(workflowEachCountUrl, ndapDomain, userId);

		String responseString = "";

		ResponseEntity<JsonNode> responseEntity = restTemplate.exchange(formattedAuthApiUrl, HttpMethod.GET, httpEntity,
				new ParameterizedTypeReference<JsonNode>() {
				});
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			JsonNode body = responseEntity.getBody();
			responseString = body.get("value").asText();
		} else {
			// System.out.println("connection error:
			// "+responseEntity.getStatusCode());
		}
		// TODO 확인하고 지워야 함.
		// System.out.println(responseString);
		return responseString;
	}

	@RequestMapping("/ndap/encTable.do")
	public String encTable(BdapCrypto cryptoInfo) throws IOException, JSONException {

		JSONObject requestJson = new JSONObject();
		JSONArray colList = new JSONArray();
		for (BdapCryptoCol col : cryptoInfo.getChild()) {
			colList.add(col.getCrtColNm());
		}
		requestJson.put("originDatabase", cryptoInfo.getCrtSrcDbNm());
		requestJson.put("originTable", cryptoInfo.getCrtSrcTblNm());
		requestJson.put("destinationDatabase", encDestDbNm);
		requestJson.put("destinationTable", cryptoInfo.getCrtCreateTblNm());
		requestJson.put("encryptedColumns", colList);
		HttpEntity<String> httpEntity = new HttpEntity<String>(requestJson.toString().replaceAll("\\\\", ""), headers);

		String formattedAuthApiUrl = MessageFormat.format(encTableUrl, ndapDomain, cryptoInfo.getCrtSrcDbNm());

		StringBuffer responseString = new StringBuffer("");

		ResponseEntity<String> responseEntity = restTemplate.exchange(formattedAuthApiUrl, HttpMethod.POST, httpEntity,
				String.class);
		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			responseString.append(responseEntity.getBody());
		} else {
			// System.out.println("connection error:
			// "+responseEntity.getStatusCode());
		}
		// TODO 확인하고 지워야 함.
		// System.out.println(responseString.toString());
		return responseString.toString();
	}
}
