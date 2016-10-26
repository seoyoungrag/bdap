package com.kt.bdapportal.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BDAP_DASHBOARD_TBL")
public class BdapDashboardTbl {

	
	@Id
	@Column(name="DASH_NUM", nullable=false)
	private int dashNum;
	
	@Column(name="DASH_DB_NM", nullable=true)
	private String dashDbNm;
	
	@Column(name="DASH_TBL_NM", nullable=true)
	private String dashTblNm;

	public int getDashNum() {
		return dashNum;
	}

	public void setDashNum(int dashNum) {
		this.dashNum = dashNum;
	}

	public String getDashDbNm() {
		return dashDbNm;
	}

	public void setDashDbNm(String dashDbNm) {
		this.dashDbNm = dashDbNm;
	}

	public String getDashTblNm() {
		return dashTblNm;
	}

	public void setDashTblNm(String dashTblNm) {
		this.dashTblNm = dashTblNm;
	}
	
	
	
	
	
	
	
	
	
	
	
}
