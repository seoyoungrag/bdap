package com.kt.bdapportal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.domain.BdapQna;
import com.kt.bdapportal.repository.QnaRepository;
import com.kt.bdapportal.service.QnaService;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaRepository qnaRepository;
	

	public void setQnaRepository(QnaRepository qnaRepository) {
		this.qnaRepository = qnaRepository;
	}
	

	public BdapQna qnaInsert(BdapQna bdapQna){
		
		qnaRepository.save(bdapQna);
		qnaRepository.flush();
		return bdapQna;
	}
	
	public void qnaDelete(BdapQna bdapQna){
		
		qnaRepository.delete(bdapQna);
		qnaRepository.flush();
		
	}
	
	public long qnaStatus(char qnaStatus){
		
		return qnaRepository.countByqnaStatus(qnaStatus);
		
	}
	
	public List<BdapQna> getQnaListbyBbsId(String bbsId){
		
		List<BdapQna> qnaList = new ArrayList<BdapQna>();
		
		
		return qnaList;
	}
	
	
	public BdapQna getQnabyId(String id){
		
		BdapQna bbsQna = qnaRepository.findOne(id);
		
		return bbsQna;
		
	}
	
	
	
	
	
	
	
	
	
	
}
