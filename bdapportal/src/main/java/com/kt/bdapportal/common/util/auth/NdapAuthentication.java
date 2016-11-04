package com.kt.bdapportal.common.util.auth;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.BufferingClientHttpRequestFactory;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import com.kt.bdapportal.common.LoggingRequestInterceptor;
import com.kt.bdapportal.common.ResErrorHandler;

import net.sf.json.JSONException;

public class NdapAuthentication {

	private static NdapAuthentication adminAuthentication;
	private static NdapAuthentication privateAuthentication;

	private String ndapDomain = "ndap.management.host";
	private String apiAuthUrl = "rest.api.to.database.job.api.authenticate";
	private String apiAppKey = "rest.api.to.database.job.api.appKey";
	private String apiPass = "rest.api.to.database.job.api.appPw";
	private String apiId = "rest.api.to.database.job.api.appId";

	private String authKey;
	private String userId;

	private RestTemplate restTemplate;
	private HttpHeaders headers;

	private void initialize() {
		Properties props = new Properties();
		try {
			props.load(NdapAuthentication.class.getClassLoader().getResourceAsStream("/ndap.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (props != null) {
			ndapDomain = props.getProperty(ndapDomain);
			apiAuthUrl = props.getProperty(apiAuthUrl);
			apiAppKey = props.getProperty(apiAppKey);
			apiPass = props.getProperty(apiPass);
			apiId = props.getProperty(apiId);
		}
		
		restTemplate = new RestTemplate();
		ClientHttpRequestInterceptor ri = new LoggingRequestInterceptor();
		List<ClientHttpRequestInterceptor> ris = new ArrayList<ClientHttpRequestInterceptor>();
		ris.add(ri);
		restTemplate.setInterceptors(ris);
		restTemplate.setRequestFactory(new BufferingClientHttpRequestFactory(new SimpleClientHttpRequestFactory()));
		restTemplate.setErrorHandler(new ResErrorHandler());

		headers = new HttpHeaders();
		headers.add("Content-Type", MediaType.APPLICATION_JSON_UTF8_VALUE);

	};

	public NdapAuthentication() {
		initialize();
		JSONObject requestJson = new JSONObject();
		try {
			requestJson.put("applicationKey", apiAppKey);
			requestJson.put("password", apiPass);
			requestJson.put("userName", apiId);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		HttpEntity<String> httpEntity = new HttpEntity<String>(requestJson.toString(), headers);

		String formattedAuthApiUrl = MessageFormat.format(apiAuthUrl, ndapDomain);

		ResponseEntity<NdapLoginToken> response = restTemplate.exchange(formattedAuthApiUrl, HttpMethod.POST,
				httpEntity, NdapLoginToken.class);

		if (response.getStatusCode() == HttpStatus.OK) {
			NdapLoginToken token = (NdapLoginToken) response.getBody();
			this.authKey = token.getLoginToken();
		} else {
			// System.out.println("connection error:
			// "+response.getStatusCode());
		}

	}

	public NdapAuthentication(String id, String pw) {
/*		initialize();
		this.userId = id;
		JSONObject requestJson = new JSONObject();
		try {
			requestJson.put("applicationKey", apiAppKey);
			requestJson.put("password", pw);
			requestJson.put("userName", id);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		HttpEntity<String> httpEntity = new HttpEntity<String>(requestJson.toString(), headers);

		String formattedAuthApiUrl = MessageFormat.format(apiAuthUrl, ndapDomain);

		ResponseEntity<NdapLoginToken> response = restTemplate.exchange(formattedAuthApiUrl, HttpMethod.POST,
				httpEntity, NdapLoginToken.class);

		if (response.getStatusCode() == HttpStatus.OK) {
			NdapLoginToken token = (NdapLoginToken) response.getBody();
			this.authKey = token.getLoginToken();
		} else {
		}
		//TODO 테스트용
*/		
		this.authKey = "temptoken";

	}

	// 공통기능용 ndap.properties의 admin id/pw 이용 ... ndap 인증한다.
	public static NdapAuthentication getPublicAuthInstance() {
		if (adminAuthentication == null) {
			adminAuthentication = new NdapAuthentication();
		}
		return adminAuthentication;
	}

	// 로그인용 request의 id/pw 이용 ... ndap 인증한다.
	// pmd said : synchronized 는 메서드에 쓰지 말고 블락안에 쓰라고 한다.
	public static NdapAuthentication initPrivateAuthInstance(String id, String pw) {
		if (privateAuthentication == null) {
			privateAuthentication = new NdapAuthentication(id, pw);
		}
		return privateAuthentication;
	}

	public static NdapAuthentication getPrivateAuthInstance() {
		if (privateAuthentication == null) {
			// init 이후에 null 이므로 ndap내의 사용자 세션이 유효하지 않게 된 것 null을 리턴?
			privateAuthentication = new NdapAuthentication();
		}
		return privateAuthentication;
	}

	public String getAuthKey() {
		return authKey;
	}

	public String getUserId() {
		return userId;
	}

}
