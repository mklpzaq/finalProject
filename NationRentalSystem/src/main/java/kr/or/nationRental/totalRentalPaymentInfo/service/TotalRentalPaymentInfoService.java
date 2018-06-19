package kr.or.nationRental.totalRentalPaymentInfo.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityDto;

@Service
public class TotalRentalPaymentInfoService {
	@Autowired private TotalRentalPaymentInfoDao totalRentalPaymentInfoDao;
	private static final Logger logger = LoggerFactory.getLogger(TotalRentalPaymentInfoService.class);
	
	//총결제코드 생성
	public int insertTotalRentalPaymentInfo(TotalRentalPaymentInfoDto totalRentalPaymentInfoDto) {
		logger.debug("insertTotalRentalPaymentInfo");
		return totalRentalPaymentInfoDao.insertTotalRentalPaymentInfo(totalRentalPaymentInfoDto);
	}
	
	//예약 목록과 총 결제
	public List<TotalRentalPaymentInfoDto> selectTotalRentalPaymentInfo() {
		logger.debug("selectTotalRentalPaymentInfo");
		return totalRentalPaymentInfoDao.selectTotalRentalPaymentInfo();
	}
	
	//총결제 목록에 대여금액 계속 더해서 업데이트해주기
		public int updateTotalRentalPaymentInfo(TotalRentalPaymentInfoDto totalRentalPaymentInfoDto)  {	
			logger.info("updateTotalRentalPaymentInfo");
			for() {
				
			}
			
			
			return totalRentalPaymentInfoDao.updateTotalRentalPaymentInfo(totalRentalPaymentInfoDto); 
		}

}