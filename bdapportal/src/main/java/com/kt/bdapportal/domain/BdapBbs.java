package com.kt.bdapportal.domain;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "BDAP_BBS")
public class BdapBbs {

	 @Id
	 @Column(name = "BBS_ID")
	 @GeneratedValue(generator = "inquisitive-uuid")
	 @GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	 private String bbsId;
	 
/*	@OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "BBS_ID")
	private BdapQna bdapQna;
	*/
	
	/*@OneToMany(mappedBy="bdapBbs")
	List<BdapFile> bdapFiles;
	*/
	
	@Column(name="BBS_TYPE", nullable=false)
    private String bbsType;
     
    @Column(name="BBS_REG_DT", nullable=false)
    private Timestamp bbsRegDt;
    
    @Column(name="BBS_MOD_DT", nullable=true)
    private Timestamp bbsModDt;
    
    @Column(name="BBS_DELETED_YN", nullable=false)
    private char bbsDeletedYn;
    
    @Column(name="BBS_EMERGENCY_YN", nullable=false)
    private char bbsEmergencyYn;
    
    @Column(name="BBS_CONTENT", nullable=false)
    private String bbsContent;
    
    @Column(name="BBS_HIT", nullable=false)
    private int bbsHit;
    
    /*@Column(name="BBS_PARENT_BBS_ID", nullable=true, columnDefinition="int default 0")*/
    @Column(name="BBS_PARENT_BBS_ID", nullable=true)
    private String bbsParentBbsId;
    
    @Column(name="BBS_WRITER_ID", nullable=false)
    private String bbsWriterId;
    
    @Column(name="BBS_WRITER_EMAIL", nullable=false)
    private String bbsWriterEmail;
    
    @Column(name="BBS_WRITER_NM", nullable=false)
    private String bbsWriterNm;
    
    @Column(name="BBS_TITLE", nullable=false)
    private String bbsTitle;

    @Column(name="BBS_CATEGORY", nullable=true)
    private String bbsCategory;
    
    @Column(name="BBS_CATEGORY_SUB", nullable=true)
    private String bbsCategorySub;
    
    
    @ManyToOne
    @JoinColumn(name = "BBS_PARENT_BBS_ID", insertable = false, updatable = false)
    private BdapBbs parent;
    
    @OneToMany(mappedBy="parent",fetch=FetchType.EAGER)
    private List<BdapBbs> children;
    
    
	public BdapBbs getParent() {
		return parent;
	}

	public void setParent(BdapBbs parent) {
		this.parent = parent;
	}

	public List<BdapBbs> getChildren() {
		return children;
	}

	public void setChildren(List<BdapBbs> children) {
		this.children = children;
	}

	public String getBbsId() {
		return bbsId;
	}

	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	public String getBbsType() {
		return bbsType;
	}

	public void setBbsType(String bbsType) {
		this.bbsType = bbsType;
	}

	public Timestamp getBbsRegDt() {
		return bbsRegDt;
	}

	public void setBbsRegDt(Timestamp bbsRegDt) {
		this.bbsRegDt = bbsRegDt;
	}

	public Timestamp getBbsModDt() {
		return bbsModDt;
	}

	public void setBbsModDt(Timestamp bbsModDt) {
		this.bbsModDt = bbsModDt;
	}

	public char getBbsDeletedYn() {
		return bbsDeletedYn;
	}

	public void setBbsDeletedYn(char bbsDeletedYn) {
		this.bbsDeletedYn = bbsDeletedYn;
	}

	public char getBbsEmergencyYn() {
		return bbsEmergencyYn;
	}

	public void setBbsEmergencyYn(char bbsEmergencyYn) {
		this.bbsEmergencyYn = bbsEmergencyYn;
	}

	public String getBbsContent() {
		return bbsContent;
	}

	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}

	public int getBbsHit() {
		return bbsHit;
	}

	public void setBbsHit(int bbsHit) {
		this.bbsHit = bbsHit;
	}



	public String getBbsWriterId() {
		return bbsWriterId;
	}

	public void setBbsWriterId(String bbsWriterId) {
		this.bbsWriterId = bbsWriterId;
	}

	public String getBbsWriterEmail() {
		return bbsWriterEmail;
	}

	public void setBbsWriterEmail(String bbsWriterEmail) {
		this.bbsWriterEmail = bbsWriterEmail;
	}

	public String getBbsWriterNm() {
		return bbsWriterNm;
	}

	public void setBbsWriterNm(String bbsWriterNm) {
		this.bbsWriterNm = bbsWriterNm;
	}

	public String getBbsTitle() {
		return bbsTitle;
	}

	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}

	public String getBbsParentBbsId() {
		return bbsParentBbsId;
	}

	public void setBbsParentBbsId(String bbsParentBbsId) {
		this.bbsParentBbsId = bbsParentBbsId;
	}

	public String getBbsCategory() {
		return bbsCategory;
	}

	public void setBbsCategory(String bbsCategory) {
		this.bbsCategory = bbsCategory;
	}

	public String getBbsCategorySub() {
		return bbsCategorySub;
	}

	public void setBbsCategorySub(String bbsCategorySub) {
		this.bbsCategorySub = bbsCategorySub;
	}

	
    

	
	
}