package com.kt.bdapportal.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "BDAP_COL")
public class BdapCol {

	@Id
	@Column(name = "COL_ID", nullable = false)
	@GeneratedValue(generator = "inquisitive-uuid")
	@GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	private String colId;

	@Column(name = "COL_KOR_NM", nullable = true)
	private String colKorNm;

	@Column(name = "COL_ENG_NM", nullable = false)
	private String colEngNm;

	@Column(name = "COL_DATA_TYPE", nullable = false)
	private String colDataType;

	@Column(name = "COL_DESC", nullable = true)
	private String colDesc;

	@Column(name = "COL_ORDER_NUM", nullable = true)
	private int colOrderNum;

	@Column(name = "COL_IS_PK", nullable = false)
	private char colIsPk = 'N';

	@Column(name = "COL_IS_ENC", nullable = false)
	private char colIsEnc = 'N';

	@Column(name = "COL_IS_CHK_NULL", nullable = false)
	private char colIsChkNull = 'N';

	@Column(name = "COL_IS_CHK_TYPE", nullable = false)
	private char colIsChkType = 'N';

	@Column(name = "COL_TBL_ID", nullable = false)
	private String colTblId;

	@Column(name = "COL_REGEX", nullable = true)
	private String colRegex;

	@Column(name = "COL_TBL_NM", nullable = true)
	private String colTblNm;

	@Column(name = "COL_DB_NM", nullable = true)
	private String colDbNm;

	public String getColTblNm() {
		return colTblNm;
	}

	public void setColTblNm(String colTblNm) {
		this.colTblNm = colTblNm;
	}

	public String getColDbNm() {
		return colDbNm;
	}

	public void setColDbNm(String colDbNm) {
		this.colDbNm = colDbNm;
	}

	public String getColId() {
		return colId;
	}

	public void setColId(String colId) {
		this.colId = colId;
	}

	public String getColKorNm() {
		return colKorNm;
	}

	public void setColKorNm(String colKorNm) {
		this.colKorNm = colKorNm;
	}

	public String getColEngNm() {
		return colEngNm;
	}

	public void setColEngNm(String colEngNm) {
		this.colEngNm = colEngNm;
	}

	public String getColDataType() {
		return colDataType;
	}

	public void setColDataType(String colDataType) {
		this.colDataType = colDataType;
	}

	public String getColDesc() {
		return colDesc;
	}

	public void setColDesc(String colDesc) {
		this.colDesc = colDesc;
	}

	public int getColOrderNum() {
		return colOrderNum;
	}

	public void setColOrderNum(int colOrderNum) {
		this.colOrderNum = colOrderNum;
	}

	public char getColIsPk() {
		return colIsPk;
	}

	public void setColIsPk(char colIsPk) {
		this.colIsPk = colIsPk;
	}

	public char getColIsEnc() {
		return colIsEnc;
	}

	public void setColIsEnc(char colIsEnc) {
		this.colIsEnc = colIsEnc;
	}

	public char getColIsChkNull() {
		return this.colIsChkNull;
	}

	public void setColIsChkNull(char colIsChkNull) {
		this.colIsChkNull = colIsChkNull;
	}

	public char getColIsChkType() {
		return colIsChkType;
	}

	public void setColIsChkType(char colIsChkType) {
		this.colIsChkType = colIsChkType;
	}

	public String getColTblId() {
		return colTblId;
	}

	public void setColTblId(String colTblId) {
		this.colTblId = colTblId;
	}

	public String getColRegex() {
		return colRegex;
	}

	public void setColRegex(String colRegex) {
		this.colRegex = colRegex;
	}

}
