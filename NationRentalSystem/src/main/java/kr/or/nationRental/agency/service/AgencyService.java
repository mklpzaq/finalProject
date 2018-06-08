package kr.or.nationRental.agency.service;

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
		logger.debug("AgencyService - insertAgency - memberName : " + memberName.toString());
		logger.debug("AgencyService - insertAgency - agencyDto : " + agencyDto.toString());
		agencyDto.setFunctionaryName(memberName);
		agencyDto.setAdminagencyCode(adminagencyCode);
		
		agencyDao.insertAgency(agencyDto);
	}	
}
