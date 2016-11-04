package com.kt.bdapportal.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;

public class LoggingRequestInterceptor implements ClientHttpRequestInterceptor {
	final static Logger log = LoggerFactory.getLogger(LoggingRequestInterceptor.class);

	@Override
	public ClientHttpResponse intercept(org.springframework.http.HttpRequest request, byte[] body,
			ClientHttpRequestExecution execution) throws IOException {
		traceRequest(request, body);
		
		ClientHttpResponse response = execution.execute(request, body);
		traceResponse(response);
		return response;
	}

	private void traceRequest(org.springframework.http.HttpRequest request, byte[] body) throws IOException {
		log.warn("===========================request begin================================================");
		log.warn("URI         : {}", request.getURI());
		log.warn("Method      : {}", request.getMethod());
		log.warn("Headers     : {}", request.getHeaders());
		log.warn("Request body: {}", new String(body, "UTF-8"));
		log.warn("==========================request end================================================");
	}

	private void traceResponse(ClientHttpResponse response) throws IOException {
		try{
		StringBuilder inputStringBuilder = new StringBuilder();
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getBody(), "UTF-8"));
		String line = bufferedReader.readLine();
		while (line != null) {
			inputStringBuilder.append(line);
			inputStringBuilder.append('\n');
			line = bufferedReader.readLine();
		}
		log.warn("============================response begin==========================================");
		log.warn("Status code  : {}", response.getStatusCode());
		log.warn("Status text  : {}", response.getStatusText());
		log.warn("Headers      : {}", response.getHeaders());
		log.warn("Response body: {}", inputStringBuilder.toString());
		log.warn("=======================response end=================================================");
		}catch(IOException e){
			log.error("============================response error begin==========================================");
			log.error("Status code  : {}", response.getStatusCode());
			log.error("Status text  : {}", response.getStatusText());
			log.error("Headers      : {}", response.getHeaders());
			log.error("=======================response error end=================================================");
		}
	}
	
}