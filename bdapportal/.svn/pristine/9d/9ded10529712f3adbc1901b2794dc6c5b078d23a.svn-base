package com.kt.bdapportal.model;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonSdCustomDeserializer extends JsonDeserializer<String> { 
	
	@Override
	public String deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        ObjectMapper mapper = (ObjectMapper) jp.getCodec();
        JsonNode node = (JsonNode) mapper.readTree(jp);
        String val = "";
        for(JsonNode jsonNode : node){
        	val = jsonNode.findValue("serdeInfo").asText();
        	
        }
		return val;
	}
}

