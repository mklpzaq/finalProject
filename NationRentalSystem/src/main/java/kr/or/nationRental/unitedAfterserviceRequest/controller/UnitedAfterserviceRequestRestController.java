package kr.or.nationRental.unitedAfterserviceRequest.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.nationRental.agency.service.AgencyDto;
import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestService;


@RestController
public class UnitedAfterserviceRequestRestController {
	@Autowired
	private UnitedAfterserviceRequestService unitedAfterserviceRequestService;
	private static final Logger logger = LoggerFactory.getLogger(UnitedAfterserviceRequestRestController.class);
	/*
	 * agency 이름을 받아 agencyDto객체를 리턴
	 * */
	@RequestMapping(value="/selectOneAgencyForAjax", method=RequestMethod.POST)
	public String selectOneAgencyForAjax(AgencyDto agencyDto) {
		logger.debug("POST idCheck AgencyEmployeeRestController");
		logger.debug(agencyDto.toString());
		
		
		/*String result = agencyEmployeeService.idCheck(agencyEmployeeDto);*/
		
		return null;
	}
}
