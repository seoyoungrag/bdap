package com.kt.bdapportal.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class NdapTableEventJson {
	@JsonProperty(value="table")
	JsonTable jsonTbl;
	
	@JsonProperty(value="status")
	Boolean status;

	@JsonProperty(value="newTable")
	JsonTable jsonTblNew;

	@JsonProperty(value="oldTable")
	JsonTable jsonTblOld;
	
	public NdapTableEventJson() {
		super();
	}

	public NdapTableEventJson(JsonTable jsonTbl, Boolean status, JsonTable jsonTblNew, JsonTable jsonTblOld) {
		super();
		this.jsonTbl = jsonTbl;
		this.status = status;
		this.jsonTblNew = jsonTblNew;
		this.jsonTblOld = jsonTblOld;
	}

	public JsonTable getJsonTbl() {
		return jsonTbl;
	}

	public void setJsonTbl(JsonTable jsonTbl) {
		this.jsonTbl = jsonTbl;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public JsonTable getJsonTblNew() {
		return jsonTblNew;
	}

	public void setJsonTblNew(JsonTable jsonTblNew) {
		this.jsonTblNew = jsonTblNew;
	}

	public JsonTable getJsonTblOld() {
		return jsonTblOld;
	}

	public void setJsonTblOld(JsonTable jsonTblOld) {
		this.jsonTblOld = jsonTblOld;
	}

	@Override
	public String toString() {
		return "NdapTableEventJson [jsonTbl=" + jsonTbl + ", status=" + status + ", jsonTblNew=" + jsonTblNew
				+ ", jsonTblOld=" + jsonTblOld + "]";
	}
	
	
}
