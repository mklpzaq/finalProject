package kr.or.nationRental.goodsFacility.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityService;

@Controller
public class GoodsFacilityController {
	/*@Autowired 
	private GoodsFacilityService goodsFacilityService;*/
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityController.class);
	
	@RequestMapping(value="/getGoodsFacilityList", method=RequestMethod.GET)
	public String getGoodsFacilityList() {
		logger.debug("GET getGoodsFacilityList GoodsFacilityController");
		
		return "rentalGoodsFacility/rentalGoodsFacilityList";
	}
	
	@RequestMapping(value="/insertGoodsFacility", method=RequestMethod.GET)
	public String insertGoodsFacility(FunctionaryDto functionaryDto) {
		
		return "/rentalGoodsFacility/insertGoodsFacilityForm";
	}
}
