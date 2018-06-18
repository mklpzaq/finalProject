package kr.or.nationRental.rentGoodsFacility.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.goodsFacility.service.GoodsFacilityDao;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;

@Repository
public class RentGoodsfacilityDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS ="kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityMapper.";
	private static final Logger logger = LoggerFactory.getLogger(RentGoodsfacilityDao.class);
	
	public GoodsFacilityDto selectGoodsFacilityInfo(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("RentGoodsfacilityDao selectGoodsFacilityInfo : " + goodsFacilityDto.toString());
		goodsFacilityDto = sqlSession.selectOne(NS+"selectGoodsFacilityInfo", goodsFacilityDto);
		return goodsFacilityDto;
	}

}
