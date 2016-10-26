package com.kt.bdapportal.domain;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BDAP_QNA")
public class BdapQna {

	
	//@GeneratedValue
	@Id
    @Column(name="BBS_ID", nullable=false)
    private String bbsId;
     
/*	@OneToOne(fetch=FetchType.LAZY, mappedBy="bdapQna")
	private BdapBbs bdapBbs;
	*/
	
    @Column(name="QNA_STATUS", nullable=false)
    private char qnaStatus ;
    
    @Column(name="QNA_EXPECTED_ANS_DATE", nullable=true)
    private Date qnaExpectedAnsDate;
    
    @Column(name="QNA_CREATE_DT", nullable=false)
    private Timestamp qnaCreateDt;
    
    @Column(name="QNA_TYPE", nullable=true)
    private String qnaType;
    
    @Column(name="QNA_RESPONSER_NM", nullable=true)
    private String qnaResponserNm;

	public String getBbsId() {
		return bbsId;
	}

	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	public char getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(char qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	public Date getQnaExpectedAnsDate() {
		return qnaExpectedAnsDate;
	}

	public void setQnaExpectedAnsDate(Date qnaExpectedAnsDate) {
		this.qnaExpectedAnsDate = qnaExpectedAnsDate;
	}

	public Timestamp getQnaCreateDt() {
		return qnaCreateDt;
	}

	public void setQnaCreateDt(Timestamp qnaCreateDt) {
		this.qnaCreateDt = qnaCreateDt;
	}

	public String getQnaType() {
		return qnaType;
	}

	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}

	public String getQnaResponserNm() {
		return qnaResponserNm;
	}

	public void setQnaResponserNm(String qnaResponserNm) {
		this.qnaResponserNm = qnaResponserNm;
	}
    
 
	
}
