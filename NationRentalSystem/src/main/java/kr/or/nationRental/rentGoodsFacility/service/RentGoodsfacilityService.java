package kr.or.nationRental.rentGoodsFacility.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityService;

@Service
public class RentGoodsfacilityService {
	
	@Autowired
	private RentGoodsfacilityDao rentGoodsfacilityDao;
	
	private static final Logger logger = LoggerFactory.getLogger(RentGoodsfacilityService.class);
	
	public GoodsFacilityDto insertApplicationRentForm(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("RentGoodsfacilityService insertApplicationRentForm : " + goodsFacilityDto.toString());
		
		goodsFacilityDto = rentGoodsfacilityDao.selectGoodsFacilityInfo(goodsFacilityDto);
		
		return goodsFacilityDto;
	}

}
