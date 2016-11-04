package com.kt.bdapportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kt.bdapportal.domain.MgmtComputingStat;

@Repository("mgmtComputingStatRepository")
public interface MgmtComputingStatRepository extends JpaRepository<MgmtComputingStat, String>{
	public MgmtComputingStat findTop1ByOrderByStatCreateDtDesc();
	
}
