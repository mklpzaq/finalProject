package kr.or.nationRental.annualfeePakage.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.nationRental.annualfeePakage.controller.AnnualfeePakageController;

@Service
public class AnnualfeePakageService {
	
	@Autowired
	private AnnualfeePakageDao annualfeePakageDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AnnualfeePakageService.class);
	
	@Transactional
	public void insertAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageService - insertannualfeePakage - annualfeePakageDto : " + annualfeePakageDto.toString());
		annualfeePakageDao.insertAnnualfeePakage(annualfeePakageDto);
				
		for(int i= 0; i<annualfeePakageDto.getAdminagencyCode().size(); i++) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("adminagencyCode", annualfeePakageDto.getAdminagencyCode().get(i));
			map.put("annualfeePakageCode", annualfeePakageDto.getAnnualfeePakageCode());
			annualfeePakageDao.insertAnnualfeePakageAuthority(map);				
		}		
	}

}
