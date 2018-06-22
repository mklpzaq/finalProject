package kr.or.nationRental.rentalTotalPayment.service;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.agency.service.AgencyBusinesstypeDto;
import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityDto;


@Repository
public class RentalTotalPaymentDao {
	private static final Logger logger = LoggerFactory.getLogger(RentalTotalPaymentDao.class);
	final String NS = "kr.or.nationRental.rentalTotalPayment.service.RentalTotalPaymentMapper.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//예약리스트 저장
	public int insertRentGoodsfacility(RentGoodsfacilityDto rentGoodsfacilityDto) {
		logger.debug("insertRentGoodsfacility : " + rentGoodsfacilityDto.toString());
		int row = sqlSession.insert(NS+"insertRentGoodsfacility", rentGoodsfacilityDto);
		return row;
	}
	
	//계약리스트 저장
	public int insertRentTotalPayment(RentalTotalPaymentDto rentalTotalPaymentDto) {
		logger.debug("insertRentTotalPayment : " + rentalTotalPaymentDto.toString());
		int row = sqlSession.insert(NS+"insertRentTotalPayment", rentalTotalPaymentDto);
		return row;
	}

}
