package com.kt.bdapportal.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "MGMT_USER_TBL_STAT")
public class MgmtUserTblStat {

	@Id
	@Column(name="USER_TBL_STAT_ID", nullable=false)
	private String userTblStatId;
	
	@Column(name="TBL_SIZE", nullable=false)
	private long tblSize;
	
	@Column(name="INSERT_DT", nullable=true)
	private Timestamp insertDt;
	
	@Column(name="DB_NAME", nullable=false)
	private String dbName;
	
	@Column(name="TBL_NAME", nullable=false)
	private String tblName;
	
	@Column(name="TBL_TYPE", nullable=false)
	private String tblType;
	
	@Column(name="OWNER_NAME", nullable=false)
	private String ownerName;
	
	public String getUserTblStatId() {
		return userTblStatId;
	}

	public void setUserTblStatId(String userTblStatId) {
		this.userTblStatId = userTblStatId;
	}

	public long getTblSize() {
		return tblSize;
	}

	public void setTblSize(long tblSize) {
		this.tblSize = tblSize;
	}

	public Timestamp getInsertDt() {
		return insertDt;
	}

	public void setInsertDt(Timestamp insertDt) {
		this.insertDt = insertDt;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public String getTblName() {
		return tblName;
	}

	public void setTblName(String tblName) {
		this.tblName = tblName;
	}

	public String getTblType() {
		return tblType;
	}

	public void setTblType(String tblType) {
		this.tblType = tblType;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	
	
	
	
	
	
	
	
	
	
	
}
