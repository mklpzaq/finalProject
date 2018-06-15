package kr.or.nationRental.unitedAfterserviceRequest.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoDto;
import kr.or.nationRental.unitedAfterserviceRequest.controller.UnitedAfterserviceRequestController;

@Service
public class UnitedAfterserviceRequestService {
	@Autowired
	private UnitedAfterserviceRequestDao unitedAfterserviceRequestDao;
	private static final Logger logger = LoggerFactory.getLogger(UnitedAfterserviceRequestService.class);
	
	public List<ReturnGoodsfacilityInfoDto> selectListReturnGoodsfacilityInfo(){
		logger.debug("selectListReturnGoodsfacilityInfo UnitedAfterserviceRequestService");
		return unitedAfterserviceRequestDao.selectListReturnGoodsfacilityInfo();
	}
}
