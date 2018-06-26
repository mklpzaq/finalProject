package kr.or.nationRental.rentalTotalPayment.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityDto;

@Service
public class RentalTotalPaymentService {
	private static final Logger logger = LoggerFactory.getLogger(RentalTotalPaymentService.class);
	@Autowired RentalTotalPaymentDao rentalTotalPaymentDao;
	
	//예약 리스트 저장
	public void insertRentGoodsfacility(RentGoodsfacilityDto rentGoodsfacilityDto) {
		logger.debug("insertRentalTotalPayment : " + rentGoodsfacilityDto.toString());
		rentalTotalPaymentDao.insertRentGoodsfacility(rentGoodsfacilityDto);	
	}
	
	//결제리스트 저장
	public void insertRentalTotalPayment(RentalTotalPaymentDto rentalTotalPaymentDto) {
		logger.debug("insertRentalTotalPayment : " + rentalTotalPaymentDto.toString());
		rentalTotalPaymentDao.insertRentTotalPayment(rentalTotalPaymentDto);
	}
	
	//결제완료리스트
	public List<RentalTotalPaymentDto> selectListRentalTotalPayment() {
		return rentalTotalPaymentDao.selectListRentalTotalPayment();
	}
	
	//환불신청리스트
	public List<RequestRefundDto> selectListRequestRefund() {
		return rentalTotalPaymentDao.selectListRequestRefund();
	}
}
