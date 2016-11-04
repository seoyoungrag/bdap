package com.kt.bdapportal.model;

import java.sql.Date;
import java.util.Calendar;

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
	
	private Date tblValidateDate;
	
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
		
		// 영락이 확인해봐라.
		Calendar cal = Calendar.getInstance(); 
		cal.add(Calendar.MONTH, 2);
		this.tblValidateDate = new java.sql.Date(cal.getTimeInMillis());
	}
	
	public Date getTblValidateDate() {
		return tblValidateDate;
	}

	public void setTblValidateDate(Date tblValidateDate) {
		this.tblValidateDate = tblValidateDate;
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
	

	public JsonTable(JsonTable vo) {
		super();
		this.tblName = vo.tblName;
		this.dbName = vo.dbName;
		this.owner = vo.owner;
		this.tblCreate = vo.tblCreate;
		this.tblType = vo.tblType;
		this.sdInfo = vo.sdInfo;
		
		Calendar cal = Calendar.getInstance(); 
		cal.add(Calendar.MONTH, 2);
		this.tblValidateDate = new java.sql.Date(cal.getTimeInMillis());
	}
}
