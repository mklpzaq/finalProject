package kr.or.nationRental.goodsFacility.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.citizen.service.CitizenDao;
import kr.or.nationRental.functionary.service.FunctionaryDto;

@Repository
public class GoodsFacilityDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS ="kr.or.nationRental.goodsFacility.service.GoodsFacilityMapper.";	
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityDao.class);
	
	public FunctionaryDto selectadminagency(FunctionaryDto functionaryDto) {
		logger.debug("GoodsFacilityDao selectadminagency :" + functionaryDto.toString());		
		functionaryDto = sqlSession.selectOne(NS+"selectadminagency", functionaryDto);
		return functionaryDto;
	}

	public int insertGoodsFacility(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("GoodsFacilityDao insertGoodsFacility");
		
		int row = sqlSession.insert(NS+"insertGoodsFacility", goodsFacilityDto);
		return row;				
	}

	public List<GoodsFacilityDto> getGoodsFacilityList(Map<String, Object> map) {
		logger.debug("GoodsFacilityDao getGoodsFacilityList");
		return sqlSession.selectList(NS+"getGoodsFacilityList", map);
	}

	public int totalCountGoodsFacility(Map<String, Object> map) {
		logger.debug("GoodsFacilityDao totalCountCitizen");
		return sqlSession.selectOne(NS+"totalCountGoodsFacility", map);
	}
	
	public GoodsFacilityDto selectGoodsFacilityImage(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("GoodsFacilityDao selectGoodsFacilityImage : " + goodsFacilityDto.toString());
		
		return sqlSession.selectOne(NS+"selectGoodsFacilityImage", goodsFacilityDto);
	}

}
