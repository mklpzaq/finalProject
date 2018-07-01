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
	
	public void updateUnitedAfterserviceRequestForAcceptOrder(AgencyAfterserviceHandlingDto agencyAfterserviceHandlingDto) {
		logger.debug("updateUnitedAfterserviceRequestForAcceptOrder updateUnitedAfterserviceRequestForAcceptOrder");
		sqlSession.update(NS+"updateUnitedAfterserviceRequestForAcceptOrder", agencyAfterserviceHandlingDto);
	}
	
	public void insertAgencyAfterserviceHandling(AgencyAfterserviceHandlingDto agencyAfterserviceHandlingDto) {
		logger.debug("insertAgencyAfterserviceHandling AgencyAfterserviceHandlingDao");
		sqlSession.insert(NS+"insertAgencyAfterserviceHandling", agencyAfterserviceHandlingDto);
	}
	
	public AgencyBusinesstypeDto selectOneAgencyBusinesstypeForAjax(AgencyBusinesstypeDto agencyBusinesstypeDto) {
		logger.debug("selectOneAgencyBusinesstypeForAjax AgencyAfterserviceHandlingDao");
		return sqlSession.selectOne(NS+"selectOneAgencyBusinesstypeForAjax", agencyBusinesstypeDto);
	}
	
	
	
	
	
	
	public List<AgencyAfterserviceHandlingDto> selectOneAgencyAfterserviceHandlingDtoForAgencyEmployee(AgencyAfterserviceHandlingDto agencyAfterserviceHandlingDto) {
		logger.debug("selectOneAgencyAfterserviceHandlingDtoForAgencyEmployee AgencyAfterserviceHandlingDao");
		return sqlSession.selectList(NS+"selectOneAgencyAfterserviceHandlingDtoForAgencyEmployee", agencyAfterserviceHandlingDto);
	}

	
	
	
	
	
	
	public List<AgencyBusinesstypeDto> selectListAgencyBusinesstypeDto(UnitedAfterserviceRequestDto unitedAfterserviceRequestDto){
		logger.debug("selectListAgencyBusinesstypeDto AgencyAfterserviceHandlingDao");
		return sqlSession.selectList(NS+"selectListAgencyBusinesstypeDto", unitedAfterserviceRequestDto);
	}
	
	public UnitedAfterserviceRequestDto selectOneUnitedAfterserviceRequestDto(UnitedAfterserviceRequestDto unitedAfterserviceRequestDto) {
		logger.debug("selectOneUnitedAfterserviceRequestDto AgencyAfterserviceHandlingDao");
		return sqlSession.selectOne(NS+"selectOneUnitedAfterserviceRequestDto", unitedAfterserviceRequestDto);
	}
	
	public int totalCountUnitedAfterserviceRequestDto(Map<String, Object> map) {
		logger.debug("totalCountUnitedAfterserviceRequestDto AgencyAfterserviceHandlingDao");
		return sqlSession.selectOne(NS+"totalCountUnitedAfterserviceRequestDto", map);
	}
	
	public List<UnitedAfterserviceRequestDto> selectListUnitedAfterserviceRequest(Map<String, Object> map) {
		logger.debug("selectListUnitedAfterserviceRequest AgencyAfterserviceHandlingDao");
		return sqlSession.selectList(NS+"selectListUnitedAfterserviceRequest", map);
	}
	
}
