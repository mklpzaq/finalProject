package kr.or.nationRental.annualfeePakage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.nationRental.annualfeePakage.controller.AnnualfeePakageController;
import kr.or.nationRental.functionary.service.FunctionaryDto;

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

	
	public Map<String, Object> selectListFunctionary(int currentPage, int pagePerRow, String searchOption,
			String keyword) {
		
		int beginRow = (currentPage-1)*pagePerRow; 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);/*
		map.put("loginMemberId", loginMemberId);*/
		
		List<AnnualfeePakageDto> list = annualfeePakageDao.selectListAnnualfeePakage(map);
		logger.debug("AnnualfeePakageService - selectListAnnualfeePakage - list  : " + list.toString());
		int total = annualfeePakageDao.totalCountAnnualfeePakage(map);
		logger.debug("AnnualfeePakageService - totalCountAnnualfeePakage - total  : " + total);
			
		int lastPage = 0;
		if(total%pagePerRow == 0) {
			lastPage = total/pagePerRow;
		}else {
			lastPage = total/pagePerRow + 1;
		}
		
		int pageView = 5;
		int startPage = ((currentPage-1)/5)*5+1; 
		int endPage = startPage + pageView -1; 
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		returnmap.put("list", list);
		returnmap.put("lastPage", lastPage);
		returnmap.put("startPage", startPage);
		returnmap.put("endPage", endPage);
		
		return returnmap;
	}

}
