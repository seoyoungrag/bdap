package com.kt.bdapportal.service.impl;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.common.util.BbsConstant;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapBbs;
import com.kt.bdapportal.repository.BbsRepository;
import com.kt.bdapportal.repository.BbsRepositoryImpl;
import com.kt.bdapportal.repository.QnaRepository;
import com.kt.bdapportal.service.BbsService;
import com.kt.bdapportal.service.QnaService;

@Service("bbsService")
public class BbsServiceImpl implements BbsService{

	@Autowired
	private BbsRepository bbsRepository;
	@Autowired
	private BbsRepositoryImpl bbsRepositoryCustomImpl;
	@Autowired
	private QnaRepository qnaRepository;
	@Autowired
	private QnaService qnaService;
	
	public BbsRepositoryImpl getBbsRepositoryCustomImpl() {
		return bbsRepositoryCustomImpl;
	}

	public void setBbsRepositoryCustomImpl(BbsRepositoryImpl bbsRepositoryCustomImpl) {
		this.bbsRepositoryCustomImpl = bbsRepositoryCustomImpl;
	}

	public BbsRepository getBbsRepository() {
		return bbsRepository;
	}
	
	public void setQnaRepository(QnaRepository qnaRepository) {
		this.qnaRepository = qnaRepository;
	}

	public void setBbsRepository(BbsRepository bbsRepository) {
		this.bbsRepository = bbsRepository;
	}

	@Override
	public BdapBbs noticeInsert(BdapBbs bdapBbs){			
		
		bbsRepository.save(bdapBbs);
		bbsRepository.flush();
		
		return bdapBbs;
	}
	
	public void noticeDelete(BdapBbs bdapBbs){
		bbsRepository.delete(bdapBbs);
		bbsRepository.flush();
	}
	
	
	public BdapBbs qnaInsert(BdapBbs bdapBbs){
		bbsRepository.save(bdapBbs);
		bbsRepository.flush();
		return bdapBbs;
	}
	
	public void qnaDelete(BdapBbs bdapBbs){
		bbsRepository.delete(bdapBbs);
		bbsRepository.flush();
		
	}
	
	
	public BdapBbs referenceInsert(BdapBbs bdapBbs){
		bbsRepository.save(bdapBbs);
		bbsRepository.flush();
		return bdapBbs;
		
	}
	public void referenceDelete(BdapBbs bdapBbs){
	
		bbsRepository.delete(bdapBbs);
		bbsRepository.flush();
	}
	
	public BdapBbs linkageInsert(BdapBbs bdapBbs){
		bbsRepository.save(bdapBbs);
		bbsRepository.flush();
		return bdapBbs;
	}
	public void linkageDelete(BdapBbs bdapBbs){
		bbsRepository.delete(bdapBbs);
		bbsRepository.flush();
		
	}
	
	
	public BdapBbs devreqInsert(BdapBbs bdapBbs){
		bbsRepository.save(bdapBbs);
		bbsRepository.flush();
		return bdapBbs;
	}
	
	public void devreqDelete(BdapBbs bdapBbs){
	
		bbsRepository.delete(bdapBbs);
		bbsRepository.flush();
	}
	
	public List<BdapBbs> getList(String bbsType,int startnum,int size){
		List<BdapBbs> bbsList = new ArrayList<BdapBbs>();
		bbsList = bbsRepository.findByBbsType(bbsType,startnum,size);
		return bbsList;
	}
	
	@Override
	public List<BdapBbs> getNoticeList(SearchVO searchVO,int startNum,int rows,Pageable pageable){
		List<BdapBbs> bbsList = new ArrayList<BdapBbs>();
			searchVO.setBoardType(BbsConstant.BBS_CODE);
			bbsList = bbsRepository.listBdapBbs(searchVO, startNum, rows);
		return bbsList;
	}
	
	@Override
	public List<BdapBbs> getQnaList(SearchVO searchVO,int startNum,int rows){

		List<BdapBbs> bbsList = new ArrayList<BdapBbs>();
			searchVO.setBoardType(BbsConstant.QNA_CODE);
			bbsList = bbsRepository.listBdapBbs(searchVO, startNum, rows);
		return bbsList;
	}
	
	@Override
	public List<BdapBbs> getReferenceList(SearchVO searchVO,int startNum,int rows){
		List<BdapBbs> bbsList = new ArrayList<BdapBbs>();
			searchVO.setBoardType(BbsConstant.REFERENCE_CODE);
			bbsList = bbsRepository.listBdapBbs(searchVO, startNum, rows);
		return bbsList;
	}
	
	
	public List<BdapBbs> getLinkageList(SearchVO searchVO,int startNum,int rows){				

		List<BdapBbs> bbsList = new ArrayList<BdapBbs>();
			searchVO.setBoardType(BbsConstant.LINKAGE_CODE);
			bbsList = bbsRepository.listBdapBbs(searchVO, startNum, rows);
		return bbsList;
	}
	
	public List<BdapBbs> getDevreqList(SearchVO searchVO,int startNum,int rows){				

		List<BdapBbs> bbsList = new ArrayList<BdapBbs>();
			searchVO.setBoardType(BbsConstant.DEV_REQ_CODE);
			bbsList = bbsRepository.listBdapBbs(searchVO, startNum, rows);
		return bbsList;
	}
	
	
	public BdapBbs getBbsbyId(String id){
		
		BdapBbs bbs = bbsRepository.findOne(id);
		
		return bbs;
		
	}
	
	public BdapBbs getQnaBbsbyId(String id){
		BdapBbs bbs = bbsRepository.getQnaBbsbyId(id);
		return bbs;
	}
	
	
	
	public BdapBbs getQnabyId(String id){
		
		BdapBbs bbs = bbsRepository.findOne(id);
		
		return bbs;
		
	}
	
	public BdapBbs getReferencebyId(String id){
		
		BdapBbs bbs = bbsRepository.findOne(id);
		
		return bbs;
		
	}
	
	public BdapBbs getLinkagebyId(String id){
		
		BdapBbs bbs = bbsRepository.findOne(id);
		
		return bbs;
		
	}
	
	public BdapBbs getDevreqbyId(String id){
		
		BdapBbs bbs = bbsRepository.findOne(id);
		
		return bbs;
		
	}
	
	public Long getNoticeListCount(String bbsCode,SearchVO searchVO){
		Long bbsCount = 0L;
		bbsCount = bbsRepository.countBdapBbs(searchVO);
		searchVO.setBoardType(BbsConstant.BBS_CODE);
		return bbsCount;
	}
	
	
	
public Long getQnaListCount(String bbsCode,SearchVO searchVO){
		Long bbsCount = 0L;
		bbsCount = bbsRepository.countBdapBbs(searchVO);
		searchVO.setBoardType(BbsConstant.QNA_CODE);
		return bbsCount;
	}
	
public Long getReferenceListCount(String bbsCode,SearchVO searchVO){
	Long bbsCount = 0L;
	bbsCount = bbsRepository.countBdapBbs(searchVO);
	searchVO.setBoardType(BbsConstant.DEV_REQ_CODE);
	return bbsCount;
}

@Override
public Long getQnaListCountForMainPage(String bbsType) {
	Long bbsCount = 0L;
	bbsCount = bbsRepository.qnaListCountForMainPage(bbsType);
	
	return bbsCount;
}
	
}