package kr.or.nationRental.totalRentalPaymentInfo.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class TotalRentalPaymentInfoDao {
	private static final Logger logger = LoggerFactory.getLogger(TotalRentalPaymentInfoDao.class);
	@Autowired private SqlSessionTemplate sqlSession;
	final String NS = "kr.or.nationRental.totalRentalPaymentInfo.service.TotalRentalPaymentInfoMapper.";
	
	//총결제코드 생성
	public int insertTotalRentalPaymentInfo(TotalRentalPaymentInfoDto totalRentalPaymentInfoDto) {
		logger.info("---insertTotalRentalPaymentInfo");
		int row = sqlSession.insert(NS+"insertTotalRentalPaymentInfo", totalRentalPaymentInfoDto);
		return row;
	}
	
	//예약 목록과 총 결제
	public List<TotalRentalPaymentInfoDto> selectTotalRentalPaymentInfo() {
		logger.info("---selectTotalRentalPaymentInfo");
		return sqlSession.selectList(NS+"selectTotalRentalPaymentInfo");
	}
	
}
