package kr.or.nationRental.agency.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.goodsFacility.service.GoodsFacilityCategoryDto;

@Service
public class AgencyBusinesstypeService {
	private static final Logger logger = LoggerFactory.getLogger(AgencyBusinesstypeService.class);
	@Autowired private AgencyBusinesstypeDao agencyBusinesstypeDao;

	//대행업체 업종 목록
	public Map<String, Object> selectListAgencyBusinesstype(int currentPage, int pagePerRow, String searchOption, String keyword) {
		logger.debug("selectListGoodsFacilityCategory - currentPage : " + currentPage);
		logger.debug("selectListGoodsFacilityCategory - pagePerRow  : " + pagePerRow);
		logger.debug("selectListGoodsFacilityCategory - searchOption  : " + searchOption);
		logger.debug("selectListGoodsFacilityCategory - keyword  : " + keyword);
		
		int beginRow = (currentPage-1)*pagePerRow; 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);/*
		map.put("loginMemberId", loginMemberId);*/
		
		List<AgencyBusinesstypeDto> list = agencyBusinesstypeDao.selectListAgencyBusinesstype(map);
		logger.debug("selectListGoodsFacilityCategory - list  : " + list.toString());
		int total = agencyBusinesstypeDao.totalCountAgencyBusinesstype(map);
		logger.debug("selectListGoodsFacilityCategory - total  : " + total);
			
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
	
	
	//업종 등록하기
	public int insertAgencyBusinesstype(AgencyBusinesstypeDto agencyBusinesstypeDto) {
		logger.info("---insertAgencyBusinesstype");
		return agencyBusinesstypeDao.insertAgencyBusinesstype(agencyBusinesstypeDto);
	}
	
	//업종 수정 폼 불러오기
	public AgencyBusinesstypeDto updateAgencyBusinesstypeForm(AgencyBusinesstypeDto agencyBusinesstypeDto)  {	
		logger.info("updateAgencyBusinesstypeForm");
				
		return agencyBusinesstypeDao.updateAgencyBusinesstypeForm(agencyBusinesstypeDto); 
	}
	
	//업종 수정
	public int updateAgencyBusinesstype(AgencyBusinesstypeDto agencyBusinesstypeDto)  {	
		logger.info("updateAgencyBusinesstype");
		return agencyBusinesstypeDao.updateAgencyBusinesstype(agencyBusinesstypeDto);
	}
	
	//업종 삭제
	public void deleteAgencyBusinesstype(AgencyBusinesstypeDto agencyBusinesstypeCode) {
		agencyBusinesstypeDao.deleteAgencyBusinesstype(agencyBusinesstypeCode);
	}	
}
