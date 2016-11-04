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

@Entity
@Table(name = "BDAP_ACL")
public class BdapAcl {

	@Id
	@Column(name = "ACL_ID")
	@GeneratedValue(generator = "inquisitive-uuid")
	@GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	private String aclId;
	
	@Column(name = "ACL_NM", nullable = false)
	private String aclNm;

	@Column(name = "ACL_DESC", nullable = true)
	private String aclDesc;

	@Column(name = "ACL_PARENT_ID", nullable = true)
	private String aclParentId;
	
	@Column(name = "ACL_URI", nullable = true)
	private String aclUri;
	
	@ManyToOne
	@JoinColumn(name = "ACL_PARENT_ID", insertable = false, updatable = false)
	private BdapAcl parent;

	@OneToMany(mappedBy = "parent", fetch = FetchType.EAGER)
	private List<BdapAcl> children;
	
	public String getAclUri() {
		return aclUri;
	}

	public void setAclUri(String aclUri) {
		this.aclUri = aclUri;
	}

	public String getAclId() {
		return aclId;
	}

	public void setAclId(String aclId) {
		this.aclId = aclId;
	}

	public String getAclNm() {
		return aclNm;
	}

	public void setAclNm(String aclNm) {
		this.aclNm = aclNm;
	}

	public String getAclDesc() {
		return aclDesc;
	}

	public void setAclDesc(String aclDesc) {
		this.aclDesc = aclDesc;
	}

	public String getAclParentId() {
		return aclParentId;
	}

	public void setAclParentId(String aclParentId) {
		this.aclParentId = aclParentId;
	}

	public BdapAcl getParent() {
		return parent;
	}

	public void setParent(BdapAcl parent) {
		this.parent = parent;
	}

	public List<BdapAcl> getChildren() {
		return children;
	}

	public void setChildren(List<BdapAcl> children) {
		this.children = children;
	}

}
