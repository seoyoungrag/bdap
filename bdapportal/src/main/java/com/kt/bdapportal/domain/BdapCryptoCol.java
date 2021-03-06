package com.kt.bdapportal.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name = "BDAP_CRYPTO_COL")
@IdClass(BdapCryptoColPk.class)
public class BdapCryptoCol {

	
	@Id
	@Column(name="CRT_PARENT_ID", nullable=false, insertable = true, updatable = false)
	private String crtParentId;
	
	@Id
	@Column(name="CRT_COL_NM", nullable=false)
	private String crtColNm;

	public String getCrtParentId() {
		return crtParentId;
	}

	public void setCrtParentId(String crtParentId) {
		this.crtParentId = crtParentId;
	}

	public String getCrtColNm() {
		return crtColNm;
	}

	public void setCrtColNm(String crtColNm) {
		this.crtColNm = crtColNm;
	}
	
	
	
	
	
	
	
}
