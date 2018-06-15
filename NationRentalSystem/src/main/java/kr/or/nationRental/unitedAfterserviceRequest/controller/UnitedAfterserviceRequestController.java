package kr.or.nationRental.unitedAfterserviceRequest.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.functionary.service.FunctionaryDto;

@Controller
public class UnitedAfterserviceRequestController {
	/*@Autowired
	private AgencyEmployeeService agencyEmployeeService;*/
	private static final Logger logger = LoggerFactory.getLogger(UnitedAfterserviceRequestController.class);
	
	@RequestMapping(value="/insertUnitedAfterserviceRequest", method=RequestMethod.GET)
	public String insertUnitedAfterserviceRequest(FunctionaryDto FunctionaryDto) {
		logger.debug("GET insertUnitedAfterserviceRequest UnitedAfterserviceRequestController");
		logger.debug(FunctionaryDto.toString());
		
		return "unitedAfterserviceRequest/insertUnitedAfterserviceRequestForm";
	}
}
