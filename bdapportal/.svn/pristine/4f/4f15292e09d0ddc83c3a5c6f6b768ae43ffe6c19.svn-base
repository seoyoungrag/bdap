package com.kt.bdapportal.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "BDAP_CRYPTO")
public class BdapCrypto {

	
	@Id
	@Column(name="CRT_ID", nullable=false)
	@GeneratedValue(generator = "inquisitive-uuid")
	@GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	private String crtId;
	
	@Column(name="CRT_TYPE", nullable=false)
	private char crtType;
	
	@Column(name="CRT_STATUS", nullable=false)
	private String crtStatus;
	
	@Column(name="CRT_PRJ_NM", nullable=false)
	private String crtPrjNm;
	
	@Column(name="CRT_REQ_REASON", nullable=false)
	private String crtReqReason;
	
	@Column(name="CRT_REQ_DT", nullable=false)
	private Timestamp crtReqDt;
	
	@Column(name="CRT_IS_CHK_RAW", nullable=false)
	private char crtIsChkRaw;
	
	@Column(name="CRT_START_DATE", nullable=true)
	private Date crtStartDate;
	
	@Column(name="CRT_END_DATE", nullable=false)
	private Date crtEndDate;
	
	@Column(name="CRT_RES_DT", nullable=true)
	private Timestamp crtResDt;
	
	@Column(name="CRT_DOC_NUM", nullable=false)
	private String crtDocNum;
	
	@Column(name="CRT_CREATE_TBL_NM", nullable=false)
	private String crtCreateTblNm;
	
	@Column(name="CRT_OWNER_ID", nullable=false)
	private String crtOwnerId;
	
	@Column(name="CRT_SRC_DB_NM", nullable=false)
	private String crtSrcDbNm;
	
	@Column(name="CRT_SRC_TBL_NM", nullable=false)
	private String crtSrcTblNm;

	
	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="CRT_PARENT_ID")
	private List<BdapCryptoCol> child;
	
	
	public List<BdapCryptoCol> getChild() {
		return child;
	}

	public void setChild(List<BdapCryptoCol> child) {
		this.child = child;
	}

	public String getCrtId() {
		return crtId;
	}

	public void setCrtId(String crtId) {
		this.crtId = crtId;
	}

	public char getCrtType() {
		return crtType;
	}

	public void setCrtType(char crtType) {
		this.crtType = crtType;
	}

	public String getCrtStatus() {
		return crtStatus;
	}

	public void setCrtStatus(String crtStatus) {
		this.crtStatus = crtStatus;
	}

	public String getCrtPrjNm() {
		return crtPrjNm;
	}

	public void setCrtPrjNm(String crtPrjNm) {
		this.crtPrjNm = crtPrjNm;
	}

	public String getCrtReqReason() {
		return crtReqReason;
	}

	public void setCrtReqReason(String crtReqReason) {
		this.crtReqReason = crtReqReason;
	}

	public Timestamp getCrtReqDt() {
		return crtReqDt;
	}

	public void setCrtReqDt(Timestamp crtReqDt) {
		this.crtReqDt = crtReqDt;
	}

	public char getCrtIsChkRaw() {
		return crtIsChkRaw;
	}

	public void setCrtIsChkRaw(char crtIsChkRaw) {
		this.crtIsChkRaw = crtIsChkRaw;
	}

	public Date getCrtStartDate() {
		return crtStartDate;
	}

	public void setCrtStartDate(Date crtStartDate) {
		this.crtStartDate = crtStartDate;
	}

	public Date getCrtEndDate() {
		return crtEndDate;
	}

	public void setCrtEndDate(Date crtEndDate) {
		this.crtEndDate = crtEndDate;
	}

	public Timestamp getCrtResDt() {
		return crtResDt;
	}

	public void setCrtResDt(Timestamp crtResDt) {
		this.crtResDt = crtResDt;
	}

	public String getCrtDocNum() {
		return crtDocNum;
	}

	public void setCrtDocNum(String crtDocNum) {
		this.crtDocNum = crtDocNum;
	}

	public String getCrtCreateTblNm() {
		return crtCreateTblNm;
	}

	public void setCrtCreateTblNm(String crtCreateTblNm) {
		this.crtCreateTblNm = crtCreateTblNm;
	}

	public String getCrtOwnerId() {
		return crtOwnerId;
	}

	public void setCrtOwnerId(String crtOwnerId) {
		this.crtOwnerId = crtOwnerId;
	}

	public String getCrtSrcDbNm() {
		return crtSrcDbNm;
	}

	public void setCrtSrcDbNm(String crtSrcDbNm) {
		this.crtSrcDbNm = crtSrcDbNm;
	}

	public String getCrtSrcTblNm() {
		return crtSrcTblNm;
	}

	public void setCrtSrcTblNm(String crtSrcTblNm) {
		this.crtSrcTblNm = crtSrcTblNm;
	}
	
	
	
	
	
	
	
	
	
}
