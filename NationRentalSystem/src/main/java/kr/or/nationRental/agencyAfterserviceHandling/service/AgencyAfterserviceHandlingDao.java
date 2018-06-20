package kr.or.nationRental.agencyAfterserviceHandling.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestDto;

@Repository
public class AgencyAfterserviceHandlingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AgencyAfterserviceHandlingDao.class);
	final String NS = "kr.or.nationRental.agencyAfterserviceHandling.service.AgencyAfterserviceHandlingMapper.";
	
	public int totalCountUnitedAfterserviceRequestDto(Map<String, Object> map) {
		logger.debug("totalCountUnitedAfterserviceRequestDto AgencyAfterserviceHandlingDao");
		return sqlSession.selectOne(NS+"totalCountUnitedAfterserviceRequestDto", map);
	}
	
	public List<UnitedAfterserviceRequestDto> selectListUnitedAfterserviceRequest(Map<String, Object> map) {
		logger.debug("selectListUnitedAfterserviceRequest AgencyAfterserviceHandlingDao");
		return sqlSession.selectList(NS+"selectListUnitedAfterserviceRequest", map);
	}
	
}
