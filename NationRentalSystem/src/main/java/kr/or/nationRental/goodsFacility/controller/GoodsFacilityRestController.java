package kr.or.nationRental.goodsFacility.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.nationRental.agency.service.AgencyDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityCategoryDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityService;
import kr.or.nationRental.unitedAfterserviceRequest.controller.UnitedAfterserviceRequestRestController;
import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestService;

@RestController
public class GoodsFacilityRestController {
	
	@Autowired
	private GoodsFacilityService goodsFacilityService;
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityRestController.class);
	/*
	 * agency 이름을 받아 agencyDto객체를 리턴
	 * */
	@RequestMapping(value="/selectOneGoodsFacilityForAjax", method=RequestMethod.POST)
	public GoodsFacilityCategoryDto selectOneGoodsFacilityCategoryDto(GoodsFacilityCategoryDto goodsFacilityCategoryDto) {
		logger.debug("POST selectOneGoodsFacilityCategoryDto GoodsFacilityRestController");		
		logger.debug(goodsFacilityCategoryDto.toString());
		goodsFacilityCategoryDto = goodsFacilityService.selectOneGoodsFacilityCategoryDtoForAjax(goodsFacilityCategoryDto);
		logger.debug("goodsFacilityCategoryDto "+ goodsFacilityCategoryDto.toString());
				
		return goodsFacilityCategoryDto;
	}
}
