package com.kt.bdapportal.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "BDAP_FILE")
public class BdapFile {

	 @Id
	 @Column(name = "FLE_ID")
	 @GeneratedValue(generator = "inquisitive-uuid")
	 @GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	 private String fleId;
	 
	 @Column(name="FLE_STOR_NM", nullable=false)
	 private String fleStroNm;
	 
	 @Column(name="FLE_DISPLAY_NM", nullable=false)
	 private String fleDisplayNm;
	 
	 @Column(name="FLE_REG_DT", nullable=false)
	 private Timestamp fleRegDt;
	 
	 @Column(name="FLE_EXT_NM", nullable=false)
	 private String fleExtNm;
	 
	 
	/* @ManyToOne(fetch=FetchType.LAZY)
	 @JoinColumn(name = "BBS_ID")
	 private BdapBbs bdapBbs;
	 */
	 
	 @Column(name="FLE_PARENT_ID", nullable=false)
	 private String fleParentId;
	
	 @Column(name="FLE_TYPE", nullable=false)
	 private char fleType;

	public String getFleId() {
		return fleId;
	}

	public void setFleId(String fleId) {
		this.fleId = fleId;
	}

	public String getFleStroNm() {
		return fleStroNm;
	}

	public void setFleStroNm(String fleStroNm) {
		this.fleStroNm = fleStroNm;
	}

	public String getFleDisplayNm() {
		return fleDisplayNm;
	}

	public void setFleDisplayNm(String fleDisplayNm) {
		this.fleDisplayNm = fleDisplayNm;
	}

	public Timestamp getFleRegDt() {
		return fleRegDt;
	}

	public void setFleRegDt(Timestamp fleRegDt) {
		this.fleRegDt = fleRegDt;
	}

	public String getFleExtNm() {
		return fleExtNm;
	}

	public void setFleExtNm(String fleExtNm) {
		this.fleExtNm = fleExtNm;
	}

	public String getFleParentId() {
		return fleParentId;
	}

	public void setFleParentId(String fleParentId) {
		this.fleParentId = fleParentId;
	}

	public char getFleType() {
		return fleType;
	}

	public void setFleType(char fleType) {
		this.fleType = fleType;
	}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
	
	
}
