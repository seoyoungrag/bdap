package com.kt.bdapportal.repository;

import java.math.BigInteger;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.kt.bdapportal.common.util.BbsConstant;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapBbs;

public class BbsRepositoryImpl implements BbsRepositoryCustom {
	@PersistenceContext
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<BdapBbs> listBdapBbs(SearchVO searchVO, int startNum, int size) {
			searchVO.setCategory(searchVO.nullTrim(searchVO.getCategory()));
			searchVO.setCategorySub(searchVO.nullTrim(searchVO.getCategorySub()));
			searchVO.setReferenceType(searchVO.nullTrim(searchVO.getReferenceType()));
			searchVO.setEmergencyYn(searchVO.nullTrim(searchVO.getEmergencyYn()));
			searchVO.setStartDate(searchVO.nullTrim(searchVO.getStartDate()));
			searchVO.setSearchWord(searchVO.nullTrim(searchVO.getSearchWord()));
			searchVO.setSearchType(searchVO.nullTrim(searchVO.getSearchType()));
			
			String questionYn = searchVO.nullTrim(searchVO.getQuestionYn());
			String category = searchVO.nullTrim(searchVO.getCategory());
			
			StringBuffer query = new StringBuffer();
			
			if(searchVO.getBoardType().equals(BbsConstant.QNA_CODE)){
				query.append(" SELECT * FROM ("
						+ "SELECT "
						+ "A.BBS_ID AS ORDER_ID, BBS_REG_DT AS ORDER_DT, A.BBS_ID AS BBS_ID, D.QNA_STATUS, A.BBS_TYPE AS BBS_TYPE, "
						+ "A.BBS_REG_DT, "
						+ "A.BBS_MOD_DT, "
						+ "A.BBS_DELETED_YN AS BBS_DELETED_YN, A.BBS_EMERGENCY_YN AS BBS_EMERGENCY_YN, A.BBS_CONTENT AS BBS_CONTENT, "
						+ "A.BBS_HIT AS BBS_HIT, A.BBS_PARENT_BBS_ID AS BBS_PARENT_BBS_ID, A.BBS_WRITER_ID AS BBS_WRITER_ID, A.BBS_WRITER_EMAIL AS BBS_WRITER_EMAIL, A.BBS_WRITER_NM AS BBS_WRITER_NM, "
						+ "A.BBS_TITLE AS BBS_TITLE, "
						+ "(SELECT CATE_NAME FROM BDAP_BBS_CATEGORY WHERE CATE_ID = A.BBS_CATEGORY) AS BBS_CATEGORY, "
						+ "(SELECT CATE_NAME FROM BDAP_BBS_CATEGORY WHERE CATE_ID = A.BBS_CATEGORY_SUB) AS BBS_CATEGORY_SUB, "
						+ "'1' AS RNK "
						+ "FROM BDAP_BBS A, BDAP_QNA D WHERE A.BBS_ID=D.BBS_ID "
						+ "AND A.BBS_PARENT_BBS_ID  IS NULL AND A.BBS_TYPE = :boardType");
						
						if(!category.equals("")){
							query.append(" AND A.BBS_CATEGORY = :category ");
						}
						
						if(!questionYn.equals("") && !questionYn.equals("Y")){
							query.append(" UNION ALL " 
									+ "SELECT B.BBS_PARENT_BBS_ID AS ORDER_ID, LV1.BBS_REG_DT AS ORDER_DT, B.BBS_ID AS BBS_ID, NULL AS QNA_STATUS, B.BBS_TYPE AS BBS_TYPE, "
									+ "B.BBS_REG_DT, "
									+ "B.BBS_MOD_DT, "
									+ "B.BBS_DELETED_YN AS BBS_DELETED_YN, B.BBS_EMERGENCY_YN AS BBS_EMERGENCY_YN, B.BBS_CONTENT AS BBS_CONTENT, "
									+ "B.BBS_HIT AS BBS_HIT, B.BBS_PARENT_BBS_ID AS BBS_PARENT_BBS_ID, B.BBS_WRITER_ID AS BBS_WRITER_ID, B.BBS_WRITER_EMAIL AS BBS_WRITER_EMAIL, B.BBS_WRITER_NM AS BBS_WRITER_NM, "
									+ "B.BBS_TITLE AS BBS_TITLE, "
									+ "B.BBS_CATEGORY, "
									+ "B.BBS_CATEGORY_SUB, "
									+ "'1' AS RNK "
									+ "FROM BDAP_BBS B, BDAP_BBS LV1 "
									+ "WHERE B.BBS_PARENT_BBS_ID = LV1.BBS_ID "
									+ "AND B.BBS_PARENT_BBS_ID  IS NOT NULL "
									+ "AND B.BBS_TYPE = :boardType");
						}
						
						if(!category.equals("")){
							query.append(" AND B.BBS_CATEGORY = :category ");
						}
						
						query.append(") C WHERE BBS_DELETED_YN = 'N'  ");
						
			}else{
				query.append(" SELECT * FROM ("
						+ "SELECT BBS_ID AS ORDER_ID, BBS_REG_DT AS ORDER_DT, D.*, '1' AS RNK "
						+ "FROM BDAP_BBS D WHERE D.BBS_PARENT_BBS_ID  IS NULL AND D.BBS_TYPE = :boardType "
						+ "AND D.BBS_EMERGENCY_YN='Y' "
						+ " UNION ALL "
						+ "SELECT BBS_ID AS ORDER_ID, BBS_REG_DT AS ORDER_DT, A.*, '2' AS RNK "
						+ "FROM BDAP_BBS A WHERE A.BBS_PARENT_BBS_ID  IS NULL AND A.BBS_TYPE = :boardType "
						+ "AND A.BBS_EMERGENCY_YN='N'"
						+ " UNION ALL "
						+ "SELECT B.BBS_PARENT_BBS_ID AS ORDER_ID, LV1.BBS_REG_DT AS ORDER_DT, B.*, '1' AS RNK "
						+ "FROM BDAP_BBS B, BDAP_BBS LV1 "
						+ "WHERE B.BBS_PARENT_BBS_ID = LV1.BBS_ID "
						+ "AND B.BBS_PARENT_BBS_ID  IS NOT NULL "
						+ "AND LV1.BBS_EMERGENCY_YN='Y' "
						+ "AND B.BBS_TYPE = :boardType"
						+ " UNION ALL "
						+ "SELECT B.BBS_PARENT_BBS_ID AS ORDER_ID, LV1.BBS_REG_DT AS ORDER_DT, B.*, '2' AS RNK "
						+ "FROM BDAP_BBS B, BDAP_BBS LV1 "
						+ "WHERE B.BBS_PARENT_BBS_ID = LV1.BBS_ID "
						+ "AND B.BBS_PARENT_BBS_ID  IS NOT NULL "
						+ "AND LV1.BBS_EMERGENCY_YN='N' "
						+ "AND B.BBS_TYPE = :boardType"

								+ ") C WHERE BBS_DELETED_YN = 'N' ");
			}
			
		StringBuffer where = new StringBuffer();
			
		if(searchVO.getCategory().equals("") 
				&& searchVO.getCategorySub().equals("") 
				&& searchVO.getStartDate().equals("") 
				&& searchVO.getSearchWord().equals("")
				&& searchVO.getProcessStatus() == ' '
				&& searchVO.getMinePostYN() == 'N'
				&& searchVO.getEmergencyYn().equals("")
				){
		}else{
			//공지사항검색
			String categorySub = searchVO.getCategorySub();
			String startDate = searchVO.getStartDate()+" 00:00:00";
			String endDate = searchVO.getEndDate()+" 23:59:59";
			String searchType = searchVO.getSearchType();
			String searchTypes[] = searchVO.getSearchTypes();
			String searchWord = searchVO.getSearchWord();
			String emergencyYn = searchVO.getEmergencyYn();
			
			//qna검색
			char processStatus = searchVO.getProcessStatus();
			//자료실1,2,3 검색
			String referenceType = searchVO.getReferenceType();
			
			startDate = startDate.replaceAll("\\/", "-");
			endDate = endDate.replaceAll("\\/", "-");
			
			// category 맴버변수는 Qna일때와 나머지 게시판일때가 다르다. Qna에는 id가 들어가고 나머지에는 name이 들어가있다.
			// 아래 구문은 QnA게시판이 아닐때에만 호출되면 된다.
			if(!searchVO.getBoardType().equals(BbsConstant.QNA_CODE)){
				if(!category.equals("")){
					where.append(" AND C.BBS_CATEGORY LIKE CONCAT('%',:category,'%')");
				}
			}
			
			if(!categorySub.equals("")){
				where.append(" AND C.BBS_CATEGORY_SUB LIKE CONCAT('%',:categorySub,'%')");
			}
			if(searchType.equals("TITLE") && !searchWord.equals("")){
				where.append(" AND C.BBS_TITLE LIKE CONCAT('%',:searchWord,'%')");
			}
			if(searchType.equals("WRITER") && !searchWord.equals("")){
				where.append(" AND C.BBS_WRITER_NM LIKE CONCAT('%',:searchWord,'%')");
			}
			if(searchType.equals("CONTENT") && !searchWord.equals("")){
				where.append(" AND C.BBS_CONTENT LIKE CONCAT('%',:searchWord,'%')");
			}
			if(!searchVO.getStartDate().equals("")){
				where.append(" AND C.BBS_REG_DT BETWEEN :startDate AND :endDate");
			}
			//notice는 writer, qna는 wirternm으로 되어있음..
			if(searchType.equals("WRITERNM") && !searchWord.equals("")){
				where.append(" AND C.BBS_WRITER_NM LIKE CONCAT('%',:searchWord,'%')");
			}
			if(searchVO.getMinePostYN() == 'Y'){
				where.append(" AND C.BBS_WRITER_ID LIKE CONCAT('%',:userId,'%')");
			}
			if(searchVO.getBoardType().equals(BbsConstant.QNA_CODE) && !Character.toString(processStatus).equals(" ")){
				where.append(" AND C.QNA_STATUS LIKE CONCAT('%',:processStatus,'%')");
			}
			if(!referenceType.equals("")){
				where.append(" AND C.BBS_CATEGORY_SUB = :referenceType ");
			}
			if(emergencyYn.equals("Y")){
				where.append(" AND C.BBS_EMERGENCY_YN = 'Y'");
			}
			if(searchWord!=null && !searchWord.equals("")){
				if(searchTypes!=null && searchTypes.length > 0){
					where.append(" AND (");
					for(int i=0; i<searchTypes.length;i++){
						if(i!=0){
							where.append(" OR ");
						}
						where.append(" C.BBS_"+searchTypes[i]+" LIKE CONCAT('%',:searchWord,'%')");
					}
					where.append(")");
				}
			}
		}
		
		query.append(where).append(" ORDER BY RNK, ORDER_DT DESC, ORDER_ID, BBS_REG_DT LIMIT :startNum,:size");
			
		
		Query queryObj = entityManager.createNativeQuery(query.toString(),BdapBbs.class);
		queryObj.setParameter("boardType", searchVO.getBoardType());
		
		if(searchVO.getCategory().equals("") 
				&& searchVO.getCategorySub().equals("") 
				&& searchVO.getStartDate().equals("") 
				&& searchVO.getSearchWord().equals("")
				&& searchVO.getProcessStatus() == ' '
				&& searchVO.getMinePostYN() == 'N'
				&& searchVO.getEmergencyYn().equals("")
				){
		}else{
			//공지사항검색
			String categorySub = searchVO.getCategorySub();
			String startDate = searchVO.getStartDate()+" 00:00:00";
			String endDate = searchVO.getEndDate()+" 23:59:59";
			String searchType = searchVO.getSearchType();
			String searchTypes[] = searchVO.getSearchTypes();
			String searchWord = searchVO.getSearchWord();
			String userId = searchVO.getUserId();
			
			//qna검색
			char processStatus = searchVO.getProcessStatus();
			//자료실1,2,3 검색
			String referenceType = searchVO.getReferenceType();
			
			startDate = startDate.replaceAll("\\/", "-");
			endDate = endDate.replaceAll("\\/", "-");
			if(!category.equals("")){
				queryObj.setParameter("category", category);
			}
			if(!categorySub.equals("")){
				queryObj.setParameter("categorySub", categorySub);
			}
			if(searchType.equals("TITLE") && !searchWord.equals("")){
				queryObj.setParameter("searchWord", searchWord);
			}
			if(searchType.equals("WRITER") && !searchWord.equals("")){
				queryObj.setParameter("categorySub", categorySub);
			}
			if(searchType.equals("CONTENT") && !searchWord.equals("")){
				queryObj.setParameter("searchWord", searchWord);
			}
			if(!searchVO.getStartDate().equals("")){
				queryObj.setParameter("startDate", startDate);
				queryObj.setParameter("endDate", endDate);
			}
			//notice는 writer, qna는 wirternm으로 되어있음..
			if(searchType.equals("WRITERNM") && !searchWord.equals("")){
				queryObj.setParameter("searchWord", searchWord);
			}
			if(searchVO.getMinePostYN() == 'Y'){
				queryObj.setParameter("userId", userId);
			}
			if(searchVO.getBoardType().equals(BbsConstant.QNA_CODE) && !Character.toString(processStatus).equals(" ")){
				queryObj.setParameter("processStatus", processStatus);
			}
			if(!referenceType.equals("")){
				queryObj.setParameter("referenceType", referenceType);
			}
			if(searchTypes!=null && searchTypes.length > 0){
				if(searchWord!=null && !searchWord.equals("")){
					if(searchTypes!=null && searchTypes.length > 0){
						queryObj.setParameter("searchWord", searchWord);
					}
				}
			}
		}
		
		queryObj.setParameter("startNum", startNum);
		queryObj.setParameter("size", size);
		
		return queryObj.getResultList();
	}

