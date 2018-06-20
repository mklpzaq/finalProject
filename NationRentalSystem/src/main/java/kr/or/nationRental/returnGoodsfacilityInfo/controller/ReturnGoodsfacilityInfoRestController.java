package kr.or.nationRental.returnGoodsfacilityInfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoDto;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoService;


@RestController
public class ReturnGoodsfacilityInfoRestController {
	
	@Autowired ReturnGoodsfacilityInfoService returnGoodsfacilityInfoService;	

	private static final Logger logger = LoggerFactory.getLogger(ReturnGoodsfacilityInfoRestController.class);
	
	@RequestMapping(value="/returnGoodsfacilityInfoCheck", method=RequestMethod.GET)
	public ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoCheck(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("ReturnGoodsfacilityInfoRestController - returnGoodsfacilityInfoCheck - goodsFacilityDto : " + goodsFacilityDto.toString());
		ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto = returnGoodsfacilityInfoService.returnGoodsfacilityInfoCheck(goodsFacilityDto);
		logger.debug("ReturnGoodsfacilityInfoRestController - returnGoodsfacilityInfoCheck - returnGoodsfacilityInfoDto : " + returnGoodsfacilityInfoDto.toString());	
		return returnGoodsfacilityInfoDto;
	}

}
