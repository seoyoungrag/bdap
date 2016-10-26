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
import com.kt.bdapportal.common.util.RoleAclIdsStringToDomain;

@Entity
@Table(name = "BDAP_ROLE_ACL")
@JsonDeserialize(using = RoleAclIdsStringToDomain.class)
public class BdapRoleAcl {

	@Id
	@Column(name = "ROLE_ACL_ID", nullable = false)
	@GeneratedValue(generator = "inquisitive-uuid")
	@GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	private String roleAclId;
	
	@ManyToOne
	@JoinColumn(name = "ROLE_ID", nullable = false)
	private BdapRole roleId;

	@OneToMany(mappedBy = "roleId", fetch = FetchType.EAGER)
	private List<BdapRole> bdapRole;
	
	@ManyToOne
	@JoinColumn(name = "ACL_ID", nullable = false)
	private BdapAcl aclId;

	@OneToMany(mappedBy = "aclId", fetch = FetchType.EAGER)
	private List<BdapAcl> bdapAcl;
	
	public String getRoleAclId() {
		return roleAclId;
	}

	public void setRoleAclId(String roleAclId) {
		this.roleAclId = roleAclId;
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

	public BdapAcl getAclId() {
		return aclId;
	}

	public void setAclId(BdapAcl aclId) {
		this.aclId = aclId;
	}

	public List<BdapAcl> getBdapAcl() {
		return bdapAcl;
	}

	public void setBdapAcl(List<BdapAcl> bdapAcl) {
		this.bdapAcl = bdapAcl;
	}

}
