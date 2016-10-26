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

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.kt.bdapportal.common.util.UserAclIdsStringToDomain;

@Entity
@Table(name = "BDAP_USER_ACL")
@JsonIgnoreProperties(ignoreUnknown=true)
@JsonDeserialize(using = UserAclIdsStringToDomain.class)
public class BdapUserAcl {

	@Id
	@Column(name = "USER_ACL_ID", nullable = false)
	@GeneratedValue(generator = "inquisitive-uuid")
	@GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	private String userAclId;
	
	@ManyToOne
	@JoinColumn(name = "USER_ID")
	private BdapUser userId;
	
	@OneToMany(mappedBy = "userId", fetch = FetchType.EAGER)
	private List<BdapUser> bdapUser;
	
	@ManyToOne
	@JoinColumn(name = "ACL_ID")
	private BdapAcl aclId;
	
	@OneToMany(mappedBy = "aclId", fetch = FetchType.EAGER)
	private List<BdapAcl> bdapAcl;
	
	public String getUserAclId() {
		return userAclId;
	}

	public void setUserAclId(String userAclId) {
		this.userAclId = userAclId;
	}

	public BdapUser getUserId() {
		return userId;
	}

	public void setUserId(BdapUser userId) {
		this.userId = userId;
	}

	public BdapAcl getAclId() {
		return aclId;
	}

	public void setAclId(BdapAcl aclId) {
		this.aclId = aclId;
	}

	public List<BdapUser> getBdapUser() {
		return bdapUser;
	}

	public void setBdapUser(List<BdapUser> bdapUser) {
		this.bdapUser = bdapUser;
	}

	public List<BdapAcl> getBdapAcl() {
		return bdapAcl;
	}

	public void setBdapAcl(List<BdapAcl> bdapAcl) {
		this.bdapAcl = bdapAcl;
	}


}
