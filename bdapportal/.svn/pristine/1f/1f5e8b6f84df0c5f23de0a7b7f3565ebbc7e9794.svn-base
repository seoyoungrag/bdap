package com.kt.bdapportal.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "BDAP_COMMENT")
public class BdapComment {

	
	
	@Id
	@Column(name = "CMT_ID")
	@GeneratedValue(generator = "inquisitive-uuid")
	@GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	private String cmtId;
	  
    @Column(name="CMT_REG_DT", nullable=false)
    private Timestamp cmtRegDt;
    
    @Column(name="CMT_MOD_DT", nullable=true)
    private Timestamp cmtModDt;
    
    @Column(name="CMT_DELETED_YN", nullable=false)
    private char cmtDeletedYn;
    
   
	@Column(name="CMT_CONTENT", nullable=false)
    private String cmtContent;
    
	
	@Column(name="CMT_PARENT_BBS_ID", nullable=false)
    private String cmtParentBbsId;
    
	
	@Column(name="CMT_WRITER_ID", nullable=false)
    private String cmtWriterId;
    
	@Column(name="CMT_WRITER_EMAIL", nullable=false)
    private String cmtWriterEmail;
    

	@Column(name="CMT_WRITER_NM", nullable=false)
    private String cmtWriterNm;


	public String getCmtId() {
		return cmtId;
	}


	public void setCmtId(String cmtId) {
		this.cmtId = cmtId;
	}


	public Timestamp getCmtRegDt() {
		return cmtRegDt;
	}


	public void setCmtRegDt(Timestamp cmtRegDt) {
		this.cmtRegDt = cmtRegDt;
	}


	public Timestamp getCmtModDt() {
		return cmtModDt;
	}


	public void setCmtModDt(Timestamp cmtModDt) {
		this.cmtModDt = cmtModDt;
	}


	public char getCmtDeletedYn() {
		return cmtDeletedYn;
	}


	public void setCmtDeletedYn(char cmtDeletedYn) {
		this.cmtDeletedYn = cmtDeletedYn;
	}


	public String getCmtContent() {
		return cmtContent;
	}


	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}


	public String getCmtParentBbsId() {
		return cmtParentBbsId;
	}


	public void setCmtParentBbsId(String cmtParentBbsId) {
		this.cmtParentBbsId = cmtParentBbsId;
	}


	public String getCmtWriterId() {
		return cmtWriterId;
	}


	public void setCmtWriterId(String cmtWriterId) {
		this.cmtWriterId = cmtWriterId;
	}


	public String getCmtWriterEmail() {
		return cmtWriterEmail;
	}


	public void setCmtWriterEmail(String cmtWriterEmail) {
		this.cmtWriterEmail = cmtWriterEmail;
	}


	public String getCmtWriterNm() {
		return cmtWriterNm;
	}


	public void setCmtWriterNm(String cmtWriterNm) {
		this.cmtWriterNm = cmtWriterNm;
	}
    
	
	
	
	
	
	
}
