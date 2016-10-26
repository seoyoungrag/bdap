package com.kt.bdapportal.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.kt.bdapportal.common.util.BbsConstant;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapBbs;

public interface BbsService {

	public BdapBbs noticeInsert(BdapBbs bdapBbs);
	public void noticeDelete(BdapBbs bdapBbs);
	public BdapBbs qnaInsert(BdapBbs bdapBbs);
	public void qnaDelete(BdapBbs bdapBbs);
	public BdapBbs referenceInsert(BdapBbs bdapBbs);
	public void referenceDelete(BdapBbs bdapBbs);
	public BdapBbs linkageInsert(BdapBbs bdapBbs);
	public void linkageDelete(BdapBbs bdapBbs);
	public BdapBbs devreqInsert(BdapBbs bdapBbs);
	public void devreqDelete(BdapBbs bdapBbs);
	
	public List<BdapBbs> getNoticeList(SearchVO searchVO,int startNum,int rows,Pageable pageable);				//공지사항 리스트
	
	public Long getNoticeListCount(String bbsCode,SearchVO searchVO);
	public Long getReferenceListCount(String bbsCode,SearchVO searchVO);
	public Long getQnaListCount(String bbsCode,SearchVO searchVO);
	
	public List<BdapBbs> getList(String bbsType,int startnum,int size);
	
	public List<BdapBbs> getQnaList(SearchVO searchVO,int startNum,int rows);					//qna 리스트
	public List<BdapBbs> getReferenceList(SearchVO searchVO,int startNum,int rows);			//게시판 리스트
	public List<BdapBbs> getLinkageList(SearchVO searchVO,int startNum,int rows);				//자료 연동 리스트
	public List<BdapBbs> getDevreqList(SearchVO searchVO,int startNum,int rows);				//개발 요청 리스트
	
	public BdapBbs getBbsbyId(String id);
	public BdapBbs getQnabyId(String id);
	public BdapBbs getReferencebyId(String id);
	public BdapBbs getLinkagebyId(String id);
	public BdapBbs getDevreqbyId(String id);
	
	public Long getQnaListCountForMainPage(String bbsType);
	
	
}
