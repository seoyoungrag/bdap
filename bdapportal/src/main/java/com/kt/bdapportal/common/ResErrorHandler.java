package com.kt.bdapportal.common;

import java.io.IOException;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.client.ResponseErrorHandler;

import com.kt.bdapportal.common.util.RestUtil;

public class ResErrorHandler implements ResponseErrorHandler {
	final static Logger log = LoggerFactory.getLogger(ResErrorHandler.class);

    @Override
    public void handleError(ClientHttpResponse response) throws IOException {
        log.warn("Response error: {} {}", response.getStatusCode(), response.getStatusText()); 
        String theString = IOUtils.toString(response.getBody());
        log.warn("code: {}", response.getStatusCode().toString());
        log.warn("body: {}", theString);
        log.warn("header: {}", response.getHeaders());
    }

    @Override
    public boolean hasError(ClientHttpResponse response) throws IOException {
        return RestUtil.isError(response.getStatusCode());
    }
}