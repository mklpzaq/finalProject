package kr.or.nationRental.rentalTotalPayment.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityDto;

@Service
public class RentalTotalPaymentService {
	private static final Logger logger = LoggerFactory.getLogger(RentalTotalPaymentService.class);
	@Autowired RentalTotalPaymentDao rentalTotalPaymentDao;
	
	public void insertRentGoodsfacility(RentGoodsfacilityDto rentGoodsfacilityDto) {
		logger.debug("insertRentalTotalPayment : " + rentGoodsfacilityDto.toString());
		rentalTotalPaymentDao.insertRentGoodsfacility(rentGoodsfacilityDto);
		
	}
	
	public void insertRentalTotalPayment(RentalTotalPaymentDto rentalTotalPaymentDto) {
		logger.debug("insertRentalTotalPayment : " + rentalTotalPaymentDto.toString());
		rentalTotalPaymentDao.insertRentTotalPayment(rentalTotalPaymentDto);
		
		}

}
