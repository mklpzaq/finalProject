package kr.or.nationRental.unitedAfterserviceRequest.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoDto;
import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestService;

@Controller
public class UnitedAfterserviceRequestController {
	@Autowired
	private UnitedAfterserviceRequestService unitedAfterserviceRequestService;
	private static final Logger logger = LoggerFactory.getLogger(UnitedAfterserviceRequestController.class);
	
	@RequestMapping(value="/selectListReturnGoodsfacilityInfoForAfterService", method=RequestMethod.GET)
	public String selectListReturnGoodsfacilityInfoForAfterService(FunctionaryDto FunctionaryDto) {
		logger.debug("GET selectListReturnGoodsfacilityInfoForAfterService UnitedAfterserviceRequestController");
		logger.debug(FunctionaryDto.toString());
		
		List<ReturnGoodsfacilityInfoDto> list = unitedAfterserviceRequestService.selectListReturnGoodsfacilityInfo();
		logger.debug("★★★★★★★★★★★★★★★★★★★★★★");
		logger.debug(list.toString());
		
		
		
		
		return "unitedAfterserviceRequest/selectListReturnGoodsfacilityInfoForAfterService";
	}
}
