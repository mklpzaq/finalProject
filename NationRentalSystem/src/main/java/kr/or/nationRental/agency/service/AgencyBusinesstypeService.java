package kr.or.nationRental.agency.service;

import java.util.List;

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
	public List<AgencyBusinesstypeDto> selectListAgencyBusinesstype() {
		logger.info("---selectListAgencyBusinesstype");
		return agencyBusinesstypeDao.selectListAgencyBusinesstype();
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
