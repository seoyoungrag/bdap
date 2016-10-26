package com.kt.bdapportal.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MGMT_NODE_STAT")
public class MgmtNodeStat {

	@Id
	@Column(name="NODE_STAT_ID", nullable=false)
	private String nodeStatId;
	
	@Column(name="NODE_STAT_CREATE_DT", nullable=false)
	private String nodeStatCreateDt;
	
	@Column(name="NODE_STAT_TYPE", nullable=false)
	private String nodeStatType;
	
	@Column(name="NODE_STAT_AVAIL_VAL", nullable=false)
	private long nodeStatAvailVal;
	
	@Column(name="NODE_NM", nullable=false)
	private String nodeNm;
	
	@Column(name="NODE_STAT_TOTAL_VAL", nullable=false)
	private long nodeStatTotalVal;

	public String getNodeStatId() {
		return nodeStatId;
	}

	public void setNodeStatId(String nodeStatId) {
		this.nodeStatId = nodeStatId;
	}

	public String getNodeStatCreateDt() {
		return nodeStatCreateDt;
	}

	public void setNodeStatCreateDt(String nodeStatCreateDt) {
		this.nodeStatCreateDt = nodeStatCreateDt;
	}

	public String getNodeStatType() {
		return nodeStatType;
	}

	public void setNodeStatType(String nodeStatType) {
		this.nodeStatType = nodeStatType;
	}

	public long getNodeStatAvailVal() {
		return nodeStatAvailVal;
	}

	public void setNodeStatAvailVal(long nodeStatAvailVal) {
		this.nodeStatAvailVal = nodeStatAvailVal;
	}

	public String getNodeNm() {
		return nodeNm;
	}

	public void setNodeNm(String nodeNm) {
		this.nodeNm = nodeNm;
	}

	public long getNodeStatTotalVal() {
		return nodeStatTotalVal;
	}

	public void setNodeStatTotalVal(long nodeStatTotalVal) {
		this.nodeStatTotalVal = nodeStatTotalVal;
	}
	
	
	
	
	
	
	
}
