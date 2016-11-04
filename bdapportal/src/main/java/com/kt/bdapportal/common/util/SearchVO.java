package com.kt.bdapportal.common.util;

import javax.servlet.http.HttpServletRequest;

public class SearchVO {

	
	private String category;				
	private String categorySub;				
	private String startDate;				//startDate
	private String endDate;						//endDate
	private String searchType;				//searchType
	private String [] searchTypes;				//searchTypes
	private String searchWord;				//searchWord
	private String userId;
	private String userNm;
	private String boardType;
	private String emergencyYn;
	private String referenceType;			
	private char processStatus;			
	private char minePostYN;
	private String questionYn;
	private String roleId;
	
	// for Paging
	private int page;
	private int nApp = 20; // 기본 목록 갯수
	private int rows;
	private int startNum;
	private int lastPage;
	private long listCount;
	private long total;
	
	// USER QUERY MANAGEMENT
	private int termTime;
	private String termStatus;
	
	// 통계
	private String command;
	
	// Schema Management
	private String schemaNm;
	private String tblNm;
	
	public String[] getSearchTypes() {
		return searchTypes;
	}
	public void setSearchTypes(String[] searchTypes) {
		this.searchTypes = searchTypes;
	}
	
	public String getSchemaNm() {
		return schemaNm;
	}
	public void setSchemaNm(String schemaNm) {
		this.schemaNm = schemaNm;
	}
	
	public String getTblNm() {
		return tblNm;
	}
	public void setTblNm(String tblNm) {
		this.tblNm = tblNm;
	}
		
	public String getQuestionYn() {
		return questionYn;
	}
	public void setQuestionYn(String questionYn) {
		this.questionYn = questionYn;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	
	public int getnApp() {
		return nApp;
	}
	public void setnApp(int nApp) {
		this.nApp = nApp;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public long getListCount() {
		return listCount;
	}
	public void setListCount(long listCount) {
		this.listCount = listCount;
	}
	
	public String getTermStatus() {
		return termStatus;
	}
	public void setTermStatus(String termStatus) {
		this.termStatus = termStatus;
	}
	public int getTermTime() {
		return termTime;
	}
	public void setTermTime(int termTime) {
		this.termTime = termTime;
	}
	public String getEmergencyYn() {
		return emergencyYn;
	}
	public void setEmergencyYn(String emergencyYn) {
		this.emergencyYn = emergencyYn;
	}

	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReferenceType() {
		return referenceType;
	}
	public void setReferenceType(String referenceType) {
		this.referenceType = referenceType;
	}	
	
	public char getProcessStatus() {
		return processStatus;
	}
	public void setProcessStatus(char processStatus) {
		this.processStatus = processStatus;
	}
	public char getMinePostYN() {
		return minePostYN;
	}
	public void setMinePostYN(char minePostYN) {
		this.minePostYN = minePostYN;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getCategorySub() {
		return categorySub;
	}
	public void setCategorySub(String categorySub) {
		this.categorySub = categorySub;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	public String nullTrim(String str) {
    	return nullTrim(str,"");
    }
    
    public String nullTrim(String str, String def) {
    	if (str == null || str.equals("null")) {
    	    return def;
    	}
    	return str.trim();
    }
	
    public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = (this.page-1)*this.rows;	
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public void setPaging(HttpServletRequest request){
		this.page = Integer.parseInt(nullTrim((String)request.getParameter("page"),"1"));
		this.rows = Integer.parseInt(nullTrim((String)request.getParameter("rows"),"0"));
		this.rows = this.rows == 0 ? this.nApp : this.rows;
		this.startNum = (this.page-1) * this.rows ;	
	}
	
	public void setLastPage(){
		this.lastPage = (this.listCount % this.rows > 0)? 1:0;
		this.total = (this.listCount / this.rows) + this.lastPage;
	}
	
	public SearchVO(){
		this.category = "";
		this.categorySub = "";
		this.startDate	= "";
		this.endDate		= "";
		this.searchType	= "";
		this.searchWord	 = "";
		this.referenceType	 = "";
		this.userId = "";
		this.processStatus = ' ';
		this.minePostYN = ' ';
	}
}
