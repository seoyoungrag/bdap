package com.kt.bdapportal.common.util.auth;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class NdapUserList {
	int count;
	List<NdapUser> items;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<NdapUser> getItems() {
		return items;
	}
	public void setItems(List<NdapUser> items) {
		this.items = items;
	}
	
	
}
