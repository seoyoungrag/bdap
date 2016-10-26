package com.kt.bdapportal.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MGMT_QRY_HIST")
public class MgmtQryHist {

	@Id
	@Column(name="QRY_HIVE_ID", nullable=false)
	private String qryHiveId;
	
	@Column(name="QRY_USER", nullable=false)
	private String qryUser;
	
	@Column(name="QRY_STATEMENT", nullable=false)
	private String qryStatement;
	
	@Column(name="QRY_START_DT", nullable=false)
	private String qryStartDt;
	
	@Column(name="QRY_END_DT", nullable=true)
	private String qryEndDt;
	
	@Column(name="QRY_STATUS", nullable=false)
	private String qryStatus;
	
	@Column(name="QRY_INVOKER_SYSTEM", nullable=false)
	private String qryInvokerSystem;
	
	@Column(name="QRY_DURATION", nullable=true)
	private String qryDuration;

	public String getQryHiveId() {
		return qryHiveId;
	}

	public void setQryHiveId(String qryHiveId) {
		this.qryHiveId = qryHiveId;
	}

	public String getQryUser() {
		return qryUser;
	}

	public void setQryUser(String qryUser) {
		this.qryUser = qryUser;
	}

	public String getQryStatement() {
		return qryStatement;
	}

	public void setQryStatement(String qryStatement) {
		this.qryStatement = qryStatement;
	}

	public String getQryStartDt() {
		return qryStartDt;
	}

	public void setQryStartDt(String qryStartDt) {
		this.qryStartDt = qryStartDt;
	}

	public String getQryEndDt() {
		return qryEndDt;
	}

	public void setQryEndDt(String qryEndDt) {
		this.qryEndDt = qryEndDt;
	}

	public String getQryStatus() {
		return qryStatus;
	}

	public void setQryStatus(String qryStatus) {
		this.qryStatus = qryStatus;
	}

	public String getQryInvokerSystem() {
		return qryInvokerSystem;
	}

	public void setQryInvokerSystem(String qryInvokerSystem) {
		this.qryInvokerSystem = qryInvokerSystem;
	}

	public String getQryDuration() {
		return qryDuration;
	}

	public void setQryDuration(String qryDuration) {
		this.qryDuration = qryDuration;
	}
	
	

	
	
	
}
