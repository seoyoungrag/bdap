package com.kt.bdapportal.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.kt.bdapportal.common.util.auth.NdapUser;

@Entity
@Table(name = "BDAP_USER")
public class BdapUser {

	@Id
	@Column(name = "USER_ID", nullable = false)
	private String userId;

	@Column(name = "USER_EMAIL", nullable = false)
	private String userEmail;

	@Column(name = "USER_NM", nullable = false)
	private String userNm;

	@Column(name = "USER_CREATE_DT", nullable = false)
	private Timestamp userCreateDt;

	@Column(name = "USER_LOGIN_ID", nullable = false)
	private String userLoginId;
	
	@Column(name = "NDAP_ID", nullable = false)
	private int ndapId;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public Timestamp getUserCreateDt() {
		return userCreateDt;
	}

	public void setUserCreateDt(Timestamp userCreateDt) {
		this.userCreateDt = userCreateDt;
	}

	public String getUserLoginId() {
		return userLoginId;
	}

	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}
	
	
	public int getNdapId() {
		return ndapId;
	}

	public void setNdapId(int ndapId) {
		this.ndapId = ndapId;
	}

	// 회원 가입용 메서드
	public void setUserInfo(NdapUser ndapUser) {
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = "";
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);
		
		this.userId = ndapUser.getUesrName();
		this.userEmail = ndapUser.getEmail();
		this.userNm = ndapUser.getUesrName();
		this.userCreateDt = ts;
		this.userLoginId = ndapUser.getUesrName();
		this.ndapId = ndapUser.getId();
	}
}
