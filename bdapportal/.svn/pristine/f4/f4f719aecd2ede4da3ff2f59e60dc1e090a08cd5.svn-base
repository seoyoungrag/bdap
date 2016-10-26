package com.kt.bdapportal.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "BDAP_USER")
public class BdapUser {

	@Id
	@Column(name = "USER_ID", nullable = false)
	@GeneratedValue(generator = "inquisitive-uuid")
	@GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	private String userId;

	@Column(name = "USER_EMAIL", nullable = false)
	private String userEmail;

	@Column(name = "USER_NM", nullable = false)
	private String userNm;

	@Column(name = "USER_CREATE_DT", nullable = false)
	private Timestamp userCreateDt;

	@Column(name = "USER_LOGIN_ID", nullable = false)
	private String userLoginId;

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

}
