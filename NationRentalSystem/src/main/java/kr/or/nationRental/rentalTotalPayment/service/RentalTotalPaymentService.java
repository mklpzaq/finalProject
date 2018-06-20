package kr.or.nationRental.rentalTotalPayment.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.goodsFacility.service.GoodsFacilityCategoryDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;
import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityDto;

@Service
public class RentalTotalPaymentService {
	private static final Logger logger = LoggerFactory.getLogger(RentalTotalPaymentService.class);
	@Autowired RentalTotalPaymentDao rentalTotalPaymentDao;
	
	/*//RentGoodsfacilityDto 리스트를 가져오는 작업
	public List<RentGoodsfacilityDto> getRentGoodsfacilityDtoList() {
		logger.debug("---getRentGoodsfacilityDtoList");
		return rentalTotalPaymentDao.getRentGoodsfacilityDtoList();	
	}*/

}