	@Override
	public Long countBdapBbs(SearchVO searchVO) {
		searchVO.setCategory(searchVO.nullTrim(searchVO.getCategory()));
		searchVO.setCategorySub(searchVO.nullTrim(searchVO.getCategorySub()));
		searchVO.setReferenceType(searchVO.nullTrim(searchVO.getReferenceType()));
		searchVO.setEmergencyYn(searchVO.nullTrim(searchVO.getEmergencyYn()));
		searchVO.setStartDate(searchVO.nullTrim(searchVO.getStartDate()));
		searchVO.setSearchWord(searchVO.nullTrim(searchVO.getSearchWord()));
		
		StringBuffer query = new StringBuffer();
		
		if(searchVO.getBoardType().equals(BbsConstant.QNA_CODE)){
			query.append(" SELECT COUNT(*) FROM ("
					+ "SELECT A.BBS_ID AS ORDER_ID, BBS_REG_DT AS ORDER_DT, A.*, D.QNA_STATUS "
					+ "FROM BDAP_BBS A, BDAP_QNA D WHERE A.BBS_ID=D.BBS_ID "
					+ "AND A.BBS_PARENT_BBS_ID  IS NULL AND A.BBS_TYPE = :boardType"
					+ " UNION ALL "
					+ "SELECT B.BBS_PARENT_BBS_ID AS ORDER_ID, LV1.BBS_REG_DT AS ORDER_DT, B.*, NULL AS 'QNA_STATUS' "
					+ "FROM BDAP_BBS B, BDAP_BBS LV1 "
					+ "WHERE B.BBS_PARENT_BBS_ID = LV1.BBS_ID "
					+ "AND B.BBS_PARENT_BBS_ID  IS NOT NULL "
					+ "AND B.BBS_TYPE = :boardType"
							+ ") C WHERE BBS_DELETED_YN = 'N' ");
		}else{
			query.append(" SELECT COUNT(*) FROM ("
					+ "SELECT BBS_ID AS ORDER_ID, BBS_REG_DT AS ORDER_DT, A.* FROM BDAP_BBS A WHERE A.BBS_PARENT_BBS_ID  IS NULL AND A.BBS_TYPE = :boardType"
					+ " UNION ALL "
					+ "SELECT B.BBS_PARENT_BBS_ID AS ORDER_ID, LV1.BBS_REG_DT AS ORDER_DT, B.* "
					+ "FROM BDAP_BBS B, BDAP_BBS LV1 "
					+ "WHERE B.BBS_PARENT_BBS_ID = LV1.BBS_ID "
					+ "AND B.BBS_PARENT_BBS_ID  IS NOT NULL "
					+ "AND B.BBS_TYPE = :boardType"
							+ ") C WHERE BBS_DELETED_YN = 'N' ");
		}
		
		StringBuffer where = new StringBuffer();
		
		if(searchVO.getCategory().equals("") 
				&& searchVO.getCategorySub().equals("") 
				&& searchVO.getStartDate().equals("") 
				&& searchVO.getSearchWord().equals("")
				&& searchVO.getProcessStatus() == ' '
				&& searchVO.getMinePostYN() == 'N'
				&& searchVO.getReferenceType().equals("")
				&& searchVO.getEmergencyYn().equals("")
				){
		}else{
			//공지사항검색
			String category = searchVO.getCategory(); 
			String categorySub = searchVO.getCategorySub();
			String startDate = searchVO.getStartDate()+" 00:00:00";
			String endDate = searchVO.getEndDate()+" 23:59:59";
			String searchType = searchVO.getSearchType();
			String searchTypes [] = searchVO.getSearchTypes();
			String searchWord = searchVO.getSearchWord();
			String emergencyYn = searchVO.getEmergencyYn();
			//qna검색
			char processStatus = searchVO.getProcessStatus();
			String userId = searchVO.getUserId();
			//자료실1,2,3 검색
			String referenceType = searchVO.getReferenceType();
			
			startDate = startDate.replaceAll("\\/", "-");
			endDate = endDate.replaceAll("\\/", "-");
			
			if(!category.equals("")){
				where.append(" AND C.BBS_CATEGORY LIKE CONCAT('%',:category,'%')");
			}
			if(!categorySub.equals("")){
				where.append(" AND C.BBS_CATEGORY_SUB LIKE CONCAT('%',:categorySub,'%')");
			}
			if(searchType.equals("TITLE") && !searchWord.equals("")){
				where.append(" AND C.BBS_TITLE LIKE CONCAT('%',:searchWord,'%')");
			}
			if(searchType.equals("WRITER") && !searchWord.equals("")){
				where.append(" AND C.BBS_WRITER_NM LIKE CONCAT('%',:searchWord,'%')");
			}
			if(searchType.equals("CONTENT") && !searchWord.equals("")){
				where.append(" AND C.BBS_CONTENT LIKE CONCAT('%',:searchWord,'%')");
			}
			if(!searchVO.getStartDate().equals("")){
				where.append(" AND C.BBS_REG_DT BETWEEN :startDate AND :endDate");
			}
			//notice는 writer, qna는 wirternm으로 되어있음..
			if(searchType.equals("WRITERNM") && !searchWord.equals("")){
				where.append(" AND C.BBS_WRITER_NM LIKE CONCAT('%',:searchWord,'%')");
			}
			if(searchVO.getMinePostYN() == 'Y'){
				where.append(" AND C.BBS_WRITER_ID LIKE CONCAT('%',:userId,'%')");
			}
			if(searchVO.getBoardType().equals(BbsConstant.QNA_CODE) && !Character.toString(processStatus).equals(" ")){
				where.append(" AND C.QNA_STATUS LIKE CONCAT('%',:processStatus,'%')");
			}
			if(!referenceType.equals("")){
				where.append(" AND C.BBS_CATEGORY_SUB LIKE CONCAT('%',:referenceType,'%')");
			}
			if(emergencyYn.equals("Y")){
				where.append(" AND C.BBS_EMERGENCY_YN = 'Y'");
			}
			if(searchWord!=null && !searchWord.equals("")){
				if(searchTypes!=null && searchTypes.length > 0){
					where.append(" AND (");
					for(int i=0; i<searchTypes.length;i++){
						if(i!=0){
							where.append(" OR ");
						}
						where.append(" C.BBS_"+searchTypes[i]+" LIKE CONCAT('%',:searchWord,'%')");
					}
					where.append(")");
				}
			}
	}

	query.append(where);
	
	Query queryObj = entityManager.createNativeQuery(query.toString());
	queryObj.setParameter("boardType", searchVO.getBoardType());
	
	if(searchVO.getCategory().equals("") 
			&& searchVO.getCategorySub().equals("") 
			&& searchVO.getStartDate().equals("") 
			&& searchVO.getSearchWord().equals("")
			&& searchVO.getProcessStatus() == ' '
			&& searchVO.getMinePostYN() == 'N'
			&& searchVO.getEmergencyYn().equals("")
			){
	}else{
		//공지사항검색
		String category = searchVO.getCategory(); 
		String categorySub = searchVO.getCategorySub();
		String startDate = searchVO.getStartDate()+" 00:00:00";
		String endDate = searchVO.getEndDate()+" 23:59:59";
		String searchType = searchVO.getSearchType();
		String searchTypes [] = searchVO.getSearchTypes();
		String searchWord = searchVO.getSearchWord();
		String userId = searchVO.getUserId();
		
		//qna검색
		char processStatus = searchVO.getProcessStatus();
		//자료실1,2,3 검색
		String referenceType = searchVO.getReferenceType();
		
		startDate = startDate.replaceAll("\\/", "-");
		endDate = endDate.replaceAll("\\/", "-");
		if(!category.equals("")){
			queryObj.setParameter("category", category);
		}
		if(!categorySub.equals("")){
			queryObj.setParameter("categorySub", categorySub);
		}
		if(searchType.equals("TITLE") && !searchWord.equals("")){
			queryObj.setParameter("searchWord", searchWord);
		}
		if(searchType.equals("WRITER") && !searchWord.equals("")){
			queryObj.setParameter("searchWord", searchWord);
		}
		if(searchType.equals("CONTENT") && !searchWord.equals("")){
			queryObj.setParameter("searchWord", searchWord);
		}
		if(!searchVO.getStartDate().equals("")){
			queryObj.setParameter("startDate", startDate);
			queryObj.setParameter("endDate", endDate);
		}
		//notice는 writer, qna는 wirternm으로 되어있음..
		if(searchType.equals("WRITERNM") && !searchWord.equals("")){
			queryObj.setParameter("searchWord", searchWord);
		}
		if(searchVO.getMinePostYN() == 'Y'){
			queryObj.setParameter("userId", userId);
		}
		if(searchVO.getBoardType().equals(BbsConstant.QNA_CODE) && !Character.toString(processStatus).equals(" ")){
			queryObj.setParameter("processStatus", processStatus);
		}
		if(!referenceType.equals("")){
			queryObj.setParameter("referenceType", referenceType);
		}
		if(searchTypes!=null && searchTypes.length > 0){
			if(searchWord!=null && !searchWord.equals("")){
				if(searchTypes!=null && searchTypes.length > 0){
					queryObj.setParameter("searchWord", searchWord);
				}
			}
		}
	}
	
	BigInteger count =  (BigInteger)queryObj.getSingleResult();
	return count.longValue();
	}

}
