package kr.or.nationRental.agency.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AgencyService {
	
	@Autowired
	private AgencyDao agencyDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AgencyService.class);

	public void insertAgency(AgencyDto agencyDto, String memberName, int adminagencyCode) {
		logger.debug("AgencyService - insertAgency - adminagencyCode : " + adminagencyCode);
		logger.debug("AgencyService - insertAgency - memberName : " + memberName.toString());
		logger.debug("AgencyService - insertAgency - agencyDto : " + agencyDto.toString());
		agencyDto.setFunctionaryName(memberName);
		agencyDto.setAdminagencyCode(adminagencyCode);
		
		agencyDao.insertAgency(agencyDto);
	}
	
	
	public List<AgencyDto> selectListContractAgency(int adminagencyCode) {
		logger.debug("AgencyService - selectListContractAgency - adminagencyCode : " + adminagencyCode);
		List<AgencyDto> agencyDto = agencyDao.selectListContractAgency(adminagencyCode);
		logger.debug("AgencyService - selectListContractAgency - agencyDto : " + agencyDto);
			
		return agencyDto;
	}
	
	public List<AgencyDto> selectListContractClosedAgency(int adminagencyCode) {
		logger.debug("AgencyService - selectListContractClosedAgency - adminagencyCode : " + adminagencyCode);
		List<AgencyDto> agencyDto = agencyDao.selectListContractClosedAgency(adminagencyCode);
		logger.debug("AgencyService - selectListContractClosedAgency - agencyDto : " + agencyDto);
			
		return agencyDto;
	}
}
