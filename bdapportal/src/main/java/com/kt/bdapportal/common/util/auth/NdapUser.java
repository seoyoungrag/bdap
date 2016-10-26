package com.kt.bdapportal.common.util.auth;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class NdapUser {
	int id;
	String uesrName;
	String email;
	NdapRole role;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUesrName() {
		return uesrName;
	}
	public void setUesrName(String uesrName) {
		this.uesrName = uesrName;
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
