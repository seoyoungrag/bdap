package com.kt.bdapportal.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class JsonSerde {
	@JsonProperty(value="cols")
	List<JsonCol> colInfo;
	
	@JsonProperty(value="location")
	String location;
	
	public JsonSerde() {
		super();
	}

	public JsonSerde(List<JsonCol> colInfo, String location) {
		super();
		this.colInfo = colInfo;
		this.location = location;
	}

	public List<JsonCol> getColInfo() {
		return colInfo;
	}

	public void setColInfo(List<JsonCol> colInfo) {
		this.colInfo = colInfo;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
}
