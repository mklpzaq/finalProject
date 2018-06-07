package kr.or.nationRental.citizen.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CitizenService {
	
	@Autowired
	private CitizenDao citizenDao;

	private static final Logger logger = LoggerFactory.getLogger(CitizenService.class);
	
	public void insertCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenService insertCitizen : " + citizenDto.toString());
		
		citizenDao.insertCitizen(citizenDto);
		
	}
	
	
	
}
