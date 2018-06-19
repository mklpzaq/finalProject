package kr.or.nationRental.eachRentalPaymentInfo.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EachRentalPaymentInfoDao {
	private static final Logger logger = LoggerFactory.getLogger(EachRentalPaymentInfoDao.class);
	@Autowired private SqlSessionTemplate sqlSession;
	final String NS = "kr.or.nationRental.eachRentalPaymentInfo.service.EachRentalPaymentInfoMapper.";
	
	
}
