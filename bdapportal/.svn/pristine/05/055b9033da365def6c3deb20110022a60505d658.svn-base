package com.kt.bdapportal.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class JsonTable {
	@JsonProperty(value="tableName")
	String tblName;
	
	@JsonProperty(value="dbName")
	String dbName;
	
	@JsonProperty("owner")
	String owner;
	
	@JsonProperty(value="createTime")
	String tblCreate;
	
	@JsonProperty(value="tableType")
	String tblType;
	
	@JsonProperty(value="sd")
	JsonSerde sdInfo;
	
	public JsonTable() {
		super();
	}

	public JsonTable(String tblName, String dbName, String owner, String tblCreate, String tblType, JsonSerde sdInfo) {
		super();
		this.tblName = tblName;
		this.dbName = dbName;
		this.owner = owner;
		this.tblCreate = tblCreate;
		this.tblType = tblType;
		this.sdInfo = sdInfo;
	}

	public String getTblName() {
		return tblName;
	}

	public void setTblName(String tblName) {
		this.tblName = tblName;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getTblCreate() {
		return tblCreate;
	}

	public void setTblCreate(String tblCreate) {
		this.tblCreate = tblCreate;
	}

	public String getTblType() {
		return tblType;
	}

	public void setTblType(String tblType) {
		this.tblType = tblType;
	}

	public JsonSerde getSdInfo() {
		return sdInfo;
	}

	public void setSdInfo(JsonSerde sdInfo) {
		this.sdInfo = sdInfo;
	}
	
	
}
