package kr.or.nationRental.unitedAfterserviceRequest.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public AgencyDto selectOneAgencyForAjax(@RequestParam(value="agencyNameAndBusinesstypeName") String agencyNameAndBusinesstypeName) {
		logger.debug("POST selectOneAgencyForAjax UnitedAfterserviceRequestRestController");
		
		logger.debug("agencyNameAndBusinesstypeName : " + agencyNameAndBusinesstypeName);
		int barPoint = agencyNameAndBusinesstypeName.indexOf("-");
		logger.debug("barPoint : " + barPoint);
		String agencyName = agencyNameAndBusinesstypeName.substring(0, barPoint);
		logger.debug("agencyName : " + agencyName);
		String agencyBusinesstypeName = agencyNameAndBusinesstypeName.substring(barPoint+1);
		logger.debug("agencyBusinesstypeName : " + agencyBusinesstypeName);
		
		AgencyDto agencyDto = new AgencyDto();
		agencyDto.setAgencyName(agencyName);
		agencyDto.setAgencyBusinesstypeName(agencyBusinesstypeName);
		logger.debug("★★★★★★★★★★★Ajax★★★★★★★★★★★★★★★★★");
		logger.debug(agencyDto.toString());
		agencyDto = unitedAfterserviceRequestService.selectOneAgencyForAjax(agencyDto);
		
		/* 객체를 리턴 */
		return agencyDto;
	}
}
