package com.kt.bdapportal.common.util.auth;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown=true)
public class NdapUser {
	int id;
	@JsonProperty(value="userName")
	String userName;
	String email;
	NdapRole role;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUesrName() {
		return userName;
	}
	public void setUesrName(String uesrName) {
		this.userName = uesrName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public NdapRole getRole() {
		return role;
	}
	public void setRole(NdapRole role) {
		this.role = role;
	}
	
}
