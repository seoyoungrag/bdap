package com.kt.bdapportal.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MGMT_TBL_STAT")
public class MgmtTblStat {
	
	@Id
	@Column(name="TBL_STAT_ID", nullable=false)
	private String tblStatId;
		
	@Column(name="TBL_SIZE", nullable=false)
	private long tblSize;
	
	@Column(name="TBL_CNT", nullable=false)
	private int tblCnt;
	
	@Column(name="ETL_YMD", nullable=false)
	private String etlYmd;
	
	@Column(name="INSERT_DT", nullable=false)
	private Timestamp insertDt;
	
	@Column(name="DB_NAME", nullable=false)
	private String dbName;
		
	@Column(name="DB_ID", nullable=false)
	private String dbId;
	
	@Column(name="TBL_NAME", nullable=false)
	private String tblName;
	
	@Column(name="TBL_ID", nullable=false)
	private String tblId;
	
	@Column(name="TBL_TYPE", nullable=false)
	private String tblType;
	
	@Column(name="PART_NAME", nullable=false)
	private String partName;
	
	@Column(name="SD_ID", nullable=false)
	private String sdId;
	
	@Column(name="PARAM_KEY", nullable=false)
	private String paramKey;
	
	@Column(name="DAY_OF_WEEK", nullable=false)
	private String dayOfWeek;

	public String getTblStatId() {
		return tblStatId;
	}

	public void setTblStatId(String tblStatId) {
		this.tblStatId = tblStatId;
	}

	public long getTblSize() {
		return tblSize;
	}

	public void setTblSize(long tblSize) {
		this.tblSize = tblSize;
	}

	public int getTblCnt() {
		return tblCnt;
	}

	public void setTblCnt(int tblCnt) {
		this.tblCnt = tblCnt;
	}

	public String getEtlYmd() {
		return etlYmd;
	}

	public void setEtlYmd(String etlYmd) {
		this.etlYmd = etlYmd;
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

	public String getDbId() {
		return dbId;
	}

	public void setDbId(String dbId) {
		this.dbId = dbId;
	}

	public String getTblName() {
		return tblName;
	}

	public void setTblName(String tblName) {
		this.tblName = tblName;
	}

	public String getTblId() {
		return tblId;
	}

	public void setTblId(String tblId) {
		this.tblId = tblId;
	}

	public String getTblType() {
		return tblType;
	}

	public void setTblType(String tblType) {
		this.tblType = tblType;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public String getSdId() {
		return sdId;
	}

	public void setSdId(String sdId) {
		this.sdId = sdId;
	}

	public String getParamKey() {
		return paramKey;
	}

	public void setParamKey(String paramKey) {
		this.paramKey = paramKey;
	}

	public String getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}


	
	
	
}
