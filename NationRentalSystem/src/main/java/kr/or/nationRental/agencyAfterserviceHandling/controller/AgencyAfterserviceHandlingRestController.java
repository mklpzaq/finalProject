package kr.or.nationRental.agencyAfterserviceHandling.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.nationRental.agencyAfterserviceHandling.service.AgencyAfterserviceHandlingService;
import kr.or.nationRental.agencyAfterserviceHandling.service.AgencyBusinesstypeDto;

@RestController
public class AgencyAfterserviceHandlingRestController {
	@Autowired
	private AgencyAfterserviceHandlingService agencyAfterserviceHandlingService;
	private static final Logger logger = LoggerFactory.getLogger(AgencyAfterserviceHandlingRestController.class);
	/*
	 * agencyBusinesstypeName 정보를 가지고  agencyBusinesstypeCode를 불러온다.  
	 * */
	@RequestMapping(value="/selectOneAgencyBusinesstypeForAjax", method=RequestMethod.POST)
	public AgencyBusinesstypeDto selectOneAgencyBusinesstypeForAjax(AgencyBusinesstypeDto agencyBusinesstypeDto) {
		logger.debug("★★★★★★★★★★★★★★★★★★★★★★★★★");
		logger.debug("POST selectOneAgencyBusinesstypeForAjax UnitedAfterserviceRequestRestController");
		logger.debug(agencyBusinesstypeDto.toString());
		agencyBusinesstypeDto = agencyAfterserviceHandlingService.selectOneAgencyBusinesstypeForAjax(agencyBusinesstypeDto);
		
		/* 객체를 리턴 */
		
		return agencyBusinesstypeDto;
	}
	
}
