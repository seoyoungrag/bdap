package com.kt.bdapportal.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class JsonCol {
	@JsonProperty(value ="name")
	String colNm;
	@JsonProperty(value ="type")
	String colType;
	
	public JsonCol() {
		super();
	}
	
	public JsonCol(String colNm, String colType) {
		super();
		this.colNm = colNm;
		this.colType = colType;
	}
	
	public String getColNm() {
		return colNm;
	}
	public void setColNm(String colNm) {
		this.colNm = colNm;
	}
	public String getColType() {
		return colType;
	}
	public void setColType(String colType) {
		this.colType = colType;
	}
	
}