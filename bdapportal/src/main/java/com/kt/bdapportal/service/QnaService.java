package com.kt.bdapportal.service;

import java.util.List;

import com.kt.bdapportal.domain.BdapQna;

public interface QnaService {

	
	public BdapQna qnaInsert(BdapQna bdapQna);	
	
	public void qnaDelete(BdapQna bdapQna);
	public List<BdapQna> getQnaListbyBbsId(String bbsId);
	
	public BdapQna getQnabyId(String bbsId);
	public long qnaStatus(char qnaStatus);
}
