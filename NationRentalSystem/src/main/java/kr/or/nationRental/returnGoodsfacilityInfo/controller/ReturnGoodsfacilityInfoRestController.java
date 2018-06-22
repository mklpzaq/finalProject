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
	
	//반납할 시설/물품의 정보들을 불러오는 ajax
	//이미 반납한 시설/물품은 더 이상 반하지 못하게 한다
	@RequestMapping(value="/returnGoodsfacilityInfoCheck", method=RequestMethod.GET)
	public ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoCheck(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("ReturnGoodsfacilityInfoRestController - returnGoodsfacilityInfoCheck - goodsFacilityDto : " + goodsFacilityDto.toString());
		ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto = returnGoodsfacilityInfoService.returnGoodsfacilityInfoCheck(goodsFacilityDto);
		logger.debug("ReturnGoodsfacilityInfoRestController - returnGoodsfacilityInfoCheck - returnGoodsfacilityInfoDto : " + returnGoodsfacilityInfoDto.toString());	
		return returnGoodsfacilityInfoDto;
	}

}
