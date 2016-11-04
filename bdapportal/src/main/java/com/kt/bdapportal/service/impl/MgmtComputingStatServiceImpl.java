package com.kt.bdapportal.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.bdapportal.domain.MgmtComputingStat;
import com.kt.bdapportal.repository.MgmtComputingStatRepository;
import com.kt.bdapportal.service.MgmtComputingStatService;

@Service("mgmtComputingStatService")
public class MgmtComputingStatServiceImpl implements MgmtComputingStatService {

	@Autowired
	private MgmtComputingStatRepository mgmtComputingStatRepository;

	@Override
	public MgmtComputingStat getComputingNode() {
		return mgmtComputingStatRepository.findTop1ByOrderByStatCreateDtDesc();
	}

}
