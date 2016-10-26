package com.kt.bdapportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.MgmtTblChkStat;


@Repository("mgmtTblChkStatRepository")
public interface MgmtTblChkStatRepository extends JpaRepository<MgmtTblChkStat, String>{
	
	@Query(value="SELECT * FROM MGMT_TBL_CHK_STAT WHERE TBL_NM=?1 ", nativeQuery = true)
	public List<MgmtTblChkStat> mgmtTblChkStatList(String tblNm);		
	
	
	
}
