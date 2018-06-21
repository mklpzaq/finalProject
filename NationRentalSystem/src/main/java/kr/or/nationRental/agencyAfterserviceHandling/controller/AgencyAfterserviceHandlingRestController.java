package kr.or.nationRental.agencyAfterserviceHandling.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.nationRental.agency.service.AgencyDto;
import kr.or.nationRental.agencyAfterserviceHandling.service.AgencyAfterserviceHandlingDto;
import kr.or.nationRental.agencyAfterserviceHandling.service.AgencyAfterserviceHandlingService;
import kr.or.nationRental.agencyAfterserviceHandling.service.AgencyBusinesstypeDto;
import kr.or.nationRental.unitedAfterserviceRequest.controller.UnitedAfterserviceRequestRestController;
import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestService;

@RestController
public class AgencyAfterserviceHandlingRestController {
	@Autowired
	private AgencyAfterserviceHandlingService agencyAfterserviceHandlingService;
	private static final Logger logger = LoggerFactory.getLogger(AgencyAfterserviceHandlingRestController.class);
	/*
	 * agencyAfterserviceHandlingDto객체로 넘어온  agencyBusinesstypeCode를 이용해  agencyBusinesstypeName List을 가져온다.
	 * */
	@RequestMapping(value="/selectOneAgencyBusinesstypeForAjax", method=RequestMethod.POST)
	public AgencyBusinesstypeDto selectOneAgencyBusinesstypeForAjax(AgencyBusinesstypeDto agencyBusinesstypeDto) {
		logger.debug("★★★★★★★★★★★★★★★★★★★★★★★★★");
		logger.debug("POST selectOneAgencyBusinesstypeForAjax UnitedAfterserviceRequestRestController");
		logger.debug(agencyBusinesstypeDto.toString());
		/*agencyAfterserviceHandlingDto = agencyAfterserviceHandlingService.selectOneAgencyBusinesstypeForAjax(agencyAfterserviceHandlingDto);*/
		
		/* 객체를 리턴 */
		
		return agencyBusinesstypeDto;
	}
	
}
