package com.kt.bdapportal.common.util.auth;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class NdapPriv {
	int id;
	String privilegeView;
	String privilegeCreate;
	String privilegeRead;
	String privilegeWrite;
	String privilegeExecute;
	NdapResource resource;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPrivilegeView() {
		return privilegeView;
	}
	public void setPrivilegeView(String privilegeView) {
		this.privilegeView = privilegeView;
	}
	public String getPrivilegeCreate() {
		return privilegeCreate;
	}
	public void setPrivilegeCreate(String privilegeCreate) {
		this.privilegeCreate = privilegeCreate;
	}
	public String getPrivilegeRead() {
		return privilegeRead;
	}
	public void setPrivilegeRead(String privilegeRead) {
		this.privilegeRead = privilegeRead;
	}
	public String getPrivilegeWrite() {
		return privilegeWrite;
	}
	public void setPrivilegeWrite(String privilegeWrite) {
		this.privilegeWrite = privilegeWrite;
	}
	public String getPrivilegeExecute() {
		return privilegeExecute;
	}
	public void setPrivilegeExecute(String privilegeExecute) {
		this.privilegeExecute = privilegeExecute;
	}
	public NdapResource getResource() {
		return resource;
	}
	public void setResource(NdapResource resource) {
		this.resource = resource;
	}
	
	
}
