package com.kt.bdapportal.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.kt.bdapportal.common.util.RoleUserIdsStringToDomain;

@Entity
@Table(name = "BDAP_ROLE_USER")
@JsonDeserialize(using = RoleUserIdsStringToDomain.class)
public class BdapRoleUser {

	@Id
	@Column(name = "ROLE_USER_ID", nullable = false)
	@GeneratedValue(generator = "inquisitive-uuid")
	@GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	private String userRoleId;

	@ManyToOne
	@JoinColumn(name = "ROLE_ID", nullable = false)
	private BdapRole roleId; 

	@OneToMany(mappedBy = "roleId", fetch = FetchType.EAGER)
	private List<BdapRole> bdapRole;

	@ManyToOne
	@JoinColumn(name = "USER_ID", nullable = false)
	private BdapUser userId; 

	@OneToMany(mappedBy = "userId", fetch = FetchType.EAGER)
	private List<BdapUser> bdapUser;

	public String getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(String userRoleId) {
		this.userRoleId = userRoleId;
	}

	public BdapRole getRoleId() {
		return roleId;
	}

	public void setRoleId(BdapRole roleId) {
		this.roleId = roleId;
	}

	public List<BdapRole> getBdapRole() {
		return bdapRole;
	}

	public void setBdapRole(List<BdapRole> bdapRole) {
		this.bdapRole = bdapRole;
	}

	public BdapUser getUserId() {
		return userId;
	}

	public void setUserId(BdapUser userId) {
		this.userId = userId;
	}

	public List<BdapUser> getBdapUser() {
		return bdapUser;
	}

	public void setBdapUser(List<BdapUser> bdapUser) {
		this.bdapUser = bdapUser;
	}
	

}
