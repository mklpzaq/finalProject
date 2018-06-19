package kr.or.nationRental.eachRentalPaymentInfo.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityDao;


@Service
public class EachRentalPaymentInfoService {
	@Autowired EachRentalPaymentInfoDao eachRentalPaymentInfoDao;
	@Autowired RentGoodsfacilityDao rentGoodsfacilityDao;
	private static final Logger logger = LoggerFactory.getLogger(EachRentalPaymentInfoService.class);

	
}
